#=
 Methods and types associated with single and double layer potentials
=#

module ImmersedLayers

using Reexport
using DocStringExtensions
#@reexport using CartesianGrids
#@reexport using RigidBodyTools
using CartesianGrids
using RigidBodyTools

using LinearAlgebra

using UnPack

export DoubleLayer, SingleLayer, MaskType, Mask, ComplementaryMask,
        DoubleLayer!, SingleLayer!, Mask!,
        SurfaceCache,SurfaceScalarCache,SurfaceVectorCache,
        BasicScalarILMProblem,BasicVectorILMProblem,prob_cache,
        AbstractScalingType,GridScaling,IndexScaling,
        BasicILMCache,ILMSystem,
        AbstractExtraILMCache,AbstractScalarILMProblem,AbstractVectorILMProblem,
        ConvectiveDerivativeCache,convective_derivative, convective_derivative!,
        regularize_normal!,normal_interpolate!,
        surface_curl!,surface_divergence!,surface_grad!,inverse_laplacian!,
        mask,mask!,complementary_mask,complementary_mask!,
        create_CLinvCT,create_GLinvD,create_nRTRn

abstract type LayerType{N} end

include("tools.jl")
include("cache.jl")
include("problem.jl")
include("system.jl")
include("layers.jl")
include("grid_operators.jl")
include("surface_operators.jl")
include("matrix_operators.jl")




end
