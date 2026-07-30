import .AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure CrystallographyPackage where
  latticeStructure : Prop
  symmetryGroup : Prop
  grainBoundaries : Prop
  dislocationDensity : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeStructureClosed : C.latticeStructure
  symmetryGroupClosed : C.symmetryGroup
  grainBoundariesClosed : C.grainBoundaries
  dislocationDensityClosed : C.dislocationDensity

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeStructure ∧ C.symmetryGroup ∧ C.grainBoundaries ∧ C.dislocationDensity

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.latticeStructureClosed (And.intro E.symmetryGroupClosed (And.intro E.grainBoundariesClosed E.dislocationDensityClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse