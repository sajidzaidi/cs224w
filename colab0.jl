### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 78e8e65f-fe6d-470b-8cc9-4042028d2851
begin
	import Pkg
	Pkg.add("GraphPlot")
	Pkg.add("SimpleWeightedGraphs")
	Pkg.add("MetaGraphs")
end

# ╔═╡ 9a9801cc-ab89-11eb-104f-d346eb67cbe6
using LightGraphs

# ╔═╡ 367cee10-3ed7-465f-b1c7-ab5f2e52c66c
using GeometricFlux

# ╔═╡ e8c0794d-1fa2-4bb5-81c0-de7ccf188cff
using MetaGraphs

# ╔═╡ e7fd7fbc-f42a-42c7-8943-7e706c38644d
using SimpleWeightedGraphs

# ╔═╡ 29141ca3-e55c-455b-a434-2b1b6a668b1d
G=SimpleGraph()

# ╔═╡ 9d683c72-59b5-4207-8105-54a623521361
H=SimpleDiGraph()

# ╔═╡ a3aebe93-f92a-442b-90ae-eaa65fe94e03
mg=MetaGraph(G)

# ╔═╡ e7174741-257c-4179-8d43-364035d25591
set_prop!(mg, :Name, "Bar")


# ╔═╡ 0843e3bf-f736-4194-805f-785716a97a6e
get_prop(mg,:Name)

# ╔═╡ f39ab05a-c22d-4af0-b933-66184e0da935
add_vertices!(mg,1)

# ╔═╡ 6b796b9c-aa36-4d0b-8c15-1a0c70c8d535
set_props!(mg, 1, Dict(:feature=>0, :label=> 0))

# ╔═╡ 310fc899-c33a-4b3a-ad19-9c7e27ac6f6d
props(mg,1)

# ╔═╡ 6aa5d91f-69d5-4728-9b4d-b7721877a296
add_vertex!(mg, Dict(:feature =>	1, :label=> 1))

# ╔═╡ 652bf044-b4c1-4014-bd76-c58495d6d034
add_vertex!(mg, Dict(:feature =>	2, :label=> 2))

# ╔═╡ 9145f020-44b6-40d4-9dfb-4dd3c728c703
for node in vertices(mg)
	display(props(mg,node))
end

# ╔═╡ f921bab8-8a54-4e84-807a-5f9f980ac1d1
nv(mg)

# ╔═╡ 4ab5e5d2-60fd-4e5f-9482-b85f51e60c22
add_edge!(mg,1,2,:weight,0.5)

# ╔═╡ 974e0ef8-0a17-47f3-aae7-6f6bae980708


# ╔═╡ Cell order:
# ╠═9a9801cc-ab89-11eb-104f-d346eb67cbe6
# ╠═78e8e65f-fe6d-470b-8cc9-4042028d2851
# ╠═367cee10-3ed7-465f-b1c7-ab5f2e52c66c
# ╠═29141ca3-e55c-455b-a434-2b1b6a668b1d
# ╠═9d683c72-59b5-4207-8105-54a623521361
# ╠═e8c0794d-1fa2-4bb5-81c0-de7ccf188cff
# ╠═e7fd7fbc-f42a-42c7-8943-7e706c38644d
# ╠═a3aebe93-f92a-442b-90ae-eaa65fe94e03
# ╠═e7174741-257c-4179-8d43-364035d25591
# ╠═0843e3bf-f736-4194-805f-785716a97a6e
# ╠═f39ab05a-c22d-4af0-b933-66184e0da935
# ╠═6b796b9c-aa36-4d0b-8c15-1a0c70c8d535
# ╠═310fc899-c33a-4b3a-ad19-9c7e27ac6f6d
# ╠═6aa5d91f-69d5-4728-9b4d-b7721877a296
# ╠═652bf044-b4c1-4014-bd76-c58495d6d034
# ╠═9145f020-44b6-40d4-9dfb-4dd3c728c703
# ╠═f921bab8-8a54-4e84-807a-5f9f980ac1d1
# ╠═4ab5e5d2-60fd-4e5f-9482-b85f51e60c22
# ╠═974e0ef8-0a17-47f3-aae7-6f6bae980708
