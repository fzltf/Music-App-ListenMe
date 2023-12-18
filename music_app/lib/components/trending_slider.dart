import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_app/Pages/play_song.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/cloud_songcntrl.dart';
import 'package:music_app/controller/song_data_cntrl.dart';
import 'package:music_app/controller/song_play_control.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongCntrl cloudSongCntrl = Get.put(CloudSongCntrl());
    SongPlayCntrl songPlayCntrl = Get.put(SongPlayCntrl());
    SongDataCtrl songDataCtrl = Get.put(SongDataCtrl());
    List<Widget> sliderItem = cloudSongCntrl.trendingSongList.value
        .map((e) => InkWell(
              onTap: () {
                songPlayCntrl.playCloudAudio(e);
                songDataCtrl.findCurrentSongPlayingIndex(e.id!);
                Get.to(PlaySong());
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(e.albumArt!),
                      fit: BoxFit.cover,
                    ),
                    color: divColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: divColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/music_note.svg", 
                                          color: Color(0xffFFFFFF)),
                                      SizedBox(width: 10),
                                      Text(
                                        "Trending",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(
                                  "${e.artist}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF)
                                      ),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${e.title}",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    return CarouselSlider(
        items: sliderItem,
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, value) {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
