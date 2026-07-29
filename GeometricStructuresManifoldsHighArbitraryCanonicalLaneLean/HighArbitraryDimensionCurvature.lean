import canonicalLaneMathlib.AdmissibleClass

/-!
# High Arbitrary Dimension Curvature Package
-/

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure CurvatureEstimatesPackage where
  sectionalCurvatureBounded : Prop
  ricciCurvatureBounded : Prop
  scalarCurvatureBounded : Prop
  curvatureOperatorNormBounded : Prop
  dimensionAdjustedBounds : Prop

structure CurvatureEstimatesEvidence (C : CurvatureEstimatesPackage) where
  sectionalCurvatureBoundedClosed : C.sectionalCurvatureBounded
  ricciCurvatureBoundedClosed : C.ricciCurvatureBounded
  scalarCurvatureBoundedClosed : C.scalarCurvatureBounded
  curvatureOperatorNormBoundedClosed : C.curvatureOperatorNormBounded
  dimensionAdjustedBoundsClosed : C.dimensionAdjustedBounds

def CurvatureEstimatesClosed (C : CurvatureEstimatesPackage) : Prop :=
  C.sectionalCurvatureBounded ∧ C.ricciCurvatureBounded ∧
  C.scalarCurvatureBounded ∧ C.curvatureOperatorNormBounded ∧
  C.dimensionAdjustedBounds

theorem curvature_estimates_closed_from_evidence (C : CurvatureEstimatesPackage)
    (E : CurvatureEstimatesEvidence C) : CurvatureEstimatesClosed C := by
  refine And.intro E.sectionalCurvatureBoundedClosed ?_
  refine And.intro E.ricciCurvatureBoundedClosed ?_
  refine And.intro E.scalarCurvatureBoundedClosed ?_
  refine And.intro E.curvatureOperatorNormBoundedClosed
    E.dimensionAdjustedBoundsClosed

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse