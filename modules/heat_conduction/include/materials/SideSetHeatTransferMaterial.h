//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "InterfaceMaterial.h"

#include "Function.h"

// Forward Declarations
class Function;

class SideSetHeatTransferMaterial : public InterfaceMaterial
{
public:
  SideSetHeatTransferMaterial(const InputParameters & parameters);

protected:
  virtual void computeQpProperties() override;

  /// Material conductivity
  const Function & _kgap;
  /// Variable to compute conductivity
  const VariableValue * _Tk;
  /// Gap width
  const Function & _dgap;
  /// Gap bulk temperature
  const Function & _Tb;
  /// Heat transfer coefficients
  const Function & _hp;
  const Function & _hm;
  /// Surface emissivities
  const Function & _eps_p;
  const Function & _eps_m;
  /// Surface reflectivities
  const Function * _rho_p;
  const Function * _rho_m;

  /// Material property handles
  MaterialProperty<Real> & _cond;
  MaterialProperty<Real> & _Tbulk;
  MaterialProperty<Real> & _h_master;
  MaterialProperty<Real> & _h_neighbor;
  MaterialProperty<Real> & _emmissivity_eff_master;
  MaterialProperty<Real> & _emmissivity_eff_neighbor;

  /// Stefan-Boltzmann constant in W/cm^2-K^4
  const Real _sigma;
};
