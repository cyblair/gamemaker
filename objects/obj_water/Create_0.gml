increaseRate = 10;

currentVolume = 0;

volume = 10;

maxVolume = 4000;

vertices = 36;

for (v = 0; v < vertices; v++)  {
    verts[v,0] = x;
    verts[v,1] = y;
    verts[v,2] = v*(360/vertices);
    verts[v,3] = true;
}
functionalVerts = vertices;

nextVert = 0;

radius = 0;

