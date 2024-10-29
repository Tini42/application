import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  File? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      _cameraController = CameraController(firstCamera, ResolutionPreset.high);

      _initializeControllerFuture = _cameraController.initialize();
      setState(() {});
    } catch (e) {
      print("Lỗi khi khởi tạo camera: $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/${DateTime.now()}.png';
      final imageFile = File(image.path);
      final savedImage = await imageFile.copy(imagePath);

      setState(() {
        _capturedImage = savedImage;
      });
    } catch (e) {
      print("Lỗi chụp ảnh: $e");
    }
  }

  void _predictImage() {
    if (_capturedImage != null) {
      print("Dự đoán ảnh: ${_capturedImage!.path}");
      // Gọi API dự đoán hoặc thực hiện xử lý ảnh khác
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Chụp ảnh", 
        style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        )),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: _capturedImage == null
                  ? FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _cameraController.value.aspectRatio,
                            child: CameraPreview(_cameraController),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )
                  : Image.file(_capturedImage!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: _takePicture,
                  child: const Icon(Icons.camera),
                ),
                const SizedBox(height: 10),
                if (_capturedImage != null)
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _predictImage,
                        child: const Text(
                          "Dự đoán",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kết quả dự đoán",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text("Kết quả: cbsdhcb"),
                      Text("Độ chính xác: 50%"),
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
