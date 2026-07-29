import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure HighArbDeformationPackage where
  baseStructure : GStructurePDEPackage
  deformationFamily : Type u
  parameterSpace : Type v
  analyticContinuity : Prop
  rigidityBounds : Prop
  deformationClosed : Prop

structure HighArbDeformationEvidence (D : HighArbDeformationPackage) where
  analyticContinuityClosed : D.analyticContinuity
  rigidityBoundsClosed : D.rigidityBounds
  deformationClosedTerm : D.deformationClosed

def HighArbDeformationClosed (D : HighArbDeformationPackage) : Prop :=
  D.analyticContinuity ∧ D.rigidityBounds ∧ D.deformationClosed

theorem high_arb_deformation_closed_from_evidence (D : HighArbDeformationPackage)
    (E : HighArbDeformationEvidence D) : HighArbDeformationClosed D := by
  exact And.intro E.analyticContinuityClosed
    (And.intro E.rigidityBoundsClosed E.deformationClosedTerm)

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
