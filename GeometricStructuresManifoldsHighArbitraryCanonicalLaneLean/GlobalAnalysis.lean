import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure GlobalAnalysisPackage where
  manifoldType : Type u
  topology : TopologicalSpace manifoldType
  globalStructure : Prop
  compactnessCondition : Prop
  classificationResult : Prop
  obstructionTheory : Prop
  globalAnalysisClosed : Prop

structure GlobalAnalysisEvidence (G : GlobalAnalysisPackage) where
  globalStructureClosed : G.globalStructure
  compactnessConditionClosed : G.compactnessCondition
  classificationResultClosed : G.classificationResult
  obstructionTheoryClosed : G.obstructionTheory
  globalAnalysisClosedTerm : G.globalAnalysisClosed

def GlobalAnalysisClosed (G : GlobalAnalysisPackage) : Prop :=
  G.globalStructure ∧ G.compactnessCondition ∧ G.classificationResult ∧ G.obstructionTheory ∧ G.globalAnalysisClosed

theorem global_analysis_closed_from_evidence (G : GlobalAnalysisPackage)
    (E : GlobalAnalysisEvidence G) : GlobalAnalysisClosed G := by
  exact And.intro E.globalStructureClosed
    (And.intro E.compactnessConditionClosed
      (And.intro E.classificationResultClosed
        (And.intro E.obstructionTheoryClosed E.globalAnalysisClosedTerm)))

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
