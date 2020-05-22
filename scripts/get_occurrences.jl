import GBIF
using DataFrames

import CSV


sp_name = "Amphiprion ocellaris"
sp = GBIF.taxon(sp_name)


# Get 900 occurrences
occ = GBIF.occurrences(sp, "has_coordinates" => true, "limit" => 300)
GBIF.occurrences!(occ)
GBIF.occurrences!(occ)

ispath("data") && mkdir("data")

CSV.write(DataFrame(occ), "data/occurrences.csv")

