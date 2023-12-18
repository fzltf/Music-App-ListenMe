import 'package:get/get.dart';
import 'package:music_app/Model/my_song.dart';
import 'package:music_app/controller/cloud_songcntrl.dart';
import 'package:music_app/controller/song_play_control.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class SongDataCtrl extends GetxController {
  CloudSongCntrl cloudSongCntrl = Get.put(CloudSongCntrl());
  SongPlayCntrl songPlayCntrl = Get.put(SongPlayCntrl());
  final audioQuery = OnAudioQuery();

  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongPlayIndex = 0.obs;

  @override
  void onInit() {
    //TODO: implemenet onInit
    super.onInit();
    storagePermission();
  }

  void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  void storagePermission() async {
    try {
      var perm = await Permission.storage.request();

      if (perm.isGranted) {
        print('Permission granted');
        getLocalSongs();
      } else {
        print('Permission denied');
        await Permission.storage.request();
      }
    } catch (ex) {
      print(ex);
    }
  }

  void findCurrentSongPlayingIndex(int songId) {
    var index = 0;
    localSongList.forEach((e) {
      if (e.id == songId) {
        currentSongPlayIndex.value = index;
      }
      index++;
    });
    print(songId);
    print(currentSongPlayIndex);
  }

  void playNextSong() {
    int songListLen = cloudSongCntrl.cloudSongList.length;
    currentSongPlayIndex.value = currentSongPlayIndex.value + 1;
    print('Current Index: ${currentSongPlayIndex.value}');

    if (currentSongPlayIndex.value < songListLen) {
      MySongModel nextSong = cloudSongCntrl.cloudSongList[currentSongPlayIndex.value];
      songPlayCntrl.playCloudAudio(nextSong);
    }
  }

  void playPreviousSong() {
    int songListLen = cloudSongCntrl.cloudSongList.length;
    print(currentSongPlayIndex.value);

    if (currentSongPlayIndex.value != 0) {
      currentSongPlayIndex.value = --currentSongPlayIndex.value;

      if (currentSongPlayIndex.value < songListLen) {
        MySongModel previousSong = cloudSongCntrl.cloudSongList[currentSongPlayIndex.value];
        songPlayCntrl.playCloudAudio(previousSong);
      }
    }
  }
}
