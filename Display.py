from os import sep
import numpy as np
from matplotlib import pyplot as plt
import cv2


rows, cols = (250, 250)
file = open("output.txt", "r")

arr=[]
for line in file:
    col = []
    for character in line:
        if (character!='\n'):
            col.append(255*int(character))
    arr.append(col)
            #print(character)

img = np.asmatrix(arr,dtype=np.uint8)
#print(img)

cv2.imshow("img",img)
cv2.waitKey(0)
cv2.destroyAllWindows()
