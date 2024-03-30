import 'package:image_picker/image_picker.dart';

PickImage() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? _image = await imagePicker.pickImage(source: ImageSource.gallery);

  if (_image != null) {
    return await _image.readAsBytes();
  }
}
