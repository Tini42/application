import 'package:app/screen/camera_screen.dart';
import 'package:app/screen/image_screen.dart';
import 'package:app/screen/text_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0), // Thêm khoảng cách bên trên
            child: Text(
              "VĂN HÓA VIỆT NAM",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20), // Khoảng cách từ app bar
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  'assets/images/pic.jpg',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column bên trái chứa biểu tượng ứng dụng
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/image.jpg', // Đường dẫn tới ảnh biểu tượng
                      width: 60,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 1), // Khoảng cách giữa hai Column
                  // Column bên phải chứa nút "Chọn hình ảnh"
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 30.0, vertical: 20.0),
                          padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 20.0), // Giảm padding bên trái
                          backgroundColor: Colors.white.withOpacity(0.7),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ImageScreen()),
                          );
                        },
                        child: const Text(
                          "Chọn hình ảnh",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column bên trái chứa biểu tượng ứng dụng
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/camera.jpg', // Đường dẫn tới ảnh biểu tượng
                      width: 60,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 1), // Khoảng cách giữa hai Column
                  // Column bên phải chứa nút "Chọn hình ảnh"
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 30.0, vertical: 20.0),
                          padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 20.0), // Giảm padding bên trái
                          backgroundColor: Colors.white.withOpacity(0.7),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CameraScreen()),
                          );
                        },
                        child: const Text(
                          "Chụp ảnh",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column bên trái chứa biểu tượng ứng dụng
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/text.png', // Đường dẫn tới ảnh biểu tượng
                      width: 60,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 1), // Khoảng cách giữa hai Column
                  // Column bên phải chứa nút "Chọn hình ảnh"
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 30.0, vertical: 20.0),
                          padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 20.0), // Giảm padding bên trái
                          backgroundColor: Colors.white.withOpacity(0.7),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TextScreen()),
                          );
                        },
                        child: const Text(
                          "Nhập văn bản",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
