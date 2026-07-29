import canonicalLaneMathlib.AdmissibleClass
import GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean.GeometricStructures

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure ClassificationPackage {M : HighArbitraryManifoldPackage}
    {G : GeometricStructurePackage M} where
  moduliSpace : Type u
  topologicalInvariants : Prop
  discreteInvariants : Prop
  continuousParameters : Prop
  rigidityTheorems : Prop

structure ClassificationEvidence {M : HighArbitraryManifoldPackage}
    {G : GeometricStructurePackage M} (C : ClassificationPackage G) where
  topologicalInvariantsClosed : C.topologicalInvariants
  discreteInvariantsClosed : C.discreteInvariants
  continuousParametersClosed : C.continuousParameters
  rigidityTheoremsClosed : C.rigidityTheorems

def ClassificationClosed {M : HighArbitraryManifoldPackage}
    {G : GeometricStructurePackage M} (C : ClassificationPackage G) : Prop :=
  C.topologicalInvariants ∧ C.discreteInvariants ∧
  C.continuousParameters ∧ C.rigidityTheorems

theorem classification_closed_from_evidence
    {M : HighArbitraryManifoldPackage} {G : GeometricStructurePackage M}
    (C : ClassificationPackage G) (E : ClassificationEvidence C) :
    ClassificationClosed C := by
  exact And.intro E.topologicalInvariantsClosed
    (And.intro E.discreteInvariantsClosed
      (And.intro E.continuousParametersClosed E.rigidityTheoremsClosed))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
