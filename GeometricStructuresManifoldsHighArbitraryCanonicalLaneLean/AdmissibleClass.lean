import canonicalLaneMathlib.AdmissibleClass

/-!
# Admissible Class for Geometric Structures Manifolds High Arbitrary
-/

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure AdmissibleGeometricManifold where
  manifold : Type u
  topology : TopologicalSpace manifold
  admissibleStructure : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleGeometricManifold) : Prop :=
  A.admissibleStructure ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse