import 'package:flutter/material.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/components/time_chip_for_prayer.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/model/prayer_times_model.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';

class PrayerTimesPerMonth extends StatefulWidget {
  final PrayerTimesForMonth prayerTimesPerMonthModel;

  const PrayerTimesPerMonth({Key key, this.prayerTimesPerMonthModel})
      : super(key: key);
  @override
  State<PrayerTimesPerMonth> createState() => _PrayerTimesPerMonthState();
}

class _PrayerTimesPerMonthState extends State<PrayerTimesPerMonth> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                buildTimeOfPrayer(
                    widget.prayerTimesPerMonthModel.dateOfRelatedTime),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
              ),
            ),
            Column(
              children: [
                TimeChipForPrayer(
                  stringPrayTime: 'Fajr',
                  datePrayeTime: widget.prayerTimesPerMonthModel.fajrTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: 'Sunrise',
                  datePrayeTime: widget.prayerTimesPerMonthModel.sunriseTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: 'Dhuhr',
                  datePrayeTime: widget.prayerTimesPerMonthModel.dhuhrTime,
                ),
              ],
            ),
            Column(
              children: [
                TimeChipForPrayer(
                  stringPrayTime: 'Asr',
                  datePrayeTime: widget.prayerTimesPerMonthModel.asrTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: 'Maghrib',
                  datePrayeTime: widget.prayerTimesPerMonthModel.maghribTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: 'Isha',
                  datePrayeTime: widget.prayerTimesPerMonthModel.ishaTime,
                ),
              ],
            ),
          ],
        ));
  }

  String buildTimeOfPrayer(DateTime timeOfPrayer) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'Oct',
      'Nov',
      'Dec'
    ];
    String date =
        '${timeOfPrayer.day} ${months[timeOfPrayer.month - 1]} ${timeOfPrayer.year}';
    return date;
  }
}
