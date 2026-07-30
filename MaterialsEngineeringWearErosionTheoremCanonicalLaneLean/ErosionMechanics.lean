import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure ErosionMechanicsPackage where
  particleKinematics: Prop
  surfaceImpactDynamics: Prop
  materialRemovalMechanism: Prop
  deformationWearRatio: Prop

structure ErosionMechanicsEvidence (E: ErosionMechanicsPackage) where
  particleKinematicsClosed: E.particleKinematics
  surfaceImpactDynamicsClosed: E.surfaceImpactDynamics
  materialRemovalMechanismClosed: E.materialRemovalMechanism
  deformationWearRatioClosed: E.deformationWearRatio

def ErosionMechanicsClosed (E: ErosionMechanicsPackage): Prop :=
  E.particleKinematics ∧ E.surfaceImpactDynamics ∧ E.materialRemovalMechanism ∧ E.deformationWearRatio

theorem erosion_mechanics_closed_from_evidence (E: ErosionMechanicsPackage) (Ev: ErosionMechanicsEvidence E): ErosionMechanicsClosed E := by
  exact And.intro Ev.particleKinematicsClosed (And.intro Ev.surfaceImpactDynamicsClosed (And.intro Ev.materialRemovalMechanismClosed Ev.deformationWearRatioClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse
