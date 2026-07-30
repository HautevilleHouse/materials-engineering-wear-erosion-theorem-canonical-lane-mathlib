import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearErosionCoreDefinitions

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure AdhesionDelaminationPackage (S : WearErosionState) where
  adhesionWorkDone : Prob
  delaminationCrackNucleation : Prob
  criticalShearStressReached : Prob
  transferLayerFormed : Prob

structure AdhesionDelaminationEvidence {S : WearErosionState}
  (P : AdhesionDelaminationPackage S) where
  adhesionWorkDoneClosed : P.adhesionWorkDone
  delaminationCrackNucleationClosed : P.delaminationCrackNucleation
  criticalShearStressReachedClosed : P.criticalShearStressReached
  transferLayerFormedClosed : P.transferLayerFormed

def AdhesionDelaminationClosed {S : WearErosionState}
  (P : AdhesionDelaminationPackage S) : Prop :=
  P.adhesionWorkDone ∧ P.delaminationCrackNucleation ∧
  P.criticalShearStressReached ∧ P.transferLayerFormed

theorem adhesion_delamination_closed_from_evidence
  {S : WearErosionState} (P : AdhesionDelaminationPackage S)
  (E : AdhesionDelaminationEvidence P) : AdhesionDelaminationClosed P := by
  exact And.intro E.adhesionWorkDoneClosed
    (And.intro E.delaminationCrackNucleationClosed
      (And.intro E.criticalShearStressReachedClosed
        E.transferLayerFormedClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse