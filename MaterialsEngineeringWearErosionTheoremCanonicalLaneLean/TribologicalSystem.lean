import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure TribologicalSystem where
  contactMechanics: Prop
  frictionCoefficient: Prop
  lubricationRegime: Prop
  surfaceRoughness: Prop

structure TribologicalEvidence (T: TribologicalSystem) where
  contactMechanicsClosed: T.contactMechanics
  frictionCoefficientClosed: T.frictionCoefficient
  lubricationRegimeClosed: T.lubricationRegime
  surfaceRoughnessClosed: T.surfaceRoughness

def TribologicalSystemClosed (T: TribologicalSystem): Prop :=
  T.contactMechanics ∧ T.frictionCoefficient ∧ T.lubricationRegime ∧ T.surfaceRoughness

theorem tribological_system_closed_from_evidence (T: TribologicalSystem) (E: TribologicalEvidence T): TribologicalSystemClosed T := by
  exact And.intro E.contactMechanicsClosed (And.intro E.frictionCoefficientClosed (And.intro E.lubricationRegimeClosed E.surfaceRoughnessClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse
