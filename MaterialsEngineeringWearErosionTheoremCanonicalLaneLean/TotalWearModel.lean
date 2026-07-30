import canonicalLaneMathlib.AdmissibleClass
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.WearRateModel
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.AdhesiveWearModel
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.AbrasiveWearModel
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.ErosionModel
import MaterialsEngineeringWearErosionTheoremCanonicalLaneLean.FatigueWearModel

namespace HautevilleHouse
namespace MaterialsEngineeringWearErosionTheoremCanonicalLaneLean

structure TotalWearModel (M : WearRateModel) (A : AdhesiveWearModel M) (B : AbrasiveWearModel M) (E : ErosionModel) (F : FatigueWearModel M) where
  totalWearRate : ℝ := A.adhesiveWearRate + B.abrasiveWearRate + E.erosionRate + F.fatigueWearRate
  totalWearRateDerived : totalWearRate = A.adhesiveWearRate + B.abrasiveWearRate + E.erosionRate + F.fatigueWearRate

structure TotalWearModelEvidence {M : WearRateModel} {A : AdhesiveWearModel M} {B : AbrasiveWearModel M} {E : ErosionModel} {F : FatigueWearModel M} (T : TotalWearModel M A B E F) where
  totalWearRateComputed : T.totalWearRateDerived

def TotalWearModelClosed {M : WearRateModel} {A : AdhesiveWearModel M} {B : AbrasiveWearModel M} {E : ErosionModel} {F : FatigueWearModel M} (T : TotalWearModel M A B E F) : Prop :=
  T.totalWearRateDerived

theorem total_wear_model_closed_from_evidence {M : WearRateModel} {A : AdhesiveWearModel M} {B : AbrasiveWearModel M} {E : ErosionModel} {F : FatigueWearModel M} (T : TotalWearModel M A B E F) (Ev : TotalWearModelEvidence T) :
    TotalWearModelClosed T := by
  exact Ev.totalWearRateComputed

end MaterialsEngineeringWearErosionTheoremCanonicalLaneLean
end HautevilleHouse