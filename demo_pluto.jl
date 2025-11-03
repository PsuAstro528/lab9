### A Pluto.jl notebook ###
# v0.20.18

using Markdown
using InteractiveUtils

# ╔═╡ e599dca0-da5b-48bd-947c-ad17f41f3ad1
begin
	import Pkg
	# Tell Julia to use the Project.toml and Manifest.toml specified in the directory containging this file
	Pkg.activate(@__DIR__)
	# Shouldn't need to instantiate if you build first
	# Pkg.instantiate()
end

# ╔═╡ a3473eee-882f-4ed2-930a-24597bb363bb
begin
	using PlutoTest
    using PlutoLinks  # provides @ingredients and @revise
end

# ╔═╡ 71a996eb-f57e-4d57-a24b-b249edf27d0d
@revise using ExamplePkg   

# ╔═╡ 383e97ab-203d-4663-ad1e-26dda1db26e6
# Make sure we successfully activated our desired environment
@test Pkg.project().name == "ExamplePkg"

# ╔═╡ 012d24b5-1797-45ea-81f8-22b214afd007
hello()

# ╔═╡ 94fb75b9-3793-4b27-aa84-d0eae1a569f2
ExamplePkg.goodbye()

# ╔═╡ Cell order:
# ╠═e599dca0-da5b-48bd-947c-ad17f41f3ad1
# ╠═a3473eee-882f-4ed2-930a-24597bb363bb
# ╠═383e97ab-203d-4663-ad1e-26dda1db26e6
# ╠═71a996eb-f57e-4d57-a24b-b249edf27d0d
# ╠═012d24b5-1797-45ea-81f8-22b214afd007
# ╠═94fb75b9-3793-4b27-aa84-d0eae1a569f2
