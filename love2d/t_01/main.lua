-- A simple small triangle with the default position, texture coordinate, and color vertex attributes.
local vertices = {
	{0, 0,  0,0, 1.0,0.2,0.2,1.0},
	{20,0,  0,0, 0.2,1.0,0.2,1.0},
	{20,20, 0,0, 0.2,0.2,1.0,1.0},
}

local mesh = love.graphics.newMesh(vertices, "triangles", "static")

-- Unique positions for each instance that will be rendered.
local instancepositions = {}
for y=0, love.graphics.getHeight()-1, 30 do
	for x = 0, love.graphics.getWidth()-1, 30 do
		local pos = {x, y}
		table.insert(instancepositions, pos)
	end
end

-- Create a mesh containing the per-instance position data.
-- It won't be drawn directly, but it will be referenced by the triangle's mesh.
local instancemesh = love.graphics.newMesh({{"InstancePosition", "float", 2}}, instancepositions, nil, "static")

-- When the triangle's mesh is rendered, the vertex shader will pull in a different
-- value of the InstancePosition attribute for each instance, instead of for each vertex.
mesh:attachAttribute("InstancePosition", instancemesh, "perinstance")

-- Vertex shader which uses the InstancePosition vertex attribute.
local shader = love.graphics.newShader[[
attribute vec2 InstancePosition;

vec4 position(mat4 transform_projection, vec4 vertex_position)
{
	vertex_position.xy += InstancePosition;
	return transform_projection * vertex_position;
}
]]

function love.draw()
	love.graphics.setShader(shader)

	-- Draw the mesh many times in one draw call, using instancing.
	local instancecount = #instancepositions
	love.graphics.drawInstanced(mesh, instancecount, 0, 0)
end