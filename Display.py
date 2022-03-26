from os import sep
import numpy as np
from matplotlib import pyplot as plt
import cv2


#A = np.fromfile('output.bin', dtype='uint8')
#A = (A.reshape([250,250]))
#print(A)
#cv2.imshow("img",A)
#cv2.waitKey(0)
#cv2.destroyAllWindows()


# Create an 5 x 5 matrix of 0's:
rows, cols = (250, 250)
file = open("output.bin", "r")
#arr=[]
#for i in range(rows):
 #   col = []
  #  for j in range(cols):
   #     col.append(0)
    #arr.append(col)
#print(arr)

arr=[]
for line in file:
    col = []
    for character in line:
        if (character!='\n'):
            col.append(255*int(character))
    arr.append(col)
            #print(character)

img = np.asmatrix(arr,dtype=np.uint8)
print(img)

cv2.imshow("img",img)
cv2.waitKey(0)
cv2.destroyAllWindows()
#print(arr)