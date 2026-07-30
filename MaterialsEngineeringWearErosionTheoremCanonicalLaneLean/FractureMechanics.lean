import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure FractureToughnessPackage where
  material : Type
  crackGeometry : Prop
  stressIntensityFactor : Prop
  kIC : Prop
  fractureInitiation : Prop

structure FractureToughnessEvidence (F : FractureToughnessPackage) where
  crackGeometryClosed : F.crackGeometry
  stressIntensityFactorClosed : F.stressIntensityFactor
  kICClosed : F.kIC
  fractureInitiationClosed : F.fractureInitiation

def FractureToughnessClosed (F : FractureToughnessPackage) : Prop :=
  F.crackGeometry ∧ F.stressIntensityFactor ∧ F.kIC ∧ F.fractureInitiation

theorem fracture_toughness_closed_from_evidence (F : FractureToughnessPackage) (E : FractureToughnessEvidence F) : FractureToughnessClosed F := by
  exact And.intro E.crackGeometryClosed (And.intro E.stressIntensityFactorClosed (And.intro E.kICClosed E.fractureInitiationClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse