#ifndef POWERLAWCREEP_H
#define POWERLAWCREEP_H

#include "SolidModel.h"

// Forward declarations
class PowerLawCreep;

template<>
InputParameters validParams<PowerLawCreep>();

/**
 * Power-law creep material
 * edot = A(sigma)**n * exp(-Q/(RT))
 */

class PowerLawCreep : public SolidModel
{
public:
  PowerLawCreep( const std::string & name,
                 InputParameters parameters );

protected:

  virtual void initQpStatefulProperties() {}

  Real _coefficient;
  Real _exponent;
  Real _activation_energy;
  Real _gas_constant;

  Real _tolerance;
  unsigned int _max_its;
  bool _output_iteration_info;

  MaterialProperty<SymmTensor> & _creep_strain;

  MaterialProperty<SymmTensor> & _creep_strain_old;


  /// Compute the stress (sigma += deltaSigma)
  virtual void computeStress();

private:

};

#endif //POWERLAWCREEPMATERIAL_H
