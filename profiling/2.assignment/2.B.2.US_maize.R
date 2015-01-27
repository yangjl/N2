# Jinliang Yang
# Jan. 26th, 2015

# through the following link selected by country: United States
#http://npgsweb.ars-grin.gov/gringlobal/search.aspx
#search for maize, >20,000 and country of origin: US

get_us_accession <- function(){
    usm <- read.csv("largedata/grin/export_2015_01_26_05_55_22.csv")
    usm$Plant.ID <- toupper(usm$Plant.ID)
    usm$Plant.Name <- toupper(usm$Plant.Name)
    
    # import the pedigree dataframe of interest
    ames <- read.csv("data/AmesGBSlist.csv", header = T, stringsAsFactors = F)
    ames$Accession <- toupper(ames$Accession)
    message(sprintf("###>>> Unique accessions in Ames GBS data: [ %s ]", length(unique(ames$Accession))))
    
    us1 <- subset(ames, Accession %in% usm$Plant.ID)
    
    us2 <- subset(ames, Accession %in% usm$Plant.Name)
    
    us12 <- rbind(us1, us2)
    us12 <- us12[!duplicated(us12[,1]), ]
    message(sprintf("###>>> Accessions from US: [ %s ]", length(unique(us12$Accession))))
    return(us12)
}

#### get lines from US and mapped their accession ID to Ames GBS panel
uslines <- get_us_accession()
###>>> Unique accessions in Ames GBS data: [ 3170 ]
###>>> Accessions from US: [ 2101 ]
write.table(uslines, "data/US_ames_GBS.csv", sep=",", row.names=FALSE, quote=FALSE)



