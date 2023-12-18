import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/song_play_control.dart';

class DetailSong extends StatelessWidget {
  const DetailSong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SongPlayCntrl songPlayCntrl = Get.put(SongPlayCntrl());
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/play_outline.svg",
            color: lableColor,
            ),
            SizedBox(width: 10),
            Text(
              "400 Play",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Obx (() => Text(
                "${songPlayCntrl.songTitle.value}",
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),)
            ),
            SvgPicture.asset(
              "assets/icons/download.svg",
              color: lableColor,
              width: 25,
            ),
          ],
        ),
        SizedBox(height: 10),
       Obx(() =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${songPlayCntrl.songArtis.value}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),)
      ],
    );
  }
}
