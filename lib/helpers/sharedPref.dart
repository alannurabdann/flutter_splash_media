import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SharedPref extends GetxController {
  static final box = GetStorage();

  String get getLocalPath => box.read('localpath') ?? "";
  void saveLocalPath(String val) => box.write('localpath', val);
}
