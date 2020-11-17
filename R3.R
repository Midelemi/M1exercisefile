##1#Plot a cheat-sheet with values of color and point type (col = , and pch = )
##from 1 to 25, and export it as a jpeg of 15 cm wide, 6 cm high 
##and resolution 100 points per cm.

##Solution
jpeg(filename = "colpchPlot.jpeg", width = 15, height = 6, res = 100, units = "cm",
     bg = "transparent")   ###To save the plot in a jpeg format

plot(0, 0, xlim = c(0, 26), ylim = c(0.5, 1.5), ylab = "", xlab = "", yaxt = "n") 
axis(2,1, labels = "colpch")
for (i in 1:25) {
  points(i, 1, col = i, pch = i, cex = 2.5)
}

dev.off()


##2##Plot into a graph ten Poisson distributions with lambda ranging from 1 to 10. 
##Put legend and title. Export it as a .tiff file with size of 15x15 cm.

##Solution
tiff(filename = "newplot.tiff", width = 15, height = 15, units = "cm",
     bg = "transparent", res = 100)  ###To save the plot in a tiff format

x <- seq(0, 25, 1)  ##Set size of the plot on the x-axis
y <- dpois(x, lambda = 1)  ##Set size of the plot on the y-axis
plot(x, y, type = "n") ## type = "n"  Plot an empty plot 

for (i in 1:10) {          
  y <- dpois(x, lambda = i)   
  lines(x, y, col = i)                       
}                  ###Fill the empty plot

legend("topright", legend = paste("lambda =", 1:10)
       , lty = 1, col = 1:10)
title(main = "Poisson distributions, lambda = 1:10")
dev.off()


##3##Import data from this article: https://peerj.com/articles/328/, 
##With these data, using for(), plot graphs to represent the effect of all the numerical variables, 
##from "richness" to "mean_quality" on "yield". Choose the type of graph that you think better 
##represents this effect for the different species. Create only one pdf with all the graphs inside.

##Solution
webcsv <- "https://dfzljdn9uc3pi.cloudfront.net/2014/328/1/Appendix1.csv"  ##Assign name to the link to be imported for easy manipulation
ImpData <- read.csv(webcsv, skip = 2, sep = ",")   ##Import the data
ImpData <- ImpData[-1]                            ##Remove the first column of the data to avoid misunderstanding the numbering


str(ImpData)

pdf("MeanYield.pdf")  ### To convert plot to PDF format starts the graphics device driver for producing PDF graphics
for(i in names(ImpData)[5:11]){        ##for loop to plot the graphs
  plot(ImpData$mean_yield ~ ImpData[[i]], ylab = "Mean Yield", xlab = i, col = ImpData$crop)
  legend("topright", legend = levels(as.factor(ImpData$crop)), pch = T, col = c(1:4) )
  title(main = paste("Mean yield as a function of", i))
}
dev.off()