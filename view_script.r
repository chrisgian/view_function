

#### View Function
view <- function (x,y=nrow(x)){
  
  # So to not crash excel or R. If data.frame is > 10000 records or 20 columns,
  # as user, if they really want to view
  if(nrow(x) > 10000 | ncol(x) > 20){
    print(paste0('frame is ',
                 nrow(x),
                 ' by ',
                 ncol(x),
                 ' do you wish to proceed? [y/n]?'))
    # user input
    proceed <- readline()
    
  }else{
    # If not large then print to
    proceed <- 'go'}
  
  if ( proceed %in% c('go', 'y', 'Y')){
    # this will save a copy onto your desktop for later ferences
    # save by generating random name
    tempname <- paste0('c:\\users\\',
                      Sys.info()['user'],
                      '\\desktop\\',
                      'tempfile_from_',
                      Sys.time() %>%
                        gsub("(\\:)","\\_",.) %>% 
                        gsub('\\s','.',.),'.csv')
    # write this file
    write.csv(x[1:y,],tempname)
    
    # use windows shell to open file
    shell.exec(tempname)
    
    # Return data set dimensions to user in R Console
    print(paste(y,' rows. ',ncol(x),' columns.',sep=""))
    print(paste('filename: ',tempname))
    
    # Store temp name and file path
    name.xl<<-tempname
    
  } else {print('skipped view')}
  
}


### END