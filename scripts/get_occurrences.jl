import GBIF
using DataFrames

import CSV


sp_name = "Poecilia reticulata"
sp = GBIF.taxon(sp_name)


# Get 900 occurrences
occ = GBIF.occurrences(sp, "hasCoordinate" => "true", "limit" => 300)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)

data = select(DataFrame(occ), [:longitude, :latitude])

CSV.write("occurrences.csv", data; writeheader=false)

