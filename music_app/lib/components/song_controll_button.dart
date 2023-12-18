
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/song_data_cntrl.dart';
import 'package:music_app/controller/song_play_control.dart';

class SongBtnControl extends StatelessWidget {
  const SongBtnControl({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayCntrl songPlayCntrl = Get.put(SongPlayCntrl());
    SongDataCtrl songDataCtrl = Get.put(SongDataCtrl());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${songPlayCntrl.currentTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                  child: Obx(
                () => Slider(
                  value: songPlayCntrl.sliderValue.value
                      .clamp(0.0, songPlayCntrl.sliderValue.value),
                  onChanged: (value) {
                    songPlayCntrl.sliderValue.value = value;
                    Duration songPosition = Duration(seconds: value.toInt());
                    songPlayCntrl.changeSongSlider(songPosition);
                  },
                  min: 0,
                  max: songPlayCntrl.sliderMaxValue.value,
                ),
              )),
              Text(
                "${songPlayCntrl.totalTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                songDataCtrl.playPreviousSong();
              },
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                color: lableColor,
                width: 20,
              ),
            ),
            SizedBox(width: 40),
            Obx(
              () => songPlayCntrl.isPlaying.value
                  ? InkWell(
                      onTap: () {
                        songPlayCntrl.pausePlaying();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/pause.svg",
                            width: 20,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        songPlayCntrl.resumePlaying();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/play.svg",
                            width: 20,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(width: 40),
            InkWell(
              onTap: () {
                songDataCtrl.playNextSong();
              },
              child: SvgPicture.asset(
                "assets/icons/next.svg",
                color: lableColor,
                width: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                songPlayCntrl.playRandomSong();
              },
              child: Obx(() => 
              SvgPicture.asset(
                "assets/icons/suffle.svg",
                width: 20,
                color: songPlayCntrl.isSuffeled.value ? primaryColor : lableColor,
              ),)
            ),
            SvgPicture.asset(
              "assets/icons/songbook.svg",
              width: 20,
              color: lableColor,
            ),
            SvgPicture.asset(
              "assets/icons/love.svg",
              width: 20,
              color: lableColor,
            ),
            InkWell(
                onTap: () {
                  songPlayCntrl.setLoopSong();
                },
                child: Obx(
                  () => SvgPicture.asset(
                    "assets/icons/repeat.svg",
                    width: 20,
                    color:
                        songPlayCntrl.isLoop.value ? primaryColor : lableColor,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
