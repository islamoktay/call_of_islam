import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:prayer_times_project/screens/home_page/constants/prayer_times_constants.dart';
import 'package:prayer_times_project/services/extensions/string_extension.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'dart:async';

import 'package:prayer_times_project/services/locale_keys.g.dart';

class CountdownText extends StatefulWidget {
  const CountdownText({
    Key key,
  }) : super(key: key);
  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  int hourOfRemain, minuteOfRemain;
  Timer timer;
  @override
  void initState() {
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => calculateCountdown());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return hourOfRemain != null && minuteOfRemain != null
        ? Text(
            '$hourOfRemain ${LocaleKeys.general_hour.locale} $minuteOfRemain ${LocaleKeys.general_min.locale}',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.tertiaryColor,
            ),
          )
        : Container(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.tertiaryColor,
            ),
          );
  }

  Future<void> calculateCountdown() async {
    setState(() {});
    DateTime nowTime = DateTime.now().toLocal();
    switch (PrayerTimesConstants.prayerTimes.nextPrayer()) {
      case Prayer.fajr:
        return buildCountdownText(
            nowTime, PrayerTimesConstants.prayerTimes.fajr.toLocal());
        break;
      case Prayer.sunrise:
        return buildCountdownText(
            nowTime, PrayerTimesConstants.prayerTimes.sunrise.toLocal());

        break;
      case Prayer.dhuhr:
        return buildCountdownText(
            nowTime, PrayerTimesConstants.prayerTimes.dhuhr.toLocal());

        break;
      case Prayer.asr:
        return buildCountdownText(
            nowTime, PrayerTimesConstants.prayerTimes.asr.toLocal());

        break;
      case Prayer.maghrib:
        return buildCountdownText(
            nowTime, PrayerTimesConstants.prayerTimes.maghrib.toLocal());

        break;
      case Prayer.isha:
        return buildCountdownText(
            nowTime, PrayerTimesConstants.prayerTimes.isha.toLocal());

        break;
      default:
        return buildCountdownText(
            nowTime,
            PrayerTimesConstants.prayerTimes.fajr
                .add(Duration(days: 1))
                .toLocal());
    }
  }

  buildCountdownText(DateTime nowTime, DateTime relatedPrayerTime) {
    Duration differenceBetween = relatedPrayerTime.difference(nowTime);
    hourOfRemain = differenceBetween.inHours;
    minuteOfRemain = differenceBetween.inMinutes % 60;
  }
}
