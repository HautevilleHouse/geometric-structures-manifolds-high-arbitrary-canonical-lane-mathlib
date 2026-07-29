import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GeometricEntropyPackage {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} where
  entropyFunctional : Type u
  monotonicityFormula : Prop
  criticalPoints : Prop
  rigidityProperties : Prop

structure GeometricEntropyEvidence {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} (E : GeometricEntropyPackage F) where
  monotonicityFormulaClosed : E.monotonicityFormula
  criticalPointsClosed : E.criticalPoints
  rigidityPropertiesClosed : E.rigidityProperties

def GeometricEntropyClosed {G : HighArbitraryConnectionPackage}
    {F : GeometricFlowPDEPackage G} (E : GeometricEntropyPackage F) : Prop :=
  E.monotonicityFormula ∧ E.criticalPoints ∧ E.rigidityProperties

theorem geometric_entropy_closed_from_evidence
    {G : HighArbitraryConnectionPackage} {F : GeometricFlowPDEPackage G}
    (E : GeometricEntropyPackage F) (Ev : GeometricEntropyEvidence E) :
    GeometricEntropyClosed E := by
  exact And.intro Ev.monotonicityFormulaClosed
    (And.intro Ev.criticalPointsClosed Ev.rigidityPropertiesClosed)

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
