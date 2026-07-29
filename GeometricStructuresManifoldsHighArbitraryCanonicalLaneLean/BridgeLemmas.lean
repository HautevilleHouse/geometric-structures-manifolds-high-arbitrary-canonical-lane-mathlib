import canonicalLaneMathlib.AdmissibleClass

/-!
# Bridge Lemmas for Geometric Structures
-/

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

def bridgeClosed (A : AdmissibleGeometricManifold) : Prop :=
  A.admissibleStructure

theorem bridge_from_admissible_class (A : AdmissibleGeometricManifold) :
    bridgeClosed A := by
  exact A.admissibleStructure

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse