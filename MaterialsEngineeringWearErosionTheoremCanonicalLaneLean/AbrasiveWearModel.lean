import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearRateModel

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure AbrasiveWearModel (M : WearRateModel) where
  abrasiveParticleSize : ℝ
  abrasiveHardness : ℝ
  abrasiveWearCoeff : ℝ
  abrasiveWearRate : ℝ := abrasiveWearCoeff * abrasiveParticleSize * M.contactPressure * M.slidingVelocity / abrasiveHardness
  abrasiveWearRateDerived : abrasiveWearRate = abrasiveWearCoeff * abrasiveParticleSize * M.contactPressure * M.slidingVelocity / abrasiveHardness

structure AbrasiveWearModelEvidence {M : WearRateModel} (A : AbrasiveWearModel M) where
  abrasiveParticleSizeClosed : A.abrasiveParticleSize > 0
  abrasiveHardnessClosed : A.abrasiveHardness > 0
  abrasiveWearCoeffClosed : A.abrasiveWearCoeff > 0
  abrasiveWearRateComputed : A.abrasiveWearRateDerived

def AbrasiveWearModelClosed {M : WearRateModel} (A : AbrasiveWearModel M) : Prop :=
  A.abrasiveParticleSize > 0 ∧ A.abrasiveHardness > 0 ∧ A.abrasiveWearCoeff > 0 ∧ A.abrasiveWearRateDerived

theorem abrasive_wear_model_closed_from_evidence {M : WearRateModel} (A : AbrasiveWearModel M) (E : AbrasiveWearModelEvidence A) :
    AbrasiveWearModelClosed A := by
  exact And.intro E.abrasiveParticleSizeClosed
    (And.intro E.abrasiveHardnessClosed
      (And.intro E.abrasiveWearCoeffClosed E.abrasiveWearRateComputed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse