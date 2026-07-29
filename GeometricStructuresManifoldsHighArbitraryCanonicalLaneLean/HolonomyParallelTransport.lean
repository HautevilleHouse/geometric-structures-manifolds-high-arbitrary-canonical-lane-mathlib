import canonicalLaneMathlib.AdmissibleClass
import GeometricStructuresManifoldsHighArbitrary.ConnectionCurvature

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitrary

structure ParallelTransport (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) where
  transport : ∀ (γ : Path M) (v : TangentFiber M (γ.source)), TangentFiber M (γ.target)
  linearity : Prop
  composition : Prop
  metricPreserving : Prop

structure HolonomyGroup (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (Pt : ParallelTransport M g ∇) where
  carrier : Set (TangentFiber M → TangentFiber M)
  groupStructure : Prop
  metricPreservingHolonomy : Prop

structure HolonomyEvidence (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (Pt : ParallelTransport M g ∇) (H : HolonomyGroup M g ∇ Pt) where
  linearityClosed : Pt.linearity
  compositionClosed : Pt.composition
  metricPreservingClosed : Pt.metricPreserving
  groupStructureClosed : H.groupStructure
  metricPreservingHolonomyClosed : H.metricPreservingHolonomy

def HolonomyClosed (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (Pt : ParallelTransport M g ∇) (H : HolonomyGroup M g ∇ Pt) : Prop :=
  Pt.linearity ∧ Pt.composition ∧ Pt.metricPreserving ∧ H.groupStructure ∧ H.metricPreservingHolonomy

theorem holonomy_closed_from_evidence (M : NDimSmoothManifold) (g : RiemannianMetric M) (∇ : LeviCivitaConnection M g) (Pt : ParallelTransport M g ∇) (H : HolonomyGroup M g ∇ Pt) (E : HolonomyEvidence M g ∇ Pt H) :
    HolonomyClosed M g ∇ Pt H := by
  exact And.intro E.linearityClosed (And.intro E.compositionClosed (And.intro E.metricPreservingClosed (And.intro E.groupStructureClosed E.metricPreservingHolonomyClosed)))

end GeometricStructuresManifoldsHighArbitrary
end HautevilleHouse
