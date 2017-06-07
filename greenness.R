


library(EBImage) #Load necessary library

img <- readImage('~/havardii_testpics/havardii_picture(1).jpg') #import image 
img_crop <- img[200:300, 600:500,] #crop image based on user specified coordinates

rst.red <- img_crop[,,1] #extract red values
rst.green <- img_crop[,,2] #extract green values
rst.blue <- img_crop[,,3] #extract blue values
sum.red <- sum(rst.red@.Data) #sum red values
sum.green <- sum(rst.green@.Data) #sum green values
sum.blue <- sum(rst.blue@.Data) #sum blue values
greenness <- sum.green / (sum.red + sum.green + sum.blue) #calculate greenness
