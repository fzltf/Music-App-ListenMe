import 'package:get/get.dart';
import 'package:music_app/Pages/song_page.dart';

class SplashScreenCntrl extends GetxController{
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
      Get.offAll(SongPage());
    });
  }
}