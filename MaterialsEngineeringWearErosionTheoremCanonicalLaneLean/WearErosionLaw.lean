import FractureMechanics

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure WearErosionPackage (F : FractureToughnessPackage) where
  wearMechanism : Prop
  erosionRate : Prop
  particleFlux : Prop
  impactEnergy : Prop
  materialRemoval : Prop

structure WearErosionEvidence {F : FractureToughnessPackage} (W : WearErosionPackage F) where
  wearMechanismClosed : W.wearMechanism
  erosionRateClosed : W.erosionRate
  particleFluxClosed : W.particleFlux
  impactEnergyClosed : W.impactEnergy
  materialRemovalClosed : W.materialRemoval

def WearErosionClosed {F : FractureToughnessPackage} (W : WearErosionPackage F) : Prop :=
  W.wearMechanism ∧ W.erosionRate ∧ W.particleFlux ∧ W.impactEnergy ∧ W.materialRemoval

theorem wear_erosion_closed_from_evidence {F : FractureToughnessPackage} (W : WearErosionPackage F) (E : WearErosionEvidence W) : WearErosionClosed W := by
  exact And.intro E.wearMechanismClosed (And.intro E.erosionRateClosed (And.intro E.particleFluxClosed (And.intro E.impactEnergyClosed E.materialRemovalClosed)))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse