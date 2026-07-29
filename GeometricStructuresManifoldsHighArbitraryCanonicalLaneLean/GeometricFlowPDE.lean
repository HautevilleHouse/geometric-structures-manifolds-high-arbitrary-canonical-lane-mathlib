import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GeometricFlowPDEPackage (G : HighArbitraryConnectionPackage) where
  flowParameter : Type u
  evolutionEquation : Prop
  shortTimeExistence : Prop
  curvatureEvolution : Prop
  monotoneQuantities : Prop
  singularityFormation : Prop

structure GeometricFlowPDEEvidence {G : HighArbitraryConnectionPackage}
    (F : GeometricFlowPDEPackage G) where
  evolutionEquationClosed : F.evolutionEquation
  shortTimeExistenceClosed : F.shortTimeExistence
  curvatureEvolutionClosed : F.curvatureEvolution
  monotoneQuantitiesClosed : F.monotoneQuantities
  singularityFormationClosed : F.singularityFormation

def GeometricFlowPDEClosed {G : HighArbitraryConnectionPackage}
    (F : GeometricFlowPDEPackage G) : Prop :=
  F.evolutionEquation ∧ F.shortTimeExistence ∧ F.curvatureEvolution ∧ F.monotoneQuantities ∧ F.singularityFormation

theorem geometric_flow_pde_closed_from_evidence
    {G : HighArbitraryConnectionPackage} (F : GeometricFlowPDEPackage G)
    (E : GeometricFlowPDEEvidence F) : GeometricFlowPDEClosed F := by
  exact And.intro E.evolutionEquationClosed
    (And.intro E.shortTimeExistenceClosed
      (And.intro E.curvatureEvolutionClosed
        (And.intro E.monotoneQuantitiesClosed E.singularityFormationClosed)))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
