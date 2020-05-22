import GBIF
using DataFrames

import CSV


sp_name = "Amphiprion ocellaris"
sp = GBIF.taxon(sp_name)


# Get 900 occurrences
occ = GBIF.occurrences(sp, "hasCoordinate" => true, "limit" => 300)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)

CSV.write(DataFrame(occ), "occurrences.csv")
