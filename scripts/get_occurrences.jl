import GBIF
using DataFrames
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

raw_data = DataFrame(occ)

# JUDGE NOT  LEST YE BE JUDGED
raw_data = raw_data[raw_data.rank .== "SPECIES", :]
# Seriously
ok_names = "Amphiprion ".*["melanopus", "ocellaris", "clarkii"]
# It's 10pm
ok_index = map(f -> in(f, ok_names), raw_data.name)
# I'm so tired
raw_data = raw_data[ok_index, :]

# Save only the columns we care about
data = select(raw_data, [:name, :longitude, :latitude])

first(data, 5)

CSV.write("occurrences.csv", data; writeheader=true)

