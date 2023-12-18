import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/Pages/play_song.dart';
import 'package:music_app/components/song_header.dart';
import 'package:music_app/components/song_title.dart';
import 'package:music_app/components/trending_slider.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/cloud_songcntrl.dart';
import 'package:music_app/controller/song_data_cntrl.dart';
import 'package:music_app/controller/song_play_control.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataCtrl songDataCtrl = Get.put(SongDataCtrl());
    SongPlayCntrl songPlayCntrl = Get.put(SongPlayCntrl());
    CloudSongCntrl cloudSongCntrl = Get.put(CloudSongCntrl());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SongHeader(),
              const SizedBox(height: 20),
              TrendingSlider(),
              const SizedBox(height: 20),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          songDataCtrl.isDeviceSong.value = true;
                        },
                        child: Text("Device Song",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: songDataCtrl.isDeviceSong.value
                                          ? primaryColor
                                          : lableColor,
                                    ))),
                    InkWell(
                        onTap: () {
                          songDataCtrl.isDeviceSong.value = false;
                        },
                        child: Text("Cloud Song",
                            style:
                                Theme.of(context).textTheme.bodySmall?.
                                copyWith(
                                      color: songDataCtrl.isDeviceSong.value
                                          ? lableColor
                                          : primaryColor,
                                    ))),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => songDataCtrl.isDeviceSong.value
                    ? Column(
                        children: songDataCtrl.localSongList.value
                            .map((e) => SongTitle(
                                  onPress: () {
                                    songPlayCntrl.playLocalAudio(e);
                                    songDataCtrl
                                        .findCurrentSongPlayingIndex(e.id);
                                    Get.to(PlaySong());
                                  },
                                  songName: e.title,
                                ))
                            .toList())
                    : Column(
                        children: cloudSongCntrl.cloudSongList.value
                            .map(
                              (e) => SongTitle(
                                onPress: () {
                                  songPlayCntrl.playCloudAudio(e);
                                  if (e.id != null) {
                                    songDataCtrl
                                        .findCurrentSongPlayingIndex(e.id!);
                                  }
                                  Get.to(PlaySong());
                                },
                                songName: e.title ??
                                    'Unknown Song', // Menggunakan operator ?? untuk memberikan nilai default jika e.title null
                              ),
                            )
                            .toList(),
                      ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
