using WGLMakie
WGLMakie.activate!() # this function activates what kind of backend

N = 60
function xy_data(x, y)
    r = sqrt(x^2 + y^2)
    r == 0.0 ? 1f0 : (sin(r)/r)
end  # COMPUTES X AND Y 

l = range(-10, stop = 10, length = N)

z = Float32[xy_data(x, y) for x in l, y in l] # COMPUTES Z FROM X Y AND L

surface(
    -1..1, -1..1, z, # PASSES Z
    colormap = :Spectral
) # PLOTS