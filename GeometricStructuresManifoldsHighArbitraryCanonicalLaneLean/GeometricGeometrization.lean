import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GeometricGeometrizationPackage {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} {E : GeometricEntropyPackage F}
    {C : GeometricCanonicalNeighborhoodsPackage E} where
  thickThinDecomposition : Prop
  finiteExtinctionAlternative : Prop
  geometricPiecesClassified : Prop
  simplyConnectedCaseForcesModel : Prop

structure GeometricGeometrizationEvidence {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} {E : GeometricEntropyPackage F}
    {C : GeometricCanonicalNeighborhoodsPackage E}
    (Z : GeometricGeometrizationPackage C) where
  thickThinDecompositionClosed : Z.thickThinDecomposition
  finiteExtinctionAlternativeClosed : Z.finiteExtinctionAlternative
  geometricPiecesClassifiedClosed : Z.geometricPiecesClassified
  simplyConnectedCaseForcesModelClosed : Z.simplyConnectedCaseForcesModel

def GeometricGeometrizationClosed {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} {E : GeometricEntropyPackage F}
    {C : GeometricCanonicalNeighborhoodsPackage E}
    (Z : GeometricGeometrizationPackage C) : Prop :=
  Z.thickThinDecomposition ∧ Z.finiteExtinctionAlternative ∧ Z.geometricPiecesClassified ∧ Z.simplyConnectedCaseForcesModel

theorem geometric_geometrization_closed_from_evidence
    {G : HighArbitraryConnectionPackage} {F : GeometricFlowPDEPackage G}
    {E : GeometricEntropyPackage F} {C : GeometricCanonicalNeighborhoodsPackage E}
    (Z : GeometricGeometrizationPackage C) (Ev : GeometricGeometrizationEvidence Z) :
    GeometricGeometrizationClosed Z := by
  exact And.intro Ev.thickThinDecompositionClosed
    (And.intro Ev.finiteExtinctionAlternativeClosed
      (And.intro Ev.geometricPiecesClassifiedClosed Ev.simplyConnectedCaseForcesModelClosed))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
