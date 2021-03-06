//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CreateDisplacedProblemAction.h"
#include "MooseApp.h"
#include "FEProblem.h"
#include "DisplacedProblem.h"
#include "NonlinearSystem.h"
#include "AuxiliarySystem.h"
#include "RelationshipManager.h"

registerMooseAction("MooseApp", CreateDisplacedProblemAction, "init_displaced_problem");
registerMooseAction("MooseApp", CreateDisplacedProblemAction, "add_geometric_rm");
registerMooseAction("MooseApp", CreateDisplacedProblemAction, "add_algebraic_rm");
registerMooseAction("MooseApp", CreateDisplacedProblemAction, "add_coupling_rm");

defineLegacyParams(CreateDisplacedProblemAction);

InputParameters
CreateDisplacedProblemAction::validParams()
{
  InputParameters params = Action::validParams();
  params.addParam<std::vector<std::string>>(
      "displacements",
      "The variables corresponding to the x y z displacements of the mesh.  If "
      "this is provided then the displacements will be taken into account during "
      "the computation. Creation of the displaced mesh can be suppressed even if "
      "this is set by setting 'use_displaced_mesh = false'.");
  params.addParam<bool>(
      "use_displaced_mesh",
      true,
      "Create the displaced mesh if the 'displacements' "
      "parameter is set. If this is 'false', a displaced mesh will not be created, "
      "regardless of whether 'displacements' is set.");

  return params;
}

CreateDisplacedProblemAction::CreateDisplacedProblemAction(InputParameters parameters)
  : Action(parameters)
{
}

void
CreateDisplacedProblemAction::addProxyRelationshipManagers(SystemBase & to,
                                                           SystemBase & from,
                                                           Moose::RelationshipManagerType rm_type,
                                                           std::string type)
{
  auto rm_params = _factory.getValidParams("ProxyRelationshipManager");

  rm_params.set<bool>("attach_geometric_early") = false;
  rm_params.set<MooseMesh *>("mesh") = &to.mesh();
  rm_params.set<System *>("other_system") = &from.system();
  rm_params.set<std::string>("for_whom") = "DisplacedMesh";
  rm_params.set<Moose::RelationshipManagerType>("rm_type") = rm_type;

  rm_params.set<bool>("use_displaced_mesh") = to.subproblem().name() == "DisplacedProblem";

  if (rm_params.areAllRequiredParamsValid())
  {
    auto rm_obj = _factory.create<RelationshipManager>(
        "ProxyRelationshipManager",
        to.subproblem().name() + "<-" + from.subproblem().name() + "_" + from.system().name() +
            "_" + type + "_proxy",
        rm_params);

    if (!_app.addRelationshipManager(rm_obj))
      _factory.releaseSharedObjects(*rm_obj);
  }
  else
    mooseError("Invalid initialization of ProxyRelationshipManager");
}

void
CreateDisplacedProblemAction::addProxyAlgebraicRelationshipManagers(SystemBase & to,
                                                                    SystemBase & from)
{
  addProxyRelationshipManagers(to, from, Moose::RelationshipManagerType::ALGEBRAIC, "algebraic");
}

void
CreateDisplacedProblemAction::addProxyGeometricRelationshipManagers(SystemBase & to,
                                                                    SystemBase & from)
{
  addProxyRelationshipManagers(to, from, Moose::RelationshipManagerType::GEOMETRIC, "geometric");
}

void
CreateDisplacedProblemAction::act()
{
  if (isParamValid("displacements") && getParam<bool>("use_displaced_mesh"))
  {
    if (_current_task == "init_displaced_problem")
    {
      if (!_displaced_mesh)
        mooseError("displacements were set but a displaced mesh wasn't created!");

      // Define the parameters
      InputParameters object_params = _factory.getValidParams("DisplacedProblem");
      object_params.set<std::vector<std::string>>("displacements") =
          getParam<std::vector<std::string>>("displacements");
      object_params.set<MooseMesh *>("mesh") = _displaced_mesh.get();
      object_params.set<FEProblemBase *>("_fe_problem_base") = _problem.get();
      object_params.set<bool>("default_ghosting") = _problem->defaultGhosting();

      // Create the object
      std::shared_ptr<DisplacedProblem> disp_problem =
          _factory.create<DisplacedProblem>("DisplacedProblem", "DisplacedProblem", object_params);

      // Add the Displaced Problem to FEProblemBase
      _problem->addDisplacedProblem(disp_problem);
    }

    if (_current_task == "add_geometric_rm")
      // We can't do anything at this time because the systems haven't been created
      // but we do need to tell the mesh to hang onto extra elements just in case
      _mesh->getMesh().allow_remote_element_removal(false);

    if (_current_task == "add_algebraic_rm")
    {
      auto & undisplaced_nl = _problem->getNonlinearSystemBase();
      auto & undisplaced_aux = _problem->getAuxiliarySystem();

      auto displaced_problem_ptr = _problem->getDisplacedProblem();

      auto & displaced_nl = displaced_problem_ptr->nlSys();
      auto & displaced_aux = displaced_problem_ptr->auxSys();

      // Note that there is no reason to copy coupling factors back and forth because the displaced
      // systems do not have their own matrices (they are constructed with their libMesh::System of
      // type TransientExplicitSystem)

      // Note the "to" system doesn't actually matter much - the GF will
      // get added to both systems on the receiving side
      addProxyAlgebraicRelationshipManagers(undisplaced_nl, displaced_nl);
      addProxyAlgebraicRelationshipManagers(displaced_nl, undisplaced_nl);
      addProxyAlgebraicRelationshipManagers(undisplaced_aux, displaced_aux);
      addProxyAlgebraicRelationshipManagers(displaced_aux, undisplaced_aux);

      addProxyGeometricRelationshipManagers(undisplaced_nl, displaced_nl);
      addProxyGeometricRelationshipManagers(displaced_nl, undisplaced_nl);

      // When adding the geometric relationship mangers we told the mesh not to allow remote element
      // removal during the initial MeshBase::prepare_for_use call. If we're using a distributed
      // mesh we need to make sure we now allow remote element removal and then delete the remote
      // elmeents after the EquationSystems init
      if (_mesh->isDistributedMesh())
      {
        _mesh->needsRemoteElemDeletion(true);
        if (_displaced_mesh)
          _displaced_mesh->needsRemoteElemDeletion(true);
      }
    }
  }
}
