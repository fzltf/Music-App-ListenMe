import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:music_app/Model/my_song.dart';

class CloudSongCntrl extends GetxController {
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList = RxList<MySongModel>([]);
  RxList<MySongModel> trendingSongList = RxList<MySongModel>([]);

  @override
  void onInit() {
    getCloudSong();
    // TODO: implement onInit
    super.onInit();
  }

  void uploadSongToDB() async {
    MySongModel newSong = MySongModel(
      id: 1,
      title: "Dynamite",
      artist: "BTS",
      album: "album",
      albumArt:
          "https://ibighit.com/bts/images/bts/discography/dynamite/Q7gBkUusiDcIYljQOMX9ow6W.jpg",
      data:
          "https://firebasestorage.googleapis.com/v0/b/listenme-de793.appspot.com/o/BTS%20-%20Dynamite.mp3?alt=media&token=c3d6a567-3f18-482c-afcb-a44952712c1d",
    );
    await db.collection("trending").add(newSong.toJson());
    print("Song Upload to Database");
  }

  void getCloudSong() async {
    cloudSongList.clear();
    await db.collection("songs").get().then((value) {
      value.docs.forEach((element) {
        cloudSongList.add(MySongModel.fromJson(element.data()));
      });
    });

    await db.collection("trending").get().then((value) {
      value.docs.forEach((element) {
        trendingSongList.add(MySongModel.fromJson(element.data()));
      });
    });
  }
}
