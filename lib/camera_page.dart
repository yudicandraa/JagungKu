import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imageTemprorary = File(image.path);
      setState(() {
        this.image = imageTemprorary;
      });
    } on PlatformException {
      rethrow;
    }
  }

  late CameraController controller;

  Future<void> intializeCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget camera() {
      return FutureBuilder(
        future: intializeCamera(),
        builder: (_, snapshot) =>
            (snapshot.connectionState == ConnectionState.done)
                ? Container(
                    height: MediaQuery.of(context).size.width *
                        controller.value.aspectRatio /
                        1.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CameraPreview(controller),
                  )
                : const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            camera(),
          ],
        ),
      ),
    );
  }
}
