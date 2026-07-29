import canonicalLaneMathlib.AdmissibleClass
import GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean.ManifoldStructures

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GeometricStructurePackage (M : HighArbitraryManifoldPackage) where
  structureGroup : Type u
  reductionOfStructureGroup : Prop
  integrabilityConditions : Prop
  torsionConstraints : Prop
  curvatureConstraints : Prop
  holonomyConstraints : Prop

structure GeometricStructureEvidence {M : HighArbitraryManifoldPackage}
    (G : GeometricStructurePackage M) where
  reductionOfStructureGroupClosed : G.reductionOfStructureGroup
  integrabilityConditionsClosed : G.integrabilityConditions
  torsionConstraintsClosed : G.torsionConstraints
  curvatureConstraintsClosed : G.curvatureConstraints
  holonomyConstraintsClosed : G.holonomyConstraints

def GeometricStructureClosed {M : HighArbitraryManifoldPackage}
    (G : GeometricStructurePackage M) : Prop :=
  G.reductionOfStructureGroup ∧ G.integrabilityConditions ∧
  G.torsionConstraints ∧ G.curvatureConstraints ∧ G.holonomyConstraints

theorem geometric_structure_closed_from_evidence
    {M : HighArbitraryManifoldPackage} (G : GeometricStructurePackage M)
    (E : GeometricStructureEvidence G) : GeometricStructureClosed G := by
  exact And.intro E.reductionOfStructureGroupClosed
    (And.intro E.integrabilityConditionsClosed
      (And.intro E.torsionConstraintsClosed
        (And.intro E.curvatureConstraintsClosed E.holonomyConstraintsClosed)))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
