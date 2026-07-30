import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure ContactInterface where
  interfaceArea : ℝ
  contactPressure : ℝ
  slidingVelocity : ℝ
  interfaceTemperature : ℝ

structure MaterialSurface where
  surfaceRoughness : ℝ
  materialHardness : ℝ
  adhesionCoefficient : ℝ
  delaminationThreshold : ℝ

define WearErosionState where
  interface : ContactInterface
  surface : MaterialSurface
  accumulatedWearDepth : ℝ
  erosionRate : ℝ

structure AdmissibleClass where
  object : WearErosionState
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def WearErosionWitnessClosed (O : WearErosionState) : Prop :=
  O.accumulatedWearDepth ≤ O.surface.delaminationThreshold ∧ O.erosionRate ≥ 0

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse