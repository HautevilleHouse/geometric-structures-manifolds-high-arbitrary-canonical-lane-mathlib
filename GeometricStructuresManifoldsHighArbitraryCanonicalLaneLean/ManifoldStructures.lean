import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure HighArbitraryManifoldPackage where
  underlyingManifold : Type u
  topology : TopologicalSpace underlyingManifold
  smoothStructure : Prop
  metric : Type v
  connection : Type w
  curvatureTensor : Type x
  smoothnessAxioms : Prop
  metricCompatibility : Prop
  torsionFree : Prop

structure HighArbitraryManifoldEvidence (M : HighArbitraryManifoldPackage) where
  smoothnessAxiomsClosed : M.smoothnessAxioms
  metricCompatibilityClosed : M.metricCompatibility
  torsionFreeClosed : M.torsionFree

def HighArbitraryManifoldClosed (M : HighArbitraryManifoldPackage) : Prop :=
  M.smoothnessAxioms ∧ M.metricCompatibility ∧ M.torsionFree

theorem high_arbitrary_manifold_closed_from_evidence
    (M : HighArbitraryManifoldPackage) (E : HighArbitraryManifoldEvidence M) :
    HighArbitraryManifoldClosed M := by
  exact And.intro E.smoothnessAxiomsClosed
    (And.intro E.metricCompatibilityClosed E.torsionFreeClosed)

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
