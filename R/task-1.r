##Assingment 1##
setwd(dir = "~/Dropbox/curso-big-data-yepes")

best<-function(state,outcome){

  if(outcome=="HA")
    column<-11
  if(outcome=="HF")
    column<-17
  if(outcome=="PN")
    column<-23
  
  # opt_diseases<-c("HA","HF","PN",11,17,23)
  # matrix(opt_diseases,nrow = 2,ncol = 3)
  # select_outcome<-grepl(outcome,opt_diseases)
  
  rawdata<-read.csv('outcome-of-care-measures.csv',colClasses = "character")
  
  # tetst whether state exist
  if(length(unique(grepl(state,unique((rawdata[,7])))))==1 )  
    stop("\n                state name do not match")

  suppressWarnings(rawdata[,column]<-as.numeric(rawdata[,column])) 

  list<-subset(rawdata,rawdata[,7]==state)
  
  hospital_min<-list[which.min(list[,column]),2]
  
  return(hospital_min)
}
