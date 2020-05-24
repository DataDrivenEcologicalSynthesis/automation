import GBIF
using DataFrames
using DataFramesMeta
import CSV


sp_name = "Amphiprion"
sp = GBIF.taxon(sp_name, strict=false)


# Get 900 occurrences
occ = GBIF.occurrences(sp, "hasCoordinate" => "true", "limit" => 300)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)

data = @linq DataFrame(occ) |>
  where(:rank .== "SPECIES") |>
  select([:name, :longitude, :latitude]) |>
  where(:name .∈ ["Amphiprion ".*["melanopus", "ocellaris", "clarkii"]]) |>
  where(:longitude .> 0.0)
  

CSV.write("occurrences.csv", data; writeheader=true)

