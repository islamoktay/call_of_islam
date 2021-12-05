import 'package:flutter/material.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/model/prayer_times_model.dart';

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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(widget.prayerTimesPerMonthModel.dateOfRelatedTime.day
                .toString() +
            widget.prayerTimesPerMonthModel.dateOfRelatedTime.month.toString()),
      ),
    );
  }
}
