import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure WearErosionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure WearErosionAdmittedObject where
  space : WearErosionSpace
  stressField : Prop
  wearRateLaw : Prop
  erodentFluxControlled : Prop
  erosionModel : Type
  erosionTopology : TopologicalSpace erosionModel
  wearLawSatisfied : Prop
  conclusion : wearLawSatisfied

structure WearErosionEndgameState where
  object : WearErosionAdmittedObject

def WearErosionWitnessClosed (O : WearErosionAdmittedObject) : Prop :=
  O.wearLawSatisfied

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse