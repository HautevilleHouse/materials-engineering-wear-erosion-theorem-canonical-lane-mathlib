import HautevilleHouse.MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure WearErosionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure WearErosionAdmittedObject where
  space : WearErosionSpace
  materialWearRate : Prop
  erosionResistance : Prop
  wearModel : Type
  wearConclusion : wearModel
  conclusion : wearConclusion = wearConclusion

def WearErosionWitnessClosed (O : WearErosionAdmittedObject) : Prop :=
  O.wearConclusion = O.wearConclusion

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

deriving Repr, DecidableEq

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse