import canonicalLaneMathlib.AdmissibleClass
import GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean.ClassificationResults

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

structure HighArbitraryApplicationPackage {M : HighArbitraryManifoldPackage}
    {G : GeometricStructurePackage M} {C : ClassificationPackage G} where
  applicationDomain : Type u
  bridgeToDomain : Prop
  domainSpecificConstraints : Prop
  closureTransfer : Prop

structure HighArbitraryApplicationEvidence {M : HighArbitraryManifoldPackage}
    {G : GeometricStructurePackage M} {C : ClassificationPackage G}
    (A : HighArbitraryApplicationPackage C) where
  bridgeToDomainClosed : A.bridgeToDomain
  domainSpecificConstraintsClosed : A.domainSpecificConstraints
  closureTransferClosed : A.closureTransfer

def HighArbitraryApplicationClosed {M : HighArbitraryManifoldPackage}
    {G : GeometricStructurePackage M} {C : ClassificationPackage G}
    (A : HighArbitraryApplicationPackage C) : Prop :=
  A.bridgeToDomain ∧ A.domainSpecificConstraints ∧ A.closureTransfer

theorem high_arbitrary_application_closed_from_evidence
    {M : HighArbitraryManifoldPackage} {G : GeometricStructurePackage M}
    {C : ClassificationPackage G} (A : HighArbitraryApplicationPackage C)
    (E : HighArbitraryApplicationEvidence A) : HighArbitraryApplicationClosed A := by
  exact And.intro E.bridgeToDomainClosed
    (And.intro E.domainSpecificConstraintsClosed E.closureTransferClosed)

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
