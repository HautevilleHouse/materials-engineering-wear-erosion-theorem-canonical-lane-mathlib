import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure ErosionModel where
  particleVelocity : ℝ
  particleMass : ℝ
  impactAngle : ℝ
  targetHardness : ℝ
  erosionRate : ℝ := particleMass * particleVelocity^2 * Real.sin impactAngle / (2 * targetHardness)
  erosionRateDerived : erosionRate = particleMass * particleVelocity^2 * Real.sin impactAngle / (2 * targetHardness)

structure ErosionModelEvidence (E : ErosionModel) where
  particleVelocityClosed : E.particleVelocity > 0
  particleMassClosed : E.particleMass > 0
  impactAngleClosed : E.impactAngle > 0 ∧ E.impactAngle < π/2
  targetHardnessClosed : E.targetHardness > 0
  erosionRateComputed : E.erosionRateDerived

def ErosionModelClosed (E : ErosionModel) : Prop :=
  E.particleVelocity > 0 ∧ E.particleMass > 0 ∧ (E.impactAngle > 0 ∧ E.impactAngle < π/2) ∧ E.targetHardness > 0 ∧ E.erosionRateDerived

theorem erosion_model_closed_from_evidence (E : ErosionModel) (Ev : ErosionModelEvidence E) :
    ErosionModelClosed E := by
  exact And.intro Ev.particleVelocityClosed
    (And.intro Ev.particleMassClosed
      (And.intro Ev.impactAngleClosed
        (And.intro Ev.targetHardnessClosed Ev.erosionRateComputed)))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse