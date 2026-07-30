import .PhaseDiagramPackage

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure ElasticityPackage {C : CrystallographyPackage} {P : PhaseDiagramPackage C} where
  stressStrainRelation : Prop
  elasticModuli : Prop
  yieldCriterion : Prop
  plasticDeformation : Prop

structure ElasticityEvidence {C : CrystallographyPackage} {P : PhaseDiagramPackage C} (E : ElasticityPackage C P) where
  stressStrainRelationClosed : E.stressStrainRelation
  elasticModuliClosed : E.elasticModuli
  yieldCriterionClosed : E.yieldCriterion
  plasticDeformationClosed : E.plasticDeformation

def ElasticityClosed {C : CrystallographyPackage} {P : PhaseDiagramPackage C} (E : ElasticityPackage C P) : Prop :=
  E.stressStrainRelation ∧ E.elasticModuli ∧ E.yieldCriterion ∧ E.plasticDeformation

theorem elasticity_closed_from_evidence {C : CrystallographyPackage} {P : PhaseDiagramPackage C} (E : ElasticityPackage C P) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.stressStrainRelationClosed (And.intro Ev.elasticModuliClosed (And.intro Ev.yieldCriterionClosed Ev.plasticDeformationClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse