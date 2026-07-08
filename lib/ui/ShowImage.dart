import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  final user = FirebaseAuth.instance.currentUser;

  String get _todayDate {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  Future<String> _getLocalPath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return path.join(directory.path, fileName);
  }

  Future<void> _updatePhoto() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images == null || images.isEmpty) return;

    final directory = await getApplicationDocumentsDirectory();

    for (var m in images) {
      String fileName =
          "img_${DateTime.now().microsecondsSinceEpoch}${path.extension(m.path)}";
      String savePath = path.join(directory.path, fileName);

      await File(m.path).copy(savePath);

      await FirebaseFirestore.instance.collection('photos').add({
        'fileName': fileName,
        'update_time': FieldValue.serverTimestamp(),
        'category': "未分類",
        'dateString': _todayDate,
        'isFavorite': false,
        'userId': user?.uid,
        'week': DateTime.now().weekday,
      });
    }
    print("success");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: _updatePhoto,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Column(children: [

      ]),

      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance
      //       .collection('photos')
      //       .where('userId', isEqualTo: user?.uid)
      //       .where('dateString', isEqualTo: _todayDate)
      //       .orderBy('update_time', descending: true)
      //       .snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //
      //     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      //       return const SizedBox(
      //         height: 200,
      //         child: Center(
      //           child: Text(
      //             "no photos QAQ",
      //             style: TextStyle(color: Colors.grey),
      //           ),
      //         ),
      //       );
      //     }
      //
      //     final photos = snapshot.data!.docs;
      //
      //     return SizedBox(
      //       height: 350,
      //       child: CarouselView(
      //         itemExtent: MediaQuery.of(context).size.width * 0.8,
      //         shrinkExtent: 200,
      //         children: photos.map((doc) {
      //           final String fName = doc['fileName'] as String;
      //           final String dStr = doc['dateString'] as String;
      //
      //           return FutureBuilder<String>(
      //             future: _getLocalPath(fName),
      //             builder: (context, pathSnapshot) {
      //               if (!pathSnapshot.hasData) return const SizedBox();
      //
      //               return Image.file(
      //                 File(pathSnapshot.data!),
      //                 fit: BoxFit.cover,
      //               );
      //             },
      //           );
      //         }).toList(),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
