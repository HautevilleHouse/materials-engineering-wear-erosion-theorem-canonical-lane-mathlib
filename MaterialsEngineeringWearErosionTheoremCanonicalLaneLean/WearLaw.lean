import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure WearLaw where
  archardEquation: Prop
  erosionRateEquation: Prop
  thresholdEnergy: Prop
  cumulativeDamageRule: Prop

structure WearLawEvidence (W: WearLaw) where
  archardEquationClosed: W.archardEquation
  erosionRateEquationClosed: W.erosionRateEquation
  thresholdEnergyClosed: W.thresholdEnergy
  cumulativeDamageRuleClosed: W.cumulativeDamageRule

def WearLawClosed (W: WearLaw): Prop :=
  W.archardEquation ∧ W.erosionRateEquation ∧ W.thresholdEnergy ∧ W.cumulativeDamageRule

theorem wear_law_closed_from_evidence (W: WearLaw) (E: WearLawEvidence W): WearLawClosed W := by
  exact And.intro E.archardEquationClosed (And.intro E.erosionRateEquationClosed (And.intro E.thresholdEnergyClosed E.cumulativeDamageRuleClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse
