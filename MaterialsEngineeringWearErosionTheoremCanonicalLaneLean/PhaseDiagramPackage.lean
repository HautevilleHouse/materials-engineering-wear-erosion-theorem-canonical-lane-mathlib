import .CrystallographyPackage

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure PhaseDiagramPackage {C : CrystallographyPackage} where
  phaseBoundaries : Prop
  transformationKinetics : Prop
  equilibriumPhases : Prop
  temperaturePressureRange : Prop

structure PhaseDiagramEvidence {C : CrystallographyPackage} (P : PhaseDiagramPackage C) where
  phaseBoundariesClosed : P.phaseBoundaries
  transformationKineticsClosed : P.transformationKinetics
  equilibriumPhasesClosed : P.equilibriumPhases
  temperaturePressureRangeClosed : P.temperaturePressureRange

def PhaseDiagramClosed {C : CrystallographyPackage} (P : PhaseDiagramPackage C) : Prop :=
  P.phaseBoundaries ∧ P.transformationKinetics ∧ P.equilibriumPhases ∧ P.temperaturePressureRange

theorem phase_diagram_closed_from_evidence {C : CrystallographyPackage} (P : PhaseDiagramPackage C) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed (And.intro E.transformationKineticsClosed (And.intro E.equilibriumPhasesClosed E.temperaturePressureRangeClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse