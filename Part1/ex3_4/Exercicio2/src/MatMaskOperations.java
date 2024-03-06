import org.opencv.core.Core;

public class MatMaskOperations {
    public static void main(String[] args) {
        // Load the native OpenCV library
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

        new BasicLinearTransforms().run(args);
    }
}