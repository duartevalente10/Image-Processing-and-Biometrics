import java.util.Scanner;

import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.highgui.HighGui;
import org.opencv.imgcodecs.Imgcodecs;

class BasicLinearTransforms {
    private byte saturate(double val) {
        int iVal = (int) Math.round(val);
        iVal = iVal > 255 ? 255 : (iVal < 0 ? 0 : iVal);
        return (byte) iVal;
    }

    public void run(String[] args) {
        /// Read image given by user
        //! [basic-linear-transform-load]
        String imagePath = args.length > 0 ? args[0] : "C:\\Users\\duart\\Desktop\\ISEL\\PIB\\MatLab\\out.png";
        Mat image = Imgcodecs.imread(imagePath);
        if (image.empty()) {
            System.out.println("Empty image: " + imagePath);
            System.exit(0);
        }
        //! [basic-linear-transform-load]

        //! [basic-linear-transform-output]
        Mat newImage = Mat.zeros(image.size(), image.type());
        //! [basic-linear-transform-output]

        //! [basic-linear-transform-parameters]
        double alpha = 1.0; /*< Simple contrast control */
        int beta = 0;       /*< Simple brightness control */

        alpha = 2;
        beta = -100;
        
        byte[] imageData = new byte[(int) (image.total()*image.channels())];
        image.get(0, 0, imageData);
        byte[] newImageData = new byte[(int) (newImage.total()*newImage.channels())];
        for (int y = 0; y < image.rows(); y++) {
            for (int x = 0; x < image.cols(); x++) {
                for (int c = 0; c < image.channels(); c++) {
                    double pixelValue = imageData[(y * image.cols() + x) * image.channels() + c];
                    /// Java byte range is [-128, 127]
                    pixelValue = pixelValue < 0 ? pixelValue + 256 : pixelValue;
                    newImageData[(y * image.cols() + x) * image.channels() + c]
                            = saturate(alpha * pixelValue + beta);
                }
            }
        }
        newImage.put(0, 0, newImageData);
        //! [basic-linear-transform-operation]

        //! [basic-linear-transform-display]
        /// Show stuff
        HighGui.imshow("Original Image", image);
        HighGui.imshow("imajust", newImage);

        /// Wait until user press some key
        HighGui.waitKey();
        //! [basic-linear-transform-display]
        System.exit(0);
    }
}