import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearErosionCoreDefinitions

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure ThermomechanicalCouplingPackage (S : WearErosionState) where
  thermalSoftening : Prop
  phaseTransformation : Prop
  stressEnhancedDiffusion : Prop
  thermalActivationOfWear : Prop

structure ThermomechanicalCouplingEvidence {S : WearErosionState}
  (P : ThermomechanicalCouplingPackage S) where
  thermalSofteningClosed : P.thermalSoftening
  phaseTransformationClosed : P.phaseTransformation
  stressEnhancedDiffusionClosed : P.stressEnhancedDiffusion
  thermalActivationOfWearClosed : P.thermalActivationOfWear

def ThermomechanicalCouplingClosed {S : WearErosionState}
  (P : ThermomechanicalCouplingPackage S) : Prop :=
  P.thermalSoftening ∧ P.phaseTransformation ∧
  P.stressEnhancedDiffusion ∧ P.thermalActivationOfWear

theorem thermomechanical_coupling_closed_from_evidence
  {S : WearErosionState} (P : ThermomechanicalCouplingPackage S)
  (E : ThermomechanicalCouplingEvidence P) : ThermomechanicalCouplingClosed P := by
  exact And.intro E.thermalSofteningClosed
    (And.intro E.phaseTransformationClosed
      (And.intro E.stressEnhancedDiffusionClosed
        E.thermalActivationOfWearClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse