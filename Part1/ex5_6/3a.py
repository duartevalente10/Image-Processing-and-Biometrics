
import cv2 as cv
import numpy as np

# Open the Image
img = cv.imread('C:\\Users\\duart\\Desktop\\ISEL\\PIB\\Python\\bird.png')

# Apply intencity transformation.
c = 255/(np.log(1 + np.max(img)))
log_transformed = c * np.log(1 + img)

# Specify the data type.
log_transformed = np.array(log_transformed, dtype = np.uint8)

# Save the output.
cv.imwrite('bird.jpg', log_transformed)

