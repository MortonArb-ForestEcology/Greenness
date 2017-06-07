


library(EBImage)
img2 <- readImage('~/havardii_testpics/havardii_picture(1).jpg')
img_2crop <- img2[200:300, 600:500,]

rst.red <- img_2crop[,,1]
rst.green <- img_2crop[,,2]
rst.blue <- img_2crop[,,3]
sum.red <- sum(rst.red@.Data)
sum.green <- sum(rst.green@.Data)
sum.blue <- sum(rst.blue@.Data)
greenness <- sum.green / (sum.red + sum.green + sum.blue)
