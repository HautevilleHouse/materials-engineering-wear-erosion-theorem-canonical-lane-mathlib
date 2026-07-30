import .FractureMechanicsPackage

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure WearErosionPackage {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} {F : FractureMechanicsPackage C P E} where
  abrasiveWearRate : Prop
  erosiveWearRate : Prop
  wearMechanismMap : Prop
  surfaceTopography : Prop

structure WearErosionEvidence {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} {F : FractureMechanicsPackage C P E} (W : WearErosionPackage C P E F) where
  abrasiveWearRateClosed : W.abrasiveWearRate
  erosiveWearRateClosed : W.erosiveWearRate
  wearMechanismMapClosed : W.wearMechanismMap
  surfaceTopographyClosed : W.surfaceTopography

def WearErosionClosed {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} {F : FractureMechanicsPackage C P E} (W : WearErosionPackage C P E F) : Prop :=
  W.abrasiveWearRate ∧ W.erosiveWearRate ∧ W.wearMechanismMap ∧ W.surfaceTopography

theorem wear_erosion_closed_from_evidence {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} {F : FractureMechanicsPackage C P E} (W : WearErosionPackage C P E F) (Ev : WearErosionEvidence W) :
    WearErosionClosed W := by
  exact And.intro Ev.abrasiveWearRateClosed (And.intro Ev.erosiveWearRateClosed (And.intro Ev.wearMechanismMapClosed Ev.surfaceTopographyClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse