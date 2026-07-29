import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GStructurePDEPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  geometricStructure : Prop
  structureGroup : Type v
  integrability : Prop
  analyticPDE : Prop
  maximalStructure : Prop

structure GStructurePDEEvidence (P : GStructurePDEPackage) where
  smoothStructureClosed : P.smoothStructure
  geometricStructureClosed : P.geometricStructure
  integrabilityClosed : P.integrability
  analyticPDEClosed : P.analyticPDE
  maximalStructureClosed : P.maximalStructure

def GStructurePDEClosed (P : GStructurePDEPackage) : Prop :=
  P.smoothStructure ∧ P.geometricStructure ∧ P.integrability ∧ P.analyticPDE ∧ P.maximalStructure

theorem gstructure_pde_closed_from_evidence (P : GStructurePDEPackage)
    (E : GStructurePDEEvidence P) : GStructurePDEClosed P := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.geometricStructureClosed
      (And.intro E.integrabilityClosed
        (And.intro E.analyticPDEClosed E.maximalStructureClosed)))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
