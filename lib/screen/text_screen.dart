import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Tìm bằng văn bản",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     "Chọn hình ảnh",
            //     style: TextStyle(fontSize: 16, color: Colors.black),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: null, // Đặt null để cho phép mở rộng theo văn bản
                decoration: InputDecoration(
                  hintText: "Nhập văn bản...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Dự đoán",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Row(
                
            //   ),
            // ),
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
    );
  }
}
