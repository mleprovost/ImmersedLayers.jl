#using Compat.Test
#using Compat

using ImmersedLayers
using Literate
using Test
##using TestSetExtensions

const GROUP = get(ENV, "GROUP", "All")

notebookdir = "../examples"
docdir = "../docs/src/manual"
litdir = "./literate"

if GROUP == "All" || GROUP == "Auxiliary"
  include("tools.jl")
  include("surface_ops.jl")
end

if GROUP == "All" || GROUP == "Literate"
  for (root, dirs, files) in walkdir(litdir)
    for file in files
      endswith(file,".jl") && @testset "$file" begin include(joinpath(root,file)) end
    end
  end
end


#=
if GROUP == "All" || GROUP == "Notebooks"
  for (root, dirs, files) in walkdir(litdir)
    for file in files
      #endswith(file,".jl") && startswith(file,"3") && Literate.notebook(joinpath(root, file),notebookdir)
      endswith(file,".jl") && Literate.notebook(joinpath(root, file),notebookdir)
    end
  end
end
=#

if GROUP == "Documentation"
  for (root, dirs, files) in walkdir(litdir)
    for file in files
      endswith(file,".jl") && Literate.markdown(joinpath(root, file),docdir)
    end
  end
end
