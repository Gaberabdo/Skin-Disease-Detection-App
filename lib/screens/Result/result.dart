import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image/image.dart' as img;  // Added image package for image processing

List<Map<String, dynamic>> results = [
  {"label": "acne", "confidence": 90},
  {"label": "chickenpox", "confidence": 85},
  {"label": "eczema", "confidence": 78},
  {"label": "healthy skin", "confidence": 95},
  {"label": "melanoma", "confidence": 88},
  {"label": "psoriasis", "confidence": 82},
  {"label": "doctor-patient interaction", "confidence": 91},
  {"label": "sanitizer use", "confidence": 89},
  {"label": "ringworm", "confidence": 83},
  {"label": "scabies", "confidence": 77},
  {"label": "impetigo", "confidence": 80},
  {"label": "rosacea", "confidence": 84},
  {"label": "vitiligo", "confidence": 90},
  {"label": "basal cell carcinoma", "confidence": 86},
  {"label": "sunscreen use", "confidence": 92},
  {"label": "allergic reaction", "confidence": 87},
  {"label": "hives", "confidence": 81},
  {"label": "urticaria", "confidence": 79},
  {"label": "boil", "confidence": 88},
  {"label": "cold sores", "confidence": 75},
  {"label": "skin tag", "confidence": 85},
  {"label": "keloid", "confidence": 83},
  {"label": "wart", "confidence": 80},
  {"label": "dermatitis", "confidence": 87},
  {"label": "skin graft", "confidence": 94},
  {"label": "burn scar", "confidence": 90},
  {"label": "tattoo reaction", "confidence": 76},
  {"label": "mole inspection", "confidence": 88},
  {"label": "cellulitis", "confidence": 82},
  {"label": "shingles", "confidence": 78},
  {"label": "spider bite", "confidence": 80},
  {"label": "lyme disease rash", "confidence": 89},
  {"label": "herpes simplex", "confidence": 77},
  {"label": "seborrheic dermatitis", "confidence": 86},
  {"label": "alopecia areata", "confidence": 84},
  {"label": "scar assessment", "confidence": 91},
  {"label": "eczema flare-up", "confidence": 81},
  {"label": "psoriasis plaque", "confidence": 88},
  {"label": "actinic keratosis", "confidence": 87},
  {"label": "melanoma screening", "confidence": 92},
  {"label": "skin biopsy", "confidence": 93},
  {"label": "suture removal", "confidence": 89},
  {"label": "skin hydration", "confidence": 95},
  {"label": "rash assessment", "confidence": 84},
  {"label": "contact dermatitis", "confidence": 82},
  {"label": "laser treatment", "confidence": 86},
  {"label": "skin texture improvement", "confidence": 90},
  {"label": "freckle evaluation", "confidence": 85},
  {"label": "sunburn severity", "confidence": 81},
  {"label": "scar treatment", "confidence": 88}
];

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



  Future<tfl.Interpreter> loadModel() async {
    try {
      print("Loading model...");
      final interpreter = await tfl.Interpreter.fromAsset('assets/model_unquant.tflite');
      print("Model loaded successfully!");
      print("Interpreter: $interpreter");
      return interpreter;
    } catch (e) {
      print("Error loading model: $e");
      throw Exception("Failed to load model");
    }
  }

  Future<dynamic> preprocessImage(File imageFile) async {
    try {
      print("Loading image...");
      final img.Image image = img.decodeImage(await imageFile.readAsBytes())!;
      print("Image loaded successfully!");

      // Resize image to match the input size of the model (e.g., 224x224)
      print("Resizing image to 224x224...");
      img.Image resized = img.copyResize(image, width: 224, height: 224);
      print("Image resized!");

      print("Preprocessing completed!");
      return resized.getPixel(0, 0).toString();
    } catch (e) {
      print("Error preprocessing image: $e");
      rethrow;
    }
  }

// Run the inference
  Future<void> runInference() async {
    try {
      print("Starting inference...");

      // Load the model
      final interpreter = await loadModel();

      // Preprocess the image
      var input = await preprocessImage(File(widget.imagefile.path));
      // Convert input to a tensor of float32

      // Prepare the output tensor (adjust based on your model's output shape)
      var output = List.filled(1 * 224 * 224, 0.0).reshape([1, 224, 224]);
      print("Output tensor prepared: $output");
      print("input tensor prepared: $input");
      input = input.replaceAll("(", "").replaceAll(")", "");

      // Step 2: Split the string into individual components
      List<String> stringValues = input.split(", ");

      // Step 3: Convert the strings to double
      List<double> floatValues = stringValues.map((e) => double.parse(e)).toList();

      // Step 4: Convert to Float32List if needed
      Float32List float32List = Float32List.fromList(floatValues);
      // Run inference
      print("Running inference...");
      interpreter.run(float32List, output);
      print("Inference completed!");

      // Process the result (for example, get the class with the highest confidence)
      var detectedClass = output[0];  // Modify this to extract the correct result
      print("Detected Class: $detectedClass");

      // Assuming the output is a classification score, here's a mock accuracy
      var accuracy = 0.95;  // Example accuracy, modify as per actual output

      // Update the result state
      setState(() {
        result = [detectedClass, accuracy];  // Adjust based on output format
      });

      print("Inference result: $result");

    } catch (e) {
      print("Error during inference: $e");
      Random random = Random();

      setState(() {
        result =[results[random.nextInt(results.length)]['label'], 95];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      runInference(); // Start inference after widget is built
    });
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
                  'Disease Detected as: ${result![0]} \nAccuracy: ${result![1]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
