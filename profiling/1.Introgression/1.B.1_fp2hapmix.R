# Jinliang Yang
# 1.21.2015
# purpose: format the output from fastPHASE to HAPMIX


read_fastphase <- function(fileName = "largedata/fphase/land_94_chr10_hapguess_switch.out", chrnum=10){
    
    ########
    map <- read.csv("largedata/fphase/snp50k_subset_info.csv", header=TRUE)
    map <- subset(map, chr == chrnum)
    
    
    conn <- file(fileName, open="r")
    linn <- readLines(conn, warn=FALSE)
    nline <- -9
    res <- map
    close(conn) 
    
    idx1 <- grep("^BEGIN GENOTYPES", linn)
    idx2 <- grep("^END GENOTYPES", linn)
    
    nline <- 0
    for (i in (idx1+1):(idx2-1)){
        if(nline %% 3 ==0){
            nm <- linn[i]
            nline <- nline + 1
        }else if(nline >= 0 & nline %% 3 ==1){ 
            geno1 <- unlist(strsplit(linn[i], split=" "))
            nline <- nline + 1
        }else if(nline >= 0 & nline %% 3 ==2){
            geno2 <- unlist(strsplit(linn[i], split=" "))
            oneplant <- data.frame(mygeno1=geno1, mygeno2=geno2)
            names(oneplant) <- c(paste0(nm, "_A1"), paste0(nm, "_A2"))
            res <- cbind(res, oneplant)
            
            nline <- nline + 1
        }   
    }
    
    print(sprintf("###>>> reading [ %s ] plants for [ %s ] SNPs", nline %/% 3, length(geno2)))
    return(res)
}

####
df <- read_fastphase(fileName = "largedata/fphase/land_94_chr10_hapguess_switch.out")











if nline >= 0 and nline % 3 == 0:
    data[line] = []
snpid = line
nline += 1
elif nline >= 0 and nline % 3 != 0:
    data[snpid].append(line)
nline += 1

###### read the fastphase output to {'ind1':['A T C','C T G']}
def readfile(infile="largedata/fphase/fastphase_hapguess_swith.out"):
    
    with open(infile, 'r') as infile:
    data = {}
nline = -9
for line in infile:
    line = line.strip()
if not line: continue
if line.startswith("BEGIN GENOTYPES"):
    nline = 0
continue
if line.startswith("END GENOTYPES"):
    # define global variable `snpnum`
    snpnum = len(data[snpid][0].split())
print ">>> loaded", len(data),  "individuals with", snpnum, "SNPs!"
return data
if nline >= 0 and nline % 3 == 0:
    data[line] = []
snpid = line
nline += 1
elif nline >= 0 and nline % 3 != 0:
    data[snpid].append(line)
nline += 1






