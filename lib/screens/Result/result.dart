import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:tflite_flutter/tflite_flutter.dart'; // Ensure you have this import for using the interpreter

// ignore: must_be_immutable
class Result extends StatefulWidget {
  Result({
    Key? key,
    required this.imagefile,
  }) : super(key: key);

  XFile imagefile;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List? result;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      runModel();
    });
  }

  Future<String> convertImageToBase64(XFile imageFile) async {
    // Step 1: Read the image file
    final bytes = await imageFile.readAsBytes();

    // Step 2: Convert bytes to Base64 string
    String base64String = base64.encode(bytes);

    return base64String;
  }

  Future<Float32List> base64ImageToFloat32List(String base64String,
      {int targetWidth = 127, int targetHeight = 127}) async {
    // Step 1: Decode the Base64 string to bytes
    Uint8List bytes = base64.decode(base64String);

    // Step 2: Create a Float32List to hold the normalized pixel values
    Float32List input = Float32List(1 * targetHeight * targetWidth * 3); // 1 for batch size, 3 for RGB

    // Assuming the original image size is known and matches target dimensions
    for (int y = 0; y < targetHeight; y++) {
      for (int x = 0; x < targetWidth; x++) {
        // Calculate the pixel index in the RGBA format
        int pixelIndex = (y * targetWidth + x) * 4; // RGBA has 4 bytes per pixel

        // Ensure the pixelIndex is within the bounds of the bytes array
        if (pixelIndex + 3 < bytes.length) { // Check for RGBA bounds
          // Extract RGB components from the byte array
          int r = bytes[pixelIndex]; // Red
          int g = bytes[pixelIndex + 1]; // Green
          int b = bytes[pixelIndex + 2]; // Blue

          // Normalize the values to the range [0.0, 1.0]
          input[0 * targetHeight * targetWidth * 3 + (y * targetWidth + x) * 3 + 0] = r / 255.0; // Red
          input[0 * targetHeight * targetWidth * 3 + (y * targetWidth + x) * 3 + 1] = g / 255.0; // Green
          input[0 * targetHeight * targetWidth * 3 + (y * targetWidth + x) * 3 + 2] = b / 255.0; // Blue
        }
      }
    }

    return input;
  }

  Future<void> runModel() async {
    try {
      final interpreter =
      await tfl.Interpreter.fromAsset('assets/model/model_unquant.tflite');

      String base64String = await convertImageToBase64(widget.imagefile);
      Float32List inputTensor = await base64ImageToFloat32List(base64String);

      // Prepare output buffer
      var output = List.filled(1 * 2, 0).reshape([1, 2]); // Adjust shape based on your model's expected output
      interpreter.run(inputTensor, output);

      setState(() {
        result = output[0]; // Process your output here
      });

      print(output);
    } catch (e) {
      print("Error loading model or running inference: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Result Page"),
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.file(File(widget.imagefile.path)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                result == null
                    ? const Text('Image Not Found')
                    : Text(
                        'Disease Detected as: ${result![0]} \nAccuracy: ${result![1]}', // Adjust based on your output structure
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
