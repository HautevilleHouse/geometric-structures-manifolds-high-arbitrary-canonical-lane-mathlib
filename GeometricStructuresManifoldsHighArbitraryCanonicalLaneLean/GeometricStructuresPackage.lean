import canonicalLaneMathlib.AdmissibleClass

/-!
# Geometric Structures Package for Manifolds of High Arbitrary Dimension
-/

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GeometricStructuresPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  riemannianMetric : Prop
  pseudoRiemannianMetric : Prop
  complexStructure : Prop
  symplecticForm : Prop
  gStructure : Prop
  geometricStructureAdmissible : Prop

structure GeometricStructuresEvidence (G : GeometricStructuresPackage) where
  smoothStructureClosed : G.smoothStructure
  riemannianMetricClosed : G.riemannianMetric
  pseudoRiemannianMetricClosed : G.pseudoRiemannianMetric
  complexStructureClosed : G.complexStructure
  symplecticFormClosed : G.symplecticForm
  gStructureClosed : G.gStructure
  geometricStructureAdmissibleClosed : G.geometricStructureAdmissible

def GeometricStructuresClosed (G : GeometricStructuresPackage) : Prop :=
  G.smoothStructure ∧ G.riemannianMetric ∧ G.pseudoRiemannianMetric ∧
  G.complexStructure ∧ G.symplecticForm ∧ G.gStructure ∧
  G.geometricStructureAdmissible

theorem geometric_structures_closed_from_evidence (G : GeometricStructuresPackage)
    (E : GeometricStructuresEvidence G) : GeometricStructuresClosed G := by
  refine And.intro E.smoothStructureClosed ?_
  refine And.intro E.riemannianMetricClosed ?_
  refine And.intro E.pseudoRiemannianMetricClosed ?_
  refine And.intro E.complexStructureClosed ?_
  refine And.intro E.symplecticFormClosed ?_
  refine And.intro E.gStructureClosed E.geometricStructureAdmissibleClosed

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse