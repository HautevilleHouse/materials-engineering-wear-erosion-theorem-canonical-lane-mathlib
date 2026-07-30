import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearErosionCoreDefinitions

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure ErosiveWearRatePackage (S : WearErosionState) where
  particleImpactFrequency : Prop
  kineticEnergyTransfer : Prop
  brittleFractureInitiation : Prop
  ductileCuttingMechanism : Prop

structure ErosiveWearRateEvidence {S : WearErosionState}
  (P : ErosiveWearRatePackage S) where
  particleImpactFrequencyClosed : P.particleImpactFrequency
  kineticEnergyTransferClosed : P.kineticEnergyTransfer
  brittleFractureInitiationClosed : P.brittleFractureInitiation
  ductileCuttingMechanismClosed : P.ductileCuttingMechanism

def ErosiveWearRateClosed {S : WearErosionState}
  (P : ErosiveWearRatePackage S) : Prop :=
  P.particleImpactFrequency ∧ P.kineticEnergyTransfer ∧
  P.brittleFractureInitiation ∧ P.ductileCuttingMechanism

theorem erosive_wear_rate_closed_from_evidence
  {S : WearErosionState} (P : ErosiveWearRatePackage S)
  (E : ErosiveWearRateEvidence P) : ErosiveWearRateClosed P := by
  exact And.intro E.particleImpactFrequencyClosed
    (And.intro E.kineticEnergyTransferClosed
      (And.intro E.brittleFractureInitiationClosed
        E.ductileCuttingMechanismClosed))

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse