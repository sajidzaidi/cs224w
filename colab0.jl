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
#Import packages
using LightGraphs

# ╔═╡ 367cee10-3ed7-465f-b1c7-ab5f2e52c66c
using GeometricFlux

# ╔═╡ 72bf3022-40bc-482b-a8bd-b657eb251cb3
using Flux

# ╔═╡ e8c0794d-1fa2-4bb5-81c0-de7ccf188cff
using MetaGraphs

# ╔═╡ e7fd7fbc-f42a-42c7-8943-7e706c38644d
using SimpleWeightedGraphs

# ╔═╡ 0cde79be-3276-4e2b-9768-e3bcedeaff5d
#Draw the graph
using GraphPlot

# ╔═╡ 29141ca3-e55c-455b-a434-2b1b6a668b1d
# Create an undirected graph G
G=SimpleGraph()

# ╔═╡ 9d683c72-59b5-4207-8105-54a623521361
# Create a directed graph H
H=SimpleDiGraph()

# ╔═╡ a3aebe93-f92a-442b-90ae-eaa65fe94e03
# Create a metagraph mg
mg=MetaGraph(G)

# ╔═╡ e7174741-257c-4179-8d43-364035d25591
# Add graph level attribute
set_prop!(mg, :Name, "Bar")


# ╔═╡ 0843e3bf-f736-4194-805f-785716a97a6e
get_prop(mg,:Name)

# ╔═╡ f39ab05a-c22d-4af0-b933-66184e0da935
# Add one node with node level attributes
add_vertices!(mg,1)

# ╔═╡ 6b796b9c-aa36-4d0b-8c15-1a0c70c8d535
set_props!(mg, 1, Dict(:feature=>0, :label=> 0))

# ╔═╡ 310fc899-c33a-4b3a-ad19-9c7e27ac6f6d
# Get attributes of the node 0
props(mg,1)

# ╔═╡ 6aa5d91f-69d5-4728-9b4d-b7721877a296
#Add multiple nodes with attributes
add_vertex!(mg, Dict(:feature =>	1, :label=> 1))

# ╔═╡ 652bf044-b4c1-4014-bd76-c58495d6d034
add_vertex!(mg, Dict(:feature =>	2, :label=> 2))

# ╔═╡ 9145f020-44b6-40d4-9dfb-4dd3c728c703
# Loop through all the nodes
for node in vertices(mg)
	display(props(mg,node))
end

# ╔═╡ f921bab8-8a54-4e84-807a-5f9f980ac1d1
# Get number of nodes
nv(mg)

# ╔═╡ 4ab5e5d2-60fd-4e5f-9482-b85f51e60c22
# Add one edge with edge weight 0.5
add_edge!(mg,1,2,:weight,0.5)

# ╔═╡ 974e0ef8-0a17-47f3-aae7-6f6bae980708
get_prop(mg,1,2,:weight)

# ╔═╡ 6afc1f3d-55bd-45e8-b120-cf8df7f0d3e0
for edge in edges(mg)
	display(edge)
end

# ╔═╡ 50b04444-4404-44bb-9cae-e2b07b9572f3
#Add multiple edges with edge weights
add_edge!(mg,2,3,:weight,0.3)

# ╔═╡ 49cf7dee-1098-43a9-aafe-7f4f623d2fe0
add_edge!(mg,3,1,:weight,0.1)

# ╔═╡ d382bb1a-f591-4251-a5b7-9431a8a5114c
#Loop through all the edges
for edge in edges(mg)
	display(props(mg,edge))
end

# ╔═╡ c4640eab-08e7-4441-ac86-6948b19520de
# Get number of edges
ne(mg)

# ╔═╡ cbc0485c-a1f4-4e95-9a5c-e46f59995a10
nodelabel = 1:nv(mg)

# ╔═╡ 4ef7b964-1867-4fc6-bb28-98316b70deca
gplot(mg,nodelabel=nodelabel)

# ╔═╡ 48c5eee4-4e76-4361-baea-eddc30377d53
# Degree of node 2
degree(mg,2)

# ╔═╡ 6d80cf60-8f2a-41ee-ba5a-08291c2ab839
#Get neighbors of node 2
for neighbor in neighbors(mg,2)
	println("Node 2 has neighbor:",neighbor)
end

# ╔═╡ ab9e3beb-bcfc-4008-9b0b-211474b7443f
num_nodes=4

# ╔═╡ d9163556-be02-44e5-9e15-cbf551098512
# Create a new path like graph and change it to a directed graph
GPath=SimpleDiGraph(path_graph(num_nodes))

# ╔═╡ f3c858d6-60bd-43d0-9a9a-b3617e1320da
gplot(GPath)

# ╔═╡ 5d3a3e45-6a4a-4dd0-8701-8814411f8f52
#Get the pagerank
pagerank(GPath)

# ╔═╡ 05768003-e730-4f90-87ed-76eb6f19dc41
karate=smallgraph(:karate)

# ╔═╡ 20e14942-de54-4024-bc5b-a7a3d3d1a2d9
nv(karate)

# ╔═╡ 48678325-d7e6-42e5-bf9f-995fe1e7a2af
ne(karate)

# ╔═╡ 993a4bd0-1541-4dee-b880-d519411f00d8
klabels = 1:nv(karate)

# ╔═╡ 684258e2-83c5-4bc2-b0ad-920c47d2baf4
gplot(karate,nodelabel=klabels)

# ╔═╡ 00ea6cb6-0e0f-4f57-af64-4ef807c8320d
model = Chain(GCNConv(karate, 34=>4, tanh),
              GCNConv(karate, 4=>4, tanh),
              GCNConv(karate, 4=>2, tanh),
              Dense(2, 4),
              softmax)

# ╔═╡ 59a4dfe8-a257-4ad1-a9f4-1229cee1089f


# ╔═╡ Cell order:
# ╠═9a9801cc-ab89-11eb-104f-d346eb67cbe6
# ╠═78e8e65f-fe6d-470b-8cc9-4042028d2851
# ╠═367cee10-3ed7-465f-b1c7-ab5f2e52c66c
# ╠═72bf3022-40bc-482b-a8bd-b657eb251cb3
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
# ╠═6afc1f3d-55bd-45e8-b120-cf8df7f0d3e0
# ╠═50b04444-4404-44bb-9cae-e2b07b9572f3
# ╠═49cf7dee-1098-43a9-aafe-7f4f623d2fe0
# ╠═d382bb1a-f591-4251-a5b7-9431a8a5114c
# ╠═c4640eab-08e7-4441-ac86-6948b19520de
# ╠═0cde79be-3276-4e2b-9768-e3bcedeaff5d
# ╠═cbc0485c-a1f4-4e95-9a5c-e46f59995a10
# ╠═4ef7b964-1867-4fc6-bb28-98316b70deca
# ╠═48c5eee4-4e76-4361-baea-eddc30377d53
# ╠═6d80cf60-8f2a-41ee-ba5a-08291c2ab839
# ╠═ab9e3beb-bcfc-4008-9b0b-211474b7443f
# ╠═d9163556-be02-44e5-9e15-cbf551098512
# ╠═f3c858d6-60bd-43d0-9a9a-b3617e1320da
# ╠═5d3a3e45-6a4a-4dd0-8701-8814411f8f52
# ╠═05768003-e730-4f90-87ed-76eb6f19dc41
# ╠═20e14942-de54-4024-bc5b-a7a3d3d1a2d9
# ╠═48678325-d7e6-42e5-bf9f-995fe1e7a2af
# ╠═684258e2-83c5-4bc2-b0ad-920c47d2baf4
# ╠═993a4bd0-1541-4dee-b880-d519411f00d8
# ╠═00ea6cb6-0e0f-4f57-af64-4ef807c8320d
# ╠═59a4dfe8-a257-4ad1-a9f4-1229cee1089f
