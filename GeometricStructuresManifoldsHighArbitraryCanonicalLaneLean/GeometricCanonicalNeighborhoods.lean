import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GeometricCanonicalNeighborhoodsPackage {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} {E : GeometricEntropyPackage F} where
  highCurvatureModelClassified : Prop
  neckOrCapDecomposition : Prop
  persistenceUnderFlow : Prop
  surgeryScaleControl : Prop

structure GeometricCanonicalNeighborhoodsEvidence
    {G : HighArbitraryConnectionPackage} {F : GeometricFlowPDEPackage G}
    {E : GeometricEntropyPackage F} (C : GeometricCanonicalNeighborhoodsPackage E) where
  highCurvatureModelClassifiedClosed : C.highCurvatureModelClassified
  neckOrCapDecompositionClosed : C.neckOrCapDecomposition
  persistenceUnderFlowClosed : C.persistenceUnderFlow
  surgeryScaleControlClosed : C.surgeryScaleControl

def GeometricCanonicalNeighborhoodsClosed
    {G : HighArbitraryConnectionPackage} {F : GeometricFlowPDEPackage G}
    {E : GeometricEntropyPackage F} (C : GeometricCanonicalNeighborhoodsPackage E) : Prop :=
  C.highCurvatureModelClassified ∧ C.neckOrCapDecomposition ∧ C.persistenceUnderFlow ∧ C.surgeryScaleControl

theorem geometric_canonical_neighborhoods_closed_from_evidence
    {G : HighArbitraryConnectionPackage} {F : GeometricFlowPDEPackage G}
    {E : GeometricEntropyPackage F} (C : GeometricCanonicalNeighborhoodsPackage E)
    (Ev : GeometricCanonicalNeighborhoodsEvidence C) :
    GeometricCanonicalNeighborhoodsClosed C := by
  exact And.intro Ev.highCurvatureModelClassifiedClosed
    (And.intro Ev.neckOrCapDecompositionClosed
      (And.intro Ev.persistenceUnderFlowClosed Ev.surgeryScaleControlClosed))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
