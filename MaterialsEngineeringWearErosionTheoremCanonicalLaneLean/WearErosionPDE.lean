import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure WearErosionPDEPackage where
  timeParameter : Type u
  depthAt : timeParameter → Type v
  initialProfile : Prop
  wearEquation : Prop
  erosionFluxModel : Prop

structure WearErosionPDEEvidence (F : WearErosionPDEPackage) where
  initialProfileClosed : F.initialProfile
  wearEquationClosed : F.wearEquation
  erosionFluxModelClosed : F.erosionFluxModel

def WearErosionPDEClosed (F : WearErosionPDEPackage) : Prop :=
  F.initialProfile ∧ F.wearEquation ∧ F.erosionFluxModel

theorem wear_erosion_pde_closed_from_evidence
    (F : WearErosionPDEPackage) (E : WearErosionPDEEvidence F) :
    WearErosionPDEClosed F := by
  exact And.intro E.initialProfileClosed
    (And.intro E.wearEquationClosed E.erosionFluxModelClosed)

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse