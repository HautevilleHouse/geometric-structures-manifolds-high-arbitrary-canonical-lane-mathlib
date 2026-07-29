import canonicalLaneMathlib.AdmissibleClass
import GeometricStructuresManifoldsHighArbitrary.MetricStructure

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitrary

structure RiemannianMetric (M : NDimSmoothManifold) where
  innerProduct : ∀ x : M.carrier, Inner ℝ (TangentFiber M x)
  smoothPositiveDefinite : Prop

structure LeviCivitaConnection (M : NDimSmoothManifold) (g : RiemannianMetric M) where
  covariantDerivative : ∀ (X Y : VectorField M), VectorField M
  metricCompatible : Prop
  torsionFree : Prop

structure CurvatureTensor (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) where
  riemann : ∀ (X Y Z : VectorField M), VectorField M
  ricci : ∀ (X Y : VectorField M), ℝ
  scalar : ℝ
  symmetry : Prop
  contraction : Prop

structure ConnectionCurvatureEvidence (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (R : CurvatureTensor M g ∇) where
  metricCompatibleClosed : ∇.metricCompatible
  torsionFreeClosed : ∇.torsionFree
  symmetryClosed : R.symmetry
  contractionClosed : R.contraction

def ConnectionCurvatureClosed (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (R : CurvatureTensor M g ∇) : Prop :=
  ∇.metricCompatible ∧ ∇.torsionFree ∧ R.symmetry ∧ R.contraction

theorem connection_curvature_closed_from_evidence (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (R : CurvatureTensor M g ∇) (E : ConnectionCurvatureEvidence M g ∇ R) :
    ConnectionCurvatureClosed M g ∇ R := by
  exact And.intro E.metricCompatibleClosed (And.intro E.torsionFreeClosed (And.intro E.symmetryClosed E.contractionClosed))

end GeometricStructuresManifoldsHighArbitrary
end HautevilleHouse
