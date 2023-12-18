import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/config/colors.dart';
import 'package:music_app/controller/song_play_control.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongVolume extends StatelessWidget {
  const SongVolume({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SongPlayCntrl songPlayCntrl = Get.put(SongPlayCntrl());
    return Obx(() => SfRadialGauge(
          animationDuration: 1,
          enableLoadingAnimation: true,
          axes: [
            RadialAxis(
              useRangeColorForAxis: true,
              startAngle: 0,
              endAngle: 180,
              canRotateLabels: false,
              interval: 10,
              isInversed: false,
              maximum: 1,
              minimum: 0,
              showAxisLine: true,
              showLabels: false,
              showTicks: true,
              ranges: [
                GaugeRange(
                  startValue: 0,
                  endValue: songPlayCntrl.volumLbl.value,
                  color: primaryColor,
                )
              ],
              pointers: [
                MarkerPointer(
                  color: primaryColor,
                  value: songPlayCntrl.volumLbl.value,
                  onValueChanged: (value) {
                    songPlayCntrl.changeVolume(value);
                  },
                  enableAnimation: true,
                  enableDragging: true,
                  markerType: MarkerType.diamond,
                  markerWidth: 20,
                  markerOffset: 20,
                )
              ],
              annotations: [
                GaugeAnnotation(
                  horizontalAlignment: GaugeAlignment.center,
                  widget: songPlayCntrl.isCloudSongPlaying.value ? Container(
                    width: 270,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      image: DecorationImage(
                        image: NetworkImage(songPlayCntrl.albumUrl.value),
                        fit: BoxFit.cover 
                      ),
                      color: divColor,
                    ),
                  ) : Container(
                    width: 270,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      image: DecorationImage(
                        image: AssetImage("assets/images/pict2.png"), 
                        fit: BoxFit.cover
                      ),
                      color: divColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
