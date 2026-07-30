import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure WearRateModel where
  contactPressure : ℝ
  slidingVelocity : ℝ
  hardness : ℝ
  wearCoefficient : ℝ
  wearRate : ℝ := wearCoefficient * contactPressure * slidingVelocity / hardness
  wearRateDerived : wearRate = wearCoefficient * contactPressure * slidingVelocity / hardness

structure WearRateModelEvidence (M : WearRateModel) where
  contactPressureClosed : M.contactPressure > 0
  slidingVelocityClosed : M.slidingVelocity > 0
  hardnessClosed : M.hardness > 0
  wearCoefficientClosed : M.wearCoefficient > 0
  wearRateComputed : M.wearRateDerived

def WearRateModelClosed (M : WearRateModel) : Prop :=
  M.contactPressure > 0 ∧ M.slidingVelocity > 0 ∧ M.hardness > 0 ∧ M.wearCoefficient > 0 ∧ M.wearRateDerived

theorem wear_rate_model_closed_from_evidence (M : WearRateModel) (E : WearRateModelEvidence M) :
    WearRateModelClosed M := by
  exact And.intro E.contactPressureClosed
    (And.intro E.slidingVelocityClosed
      (And.intro E.hardnessClosed
        (And.intro E.wearCoefficientClosed E.wearRateComputed)))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse