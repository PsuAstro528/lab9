import Pkg
using Pluto

println("# Activating environment for notebook demo_pluto.jl")
Pluto.activate_notebook_environment("../demo_pluto.jl"); 
println("# Instantiating environment for notebook demo_pluto.jl")
Pkg.instantiate();
Pkg.precompile()

