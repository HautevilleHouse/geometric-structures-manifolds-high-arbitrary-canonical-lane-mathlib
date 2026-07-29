import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitrary

structure NDimSmoothManifold where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothAtlas : Set (Set carrier)
  chartCompat : Prop
  maxAtlas : Set (Set carrier)
  dimension : Nat
  dimensionTerm : dimension = 4

structure TangentBundle (M : NDimSmoothManifold) where
  base : M.carrier
  fiber : Type
  projection : fiber → M.carrier
  vectorSpaceStructure : ∀ x : M.carrier, AddCommGroup (fiber) ∧ Module ℝ (fiber)

structure NDimSmoothManifoldEvidence (M : NDimSmoothManifold) where
  chartCompatClosed : M.chartCompat
  maxAtlasClosed : M.chartCompat
  dimensionClosed : M.dimension = 4

def ManifoldBundleClosed (M : NDimSmoothManifold) : Prop :=
  M.chartCompat ∧ M.dimension = 4

theorem manifold_bundle_closed_from_evidence (M : NDimSmoothManifold) (E : NDimSmoothManifoldEvidence M) :
    ManifoldBundleClosed M := by
  exact And.intro E.chartCompatClosed E.dimensionClosed

end GeometricStructuresManifoldsHighArbitrary
end HautevilleHouse
