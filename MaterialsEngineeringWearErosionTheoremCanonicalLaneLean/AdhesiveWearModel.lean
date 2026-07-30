import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearRateModel

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure AdhesiveWearModel (M : WearRateModel) where
  realContactArea : ℝ
  shearStrength : ℝ
  adhesiveWearCoeff : ℝ
  adhesiveWearRate : ℝ := adhesiveWearCoeff * realContactArea * M.slidingVelocity
  adhesiveWearRateDerived : adhesiveWearRate = adhesiveWearCoeff * realContactArea * M.slidingVelocity

structure AdhesiveWearModelEvidence {M : WearRateModel} (A : AdhesiveWearModel M) where
  realContactAreaClosed : A.realContactArea > 0
  shearStrengthClosed : A.shearStrength > 0
  adhesiveWearCoeffClosed : A.adhesiveWearCoeff > 0
  adhesiveWearRateComputed : A.adhesiveWearRateDerived

def AdhesiveWearModelClosed {M : WearRateModel} (A : AdhesiveWearModel M) : Prop :=
  A.realContactArea > 0 ∧ A.shearStrength > 0 ∧ A.adhesiveWearCoeff > 0 ∧ A.adhesiveWearRateDerived

theorem adhesive_wear_model_closed_from_evidence {M : WearRateModel} (A : AdhesiveWearModel M) (E : AdhesiveWearModelEvidence A) :
    AdhesiveWearModelClosed A := by
  exact And.intro E.realContactAreaClosed
    (And.intro E.shearStrengthClosed
      (And.intro E.adhesiveWearCoeffClosed E.adhesiveWearRateComputed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse