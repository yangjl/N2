### Jinliang Yang
### June 16th, 2015
### purpose: snp50k original data probressing


map3 <- checking()
map <- getB73ref(map3=map3)
#AA   AC   AG   CC   GG   TT 
#1135    4    8  306 1045   16 
dim(map)
#[1] 51741   823
write.table(map, "largedata/SNP55_811_samples_top.csv", sep=",", row.names=FALSE, quote=FALSE)


#####################################################################################################
checking <- function(){
    map2 <- read.csv("data/MaizeSNP50_A.csv")
    map3 <- read.csv("largedata/SNP55_05132010_811_samples.csv", skip=2, header=TRUE)
    ### change to TopGenomicSeq column rather than SourceSeq
    #map2 <- map2[, c("Name", "Chr", "MapInfo", "TopGenomicSeq")]
    test <- merge(map2[, c("Name", "Chr", "MapInfo", "TopGenomicSeq")], map3[, c("SNP.NAME", "X")],
                  by.x="Name", by.y="SNP.NAME")
    
    c <- sum(as.character(test[,4]) != as.character(test[,5]))
    message(sprintf("TopGenomicSeq has [ %s ] != Ref", c))
    return(map3)
}


getB73ref <- function(map3=map3){
    #idx <- grep("B73", names(map3))
    
    b73 <- map3[, c("SNP.NAME", "B73", "B73.1","B73.2", "B73.3", "B73.4", "B73.5" )]
    b73$B73ref <- "N"
    b73 <- as.data.frame(apply(b73, 2, as.character))
    
    con <- subset(b73, B73==B73.1 & B73.1==B73.2 & B73.2==B73.3 & B73.3==B73.4 & B73.4==B73.5)
    con$B73ref <- con[, 2]
    incon <- subset(b73, !(SNP.NAME %in% con$SNP.NAME))
    
    incon$B73ref <- as.character(incon$B73ref)
    for(i in 1:nrow(incon)){
        tem <- t(incon[i, 2:7])
        tab <- table(tem)
        if(sum(names(tab) %in% "--") > 0 ){
            idx <- which(names(tab) == "--")
            tab <- tab[-idx]
        }
        
        if(length(tab) == 1){
            incon$B73ref[i] <- names(tab)
        }else{
            idx2 <- which.max(tab)
            incon$B73ref[i] <- names(tab)[idx2]
        }
        #print(i)
        #return(incon)
    }
    print(table(incon$B73ref))
    
    b73call <- rbind(con, incon)
    map4 <- merge(b73call[, c("SNP.NAME", "B73ref")], map3, by="SNP.NAME")
    return(map4)
}


