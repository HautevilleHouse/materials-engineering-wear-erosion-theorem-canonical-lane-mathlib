import WearErosionLaw

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

def ConstrainedWearErosionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_wear_erosion_endgame (A : AdmissibleClass) : ConstrainedWearErosionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse