import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/components/play_header_btn.dart';
import 'package:music_app/components/song_volume.dart';
import 'package:music_app/components/song_controll_button.dart';
import 'package:music_app/components/song_detail.dart';
import 'package:music_app/components/song_wave.dart';
import 'package:music_app/config/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class PlaySong extends StatelessWidget {

  const PlaySong({super.key,});

  @override
  Widget build(BuildContext context) {
    var value = 20.0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              PlayHeaderButton(),
              SizedBox(height: 10),
              SongVolume(),
              SizedBox(height: 40),
              DetailSong(
               
              ),
              SizedBox(height: 10),
              Spacer(),
              SongBtnControl(),
            ],
          ),
        ),
      ),
    );
  }
}
