#------------------------------------
# Script Information
#------------------------------------
# Purpose: Calculate greenness of the same regions from multiple photographs
# Creator: Drew Duckett, 7 June 2017
# Contact: dduckett@mortonarb.org
#------------------------------------

#------------------------------------
# Description
#------------------------------------
# Function (greenness) to import all photos from the working directory and measure the
#   greenness of a specified region for each

# Input:
# 1. xmin, xmax, ymin, ymax (coordinates that specify the region of each picture to measure)

# Output:
# 1. 

#------------------------------------
# Workflow Overview
#------------------------------------
# 1) Import image
# 2) Crop image to user specified coordinates
# 3) Extract RGB values from cropped region
# 4) Calculate greenness as green / (red + green + blue)
#------------------------------------



library(EBImage) #Load necessary library

img <- readImage('~/havardii_testpics/havardii_picture(1).jpg') #import image 
img_crop <- img[200:300, 600:500,] #crop image based on user specified coordinates

rst.red <- img_crop[,,1] #extract red values
rst.green <- img_crop[,,2] #extract green values
rst.blue <- img_crop[,,3] #extract blue values
sum.red <- sum(rst.red@.Data) #sum red values
sum.green <- sum(rst.green@.Data) #sum green values
sum.blue <- sum(rst.blue@.Data) #sum blue values
calc.greenness <- sum.green / (sum.red + sum.green + sum.blue) #calculate greenness










greenness <- function(xmin, xmax, ymin, ymax){ #create function for calculating greenness with arguments that identify the region of the picture to be measured
  
  #Load required libraries
  library(EBImage) 
  
  img_names <- Sys.glob("*.JPG") #get all file names in directory
  
  for (name in img_names){ #for each picture
    
    #Get and crop picture
    img <- readImage(name) #import image
    img_crop <- img[xmin:xmax, ymax:ymin, ] #crop image based on user specified coordinates
    
    #Calculate greenness
    rst.red <- img_crop[,,1] #extract red values
    rst.green <- img_crop[,,2] #extract green values
    rst.blue <- img_crop[,,3] #extract blue values
    sum.red <- sum(rst.red@.Data) #sum red values
    sum.green <- sum(rst.green@.Data) #sum green values
    sum.blue <- sum(rst.blue@.Data) #sum blue values
    calc.greenness <- sum.green / (sum.red + sum.green + sum.blue) #calculate greenness
    
    print(calc.greenness)
  }
  
}

