# Character Recognition GUI in MATLAB

This project is a MATLAB-based graphical user interface (GUI) designed for automatic text recognition from digital images using Optical Character Recognition (OCR). It was developed as part of a university assignment at the **Faculty of Automatic Control and Computer Engineering**.

## Project Overview

The main objective of the project is to build a computer vision system capable of recognizing characters written on white paper. The system allows the user to either select an image from their computer or capture one using a webcam, and then processes the image to extract text using OCR.

Key features:
- Load or capture an image in real-time
- Convert images to grayscale and resize for OCR accuracy
- Extract and display recognized text directly in the GUI
- Clean and intuitive user interface

## Implementation Details

The core script of the project is `imageGUI.m`, which:
- Creates the GUI window using `uifigure`
- Adds buttons and UI elements (`uibutton`, `uiaxes`, `uitextarea`)
- Handles image acquisition and OCR processing through callback functions

### GUI Components
- **Buttons**:
  - `Select Image` – choose an image from disk
  - `Capture Image` – take a snapshot using webcam
  - `Process Image` – perform OCR and display results
- **Axes** for displaying the image
- **Text Area** for showing recognized characters

### Functionality
- **selectImage()**: Opens a file dialog and loads an image
- **captureImage()**: Captures image from webcam
- **processImage()**: Processes the image (grayscale + resize) and performs OCR

### Key MATLAB Functions Used
- `uifigure`, `uibutton`, `uiaxes`, `uitextarea`
- `uigetfile`, `imread`, `imshow`
- `webcam`, `snapshot`, `clear`
- `rgb2gray`, `imresize`, `ocr`, `getimage`

## Results

The GUI allows seamless interaction for both loading and processing images. The recognized text is displayed in a user-friendly way and the system performs well with printed characters on plain backgrounds.

## Conclusion

This project showcases the power of MATLAB for building interactive applications that combine GUI design with image processing and character recognition. It can be further extended with features such as:
- Language detection
- Handwriting recognition
- Integration with databases
- Enhanced performance metrics

## Academic Context

This project was developed as part of a university assignment at the **Faculty of Automatic Control and Computer Engineering**.

## Author

**Denisa Gabriela Musteata**  
Student, Faculty of Automatic Control and Computer Engineering

## Bibliography

1. Smith, R. (2007). *An overview of the Tesseract OCR engine*. ICDAR.
2. Breuel, T. M. (2008). *The OCRopus open source OCR system*. Document Recognition and Retrieval XV.
3. Simard, P. Y., et al. (2003). *Best practices for convolutional neural networks applied to visual document analysis*. ICDAR.
4. Chen, X., Yuille, A. (2004). *Detecting and Reading Text in Natural Scenes*. CVPR.

---
