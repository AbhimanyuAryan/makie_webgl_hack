# let's see if this works out of the box

using GeoMakie, WGLMakie
WGLMakie.activate!() # this function activates what kind of backend

# First, make a surface plot
lons = -180:180
lats = -90:90
field = [exp(cosd(l)) + 3(y/90) for l in lons, y in lats]

fig = Figure()
ax = GeoAxis(fig[1,1])
sf = surface!(ax, lons, lats, field; shading = false)
cb1 = Colorbar(fig[1,2], sf; label = "field", height = Relative(0.65))

using Downloads, GeoJSON
Downloads.download("https://datahub.io/core/geo-countries/r/countries.geojson", "makie_webgl_hack/countries.geojson")
countries = GeoJSON.read(read("makie_webgl_hack/countries.geojson"))

n = length(GeoInterface.features(countries))
hm = poly!(ax, countries; color= 1:n, colormap = :dense,
    strokecolor = :black, strokewidth = 0.5, overdraw = true,
)

# cb2 = Colorbar(fig[1,3], hm; label = "countries index", height = Relative(0.65))

fig