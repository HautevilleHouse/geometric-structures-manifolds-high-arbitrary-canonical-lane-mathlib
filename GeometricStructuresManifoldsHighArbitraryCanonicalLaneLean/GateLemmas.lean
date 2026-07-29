import canonicalLaneMathlib.AdmissibleClass

/-!
# Gate Lemmas for Geometric Structures
-/

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

def gateClosed (A : AdmissibleGeometricManifold) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleGeometricManifold) :
    gateClosed A := by
  exact A.gateWitness

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse