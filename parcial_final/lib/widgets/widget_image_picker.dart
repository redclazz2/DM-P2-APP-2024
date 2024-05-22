import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:parcial_final/data/data_context.dart';
import 'package:parcial_final/data/shared_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetImagePicker extends StatefulWidget {
  const WidgetImagePicker({super.key});

  @override
  State<WidgetImagePicker> createState() => _WidgetImagePickerState();
}

class _WidgetImagePickerState extends State<WidgetImagePicker> {
  File? _image;
  final _picker = ImagePicker();
  SharedDataContext sharedContext = SharedDataContext();
  DataContext dataContext = DataContext();

  Future<void> openImagePicker() async {
    SharedPreferences shared = await sharedContext.prefs;
    
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        //shared.setString("AuthEmail", "zarate@icloud.com");
        //shared.setString("AuthToken", "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcwMDcxMTZ9.5wRn5SD0DrjEDmnBisToahKR7ji8xonWxvHJ_7z85ujtydHSHF9lnw3T_3tNs5QXZBM88fgm1nyZh6FYPa_8xg");
        shared.setString("selectedImage", _image!.path);
        //dataContext.uploadImage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            color: Colors.black,
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Please select an image'),
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(
                onPressed: openImagePicker,
                child: const Text(
                  'Select an Image',
                  textAlign: TextAlign.center,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
