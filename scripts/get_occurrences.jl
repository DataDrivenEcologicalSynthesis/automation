import GBIF
using DataFrames

import CSV


sp_name = "Amphiprion ocellaris"
sp = GBIF.taxon(sp_name)


occ = GBIF.occurrences(sp_name, "has_coordinates" => true)
GBIF.occurrences!(occ)

ispath("data") && mkdir("data")

CSV.write(DataFrame(occ), "data/occurrences.csv")

