import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoadContentView extends StatefulWidget {
  const LoadContentView({super.key});

  @override
  State<LoadContentView> createState() => _LoadContentViewState();
}

class _LoadContentViewState extends State<LoadContentView> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    //! Model B
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(File(_image!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      strokeAlign: BorderSide.strokeAlignCenter,
                      width: 8,
                      color: Colors.purple,
                    )),
                //! Model A
                // child: _image != null

                //     ? Image.file(File(_image!.path))
                //     : Container(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async {
                  // _imagePicker.pickMultiImage(source: source)
                  // _imagePicker.pickMultipleMedia(source: source)
                  // _imagePicker.pickVideo(source: source)
                  // _imagePicker.pickMedia(source: source)
                  _image =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: const Text('Image Picker'))
          ],
        ),
      ),
    );
  }
}
