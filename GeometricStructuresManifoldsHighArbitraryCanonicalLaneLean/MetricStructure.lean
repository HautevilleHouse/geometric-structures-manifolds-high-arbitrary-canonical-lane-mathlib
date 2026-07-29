import canonicalLaneMathlib.AdmissibleClass
import GeometricStructuresManifoldsHighArbitrary.ManifoldBundle

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitrary

structure VectorField (M : NDimSmoothManifold) where
  section : M.carrier → TangentFiber M
  smooth : Prop

def TangentFiber (M : NDimSmoothManifold) (x : M.carrier) : Type := sorry

structure MetricStructure (M : NDimSmoothManifold) where
  metricTensor : ∀ (x : M.carrier), (TangentFiber M x) → (TangentFiber M x) → ℝ
  positiveDefinite : Prop
  smoothDependence : Prop

structure MetricStructureEvidence (M : NDimSmoothManifold) (g : MetricStructure M) where
  positiveDefiniteClosed : g.positiveDefinite
  smoothDependenceClosed : g.smoothDependence

def MetricStructureClosed (M : NDimSmoothManifold) (g : MetricStructure M) : Prop :=
  g.positiveDefinite ∧ g.smoothDependence

theorem metric_structure_closed_from_evidence (M : NDimSmoothManifold) (g : MetricStructure M) (E : MetricStructureEvidence M g) :
    MetricStructureClosed M g := by
  exact And.intro E.positiveDefiniteClosed E.smoothDependenceClosed

end GeometricStructuresManifoldsHighArbitrary
end HautevilleHouse
