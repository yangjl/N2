### Jinliang modified from Kate
### Jan. 23th, 2015


# import the zea GRIN dataframe - includes more than just Zea mays
grin.all <- read.csv("largedata/GRIN.csv", header = T, stringsAsFactors = F)
# [1] 45141    36

# import the pedigree dataframe of interest
amesGBS <- read.csv("data/AmesGBSlist.csv", header = T, stringsAsFactors = F)


# load libraries
library(stringr)
library(data.table)

# replace the spaces in GRIN 
accenumb <- grin.all$accenumb

accenumbPI <- str_replace(accenumb, "I ", "I")
accenumbMBG<- str_replace(accenumbPI, "S ", "S")
accenumbAmes <- str_replace(accenumbMBG, "s ", "s")
accenumbNSL <- str_replace(accenumbAmes, "L ", "L")

Accession <- accenumbNSL

# New dataframe
grin.new <- data.frame(grin.all, Accession, stringsAsFactors = F)

# Now start the joining of the two datasets based on Accession

zea.grin.T <- data.table(grin.new)
amesGBS.T <- data.table(amesGBS)
setkey(zea.grin.T, Accession)
setkey(amesGBS.T, Accession)

new.T <- zea.grin.T[amesGBS.T, roll=T]

# Get the columns that you want 
newDT <- subset(new.T, select = c(Accession, accenumb, Inbred.name, GBS.name..Sample.Flowcell.Lane.Well., collsite,latitude,longitude,  
                                  colldate, latdec, longdec, ancest, Notes))

