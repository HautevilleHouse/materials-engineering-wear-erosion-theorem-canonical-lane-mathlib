import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure SurfaceWearModel where
  materialHardness: Prop
  abrasiveParticleSize: Prop
  impactVelocity: Prop
  wearRateFactor: Prop

structure SurfaceWearEvidence (S: SurfaceWearModel) where
  materialHardnessClosed: S.materialHardness
  abrasiveParticleSizeClosed: S.abrasiveParticleSize
  impactVelocityClosed: S.impactVelocity
  wearRateFactorClosed: S.wearRateFactor

def SurfaceWearModelClosed (S: SurfaceWearModel): Prop :=
  S.materialHardness ∧ S.abrasiveParticleSize ∧ S.impactVelocity ∧ S.wearRateFactor

theorem surface_wear_model_closed_from_evidence (S: SurfaceWearModel) (E: SurfaceWearEvidence S): SurfaceWearModelClosed S := by
  exact And.intro E.materialHardnessClosed (And.intro E.abrasiveParticleSizeClosed (And.intro E.impactVelocityClosed E.wearRateFactorClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse
