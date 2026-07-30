import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearRateModel

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure FatigueWearModel (M : WearRateModel) where
  stressCycles : ℕ
  fatigueStrengthCoeff : ℝ
  fatigueWearRate : ℝ := fatigueStrengthCoeff * (M.contactPressure^2) / (M.hardness * (stressCycles : ℝ))
  fatigueWearRateDerived : fatigueWearRate = fatigueStrengthCoeff * (M.contactPressure^2) / (M.hardness * (stressCycles : ℝ))

structure FatigueWearModelEvidence {M : WearRateModel} (F : FatigueWearModel M) where
  stressCyclesClosed : F.stressCycles > 0
  fatigueStrengthCoeffClosed : F.fatigueStrengthCoeff > 0
  fatigueWearRateComputed : F.fatigueWearRateDerived

def FatigueWearModelClosed {M : WearRateModel} (F : FatigueWearModel M) : Prop :=
  F.stressCycles > 0 ∧ F.fatigueStrengthCoeff > 0 ∧ F.fatigueWearRateDerived

theorem fatigue_wear_model_closed_from_evidence {M : WearRateModel} (F : FatigueWearModel M) (E : FatigueWearModelEvidence F) :
    FatigueWearModelClosed F := by
  exact And.intro E.stressCyclesClosed
    (And.intro E.fatigueStrengthCoeffClosed E.fatigueWearRateComputed)

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse