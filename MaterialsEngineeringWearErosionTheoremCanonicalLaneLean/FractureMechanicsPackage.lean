import .ElasticityPackage

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure FractureMechanicsPackage {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} where
  crackPropagation : Prop
  fractureToughness : Prop
  fatigueBehavior : Prop
  stressIntensityFactor : Prop

structure FractureMechanicsEvidence {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} (F : FractureMechanicsPackage C P E) where
  crackPropagationClosed : F.crackPropagation
  fractureToughnessClosed : F.fractureToughness
  fatigueBehaviorClosed : F.fatigueBehavior
  stressIntensityFactorClosed : F.stressIntensityFactor

def FractureMechanicsClosed {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} (F : FractureMechanicsPackage C P E) : Prop :=
  F.crackPropagation ∧ F.fractureToughness ∧ F.fatigueBehavior ∧ F.stressIntensityFactor

theorem fracture_mechanics_closed_from_evidence {C : CrystallographyPackage} {P : PhaseDiagramPackage C} {E : ElasticityPackage C P} (F : FractureMechanicsPackage C P E) (Ev : FractureMechanicsEvidence F) :
    FractureMechanicsClosed F := by
  exact And.intro Ev.crackPropagationClosed (And.intro Ev.fractureToughnessClosed (And.intro Ev.fatigueBehaviorClosed Ev.stressIntensityFactorClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse