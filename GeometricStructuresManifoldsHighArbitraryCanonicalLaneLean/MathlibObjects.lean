import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GeoStrSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GeoStrAdmittedObject where
  space : GeoStrSpace
  highArbitraryStructure : Prop
  classificationComplete : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

def GeoStrWitnessClosed (O : GeoStrAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end GeometricStructuresManifoldsHighArbitraryCanonicalLaneLean
end HautevilleHouse
