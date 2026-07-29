import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure HighArbitraryConnectionPackage where
  connectionType : Type u
  curvatureForm : Type v
  torsion : Prop
  parallelTransport : Prop
  holonomyGroup : Prop
  structureGroupCompact : Prop
  admissibleConnectionsClassified : Prop

structure HighArbitraryConnectionEvidence (C : HighArbitraryConnectionPackage) where
  connectionTypeClosed : C.connectionType = C.connectionType
  curvatureFormClosed : C.curvatureForm = C.curvatureForm
  torsionClosed : C.torsion
  parallelTransportClosed : C.parallelTransport
  holonomyGroupClosed : C.holonomyGroup
  structureGroupCompactClosed : C.structureGroupCompact
  admissibleConnectionsClassifiedClosed : C.admissibleConnectionsClassified

def HighArbitraryConnectionClosed (C : HighArbitraryConnectionPackage) : Prop :=
  C.torsion ∧ C.parallelTransport ∧ C.holonomyGroup ∧ C.structureGroupCompact ∧ C.admissibleConnectionsClassified

theorem high_arbitrary_connection_closed_from_evidence
    (C : HighArbitraryConnectionPackage) (E : HighArbitraryConnectionEvidence C) :
    HighArbitraryConnectionClosed C := by
  exact And.intro E.torsionClosed
    (And.intro E.parallelTransportClosed
      (And.intro E.holonomyGroupClosed
        (And.intro E.structureGroupCompactClosed
          E.admissibleConnectionsClassifiedClosed)))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
