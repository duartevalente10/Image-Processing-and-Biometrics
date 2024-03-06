import cv2
import matplotlib.pyplot as plt
import numpy as np

# imagem
img = cv2.imread('C:\\Users\\duart\\Desktop\\ISEL\\PIB\\Python\\squares.png')

#plot da imagem
plt.subplot(1,2,1)
plt.imshow(img,cmap='gray')
plt.title('image')
plt.xticks([])
plt.yticks([])

#plot do histograma da imagem
plt.subplot(1,2,2)
hist,bin = np.histogram(img.ravel(),256,[0,255])
plt.xlim([0,255])
plt.plot(hist)
plt.title('histogram')

plt.show()

