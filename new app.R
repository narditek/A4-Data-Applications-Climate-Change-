
Co2_dataset<-read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

  ggplot(Co2_dataset,aes(x=year,y=co2))+
    geom_point()
  
  co2_df<- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
  
  ggplot(co2_df, aes (x= year, y= co2))+
    geom_bar(stat = "identity")

