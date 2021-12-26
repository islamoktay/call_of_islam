import 'package:flutter/material.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/components/time_chip_for_prayer.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/model/prayer_times_model.dart';
import 'package:prayer_times_project/services/extensions/string_extension.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/locale_keys.g.dart';

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
          color: FlutterFlowTheme.darkerPrimaryBlue,
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
                  stringPrayTime: LocaleKeys.prayer_times_fajr.locale,
                  datePrayeTime: widget.prayerTimesPerMonthModel.fajrTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: LocaleKeys.prayer_times_sunrise.locale,
                  datePrayeTime: widget.prayerTimesPerMonthModel.sunriseTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: LocaleKeys.prayer_times_dhuhr.locale,
                  datePrayeTime: widget.prayerTimesPerMonthModel.dhuhrTime,
                ),
              ],
            ),
            Column(
              children: [
                TimeChipForPrayer(
                  stringPrayTime: LocaleKeys.prayer_times_asr.locale,
                  datePrayeTime: widget.prayerTimesPerMonthModel.asrTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: LocaleKeys.prayer_times_maghrib.locale,
                  datePrayeTime: widget.prayerTimesPerMonthModel.maghribTime,
                ),
                Spacer(),
                TimeChipForPrayer(
                  stringPrayTime: LocaleKeys.prayer_times_isha.locale,
                  datePrayeTime: widget.prayerTimesPerMonthModel.ishaTime,
                ),
              ],
            ),
          ],
        ));
  }

  String buildTimeOfPrayer(DateTime timeOfPrayer) {
    List<String> months = [
      LocaleKeys.months_jan.locale,
      LocaleKeys.months_feb.locale,
      LocaleKeys.months_mar.locale,
      LocaleKeys.months_apr.locale,
      LocaleKeys.months_may.locale,
      LocaleKeys.months_june.locale,
      LocaleKeys.months_july.locale,
      LocaleKeys.months_aug.locale,
      LocaleKeys.months_sept.locale,
      LocaleKeys.months_oct.locale,
      LocaleKeys.months_nov.locale,
      LocaleKeys.months_dec.locale
    ];
    String date =
        '${timeOfPrayer.day} ${months[timeOfPrayer.month - 1]} ${timeOfPrayer.year}';
    return date;
  }
}
