import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/cloud_songcntrl.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongCntrl cloudSongCntrl = Get.put(CloudSongCntrl());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('CALL DATABASE'),
          onPressed: () {
            cloudSongCntrl.uploadSongToDB();
          },
        ),
      ),
    );
  }
}
