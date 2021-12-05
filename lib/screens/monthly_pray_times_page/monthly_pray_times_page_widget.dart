import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/components/prayer_times_per_month.dart';
import 'package:prayer_times_project/screens/monthly_pray_times_page/model/prayer_times_model.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/location_service.dart';

class MonthlyPrayTimesPageWidget extends StatefulWidget {
  MonthlyPrayTimesPageWidget({Key key}) : super(key: key);

  @override
  _MonthlyPrayTimesPageWidgetState createState() =>
      _MonthlyPrayTimesPageWidgetState();
}

class _MonthlyPrayTimesPageWidgetState
    extends State<MonthlyPrayTimesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final prayerTimes = PrayerTimes.today(
      Coordinates(LocationService.latitude, LocationService.longitude),
      CalculationMethod.muslim_world_league.getParameters());
  @override
  Widget build(BuildContext context) {
    List<PrayerTimesForMonth> monthlySchedule = buildMonthlyPrayerSchedule();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(14, 20, 14, 0),
          child: Material(
            color: Colors.transparent,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: FlutterFlowTheme.tertiaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: monthlySchedule.length,
                            itemBuilder: (BuildContext context, index) {
                              return Column(
                                children: [
                                  PrayerTimesPerMonth(
                                      prayerTimesPerMonthModel:
                                          monthlySchedule[index]),
                                  SizedBox(height: 10)
                                ],
                              );
                            }),
                      ),
                      SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<PrayerTimesForMonth> buildMonthlyPrayerSchedule() {
    List<PrayerTimesForMonth> prayerTimesForMonth = [];

    for (var i = 0; i < 30; i++) {
      PrayerTimesForMonth prayerTimesPerMonthModel = PrayerTimesForMonth();
      prayerTimesPerMonthModel.dateOfRelatedTime =
          DateTime.now().add(Duration(days: i));
      prayerTimesPerMonthModel.fajrTime =
          prayerTimes.fajr.add(Duration(days: i));
      prayerTimesPerMonthModel.sunriseTime =
          prayerTimes.sunrise.add(Duration(days: i));
      prayerTimesPerMonthModel.dhuhrTime =
          prayerTimes.dhuhr.add(Duration(days: i));
      prayerTimesPerMonthModel.asrTime = prayerTimes.asr.add(Duration(days: i));
      prayerTimesPerMonthModel.maghribTime =
          prayerTimes.maghrib.add(Duration(days: i));
      prayerTimesPerMonthModel.ishaTime =
          prayerTimes.isha.add(Duration(days: i));
      prayerTimesForMonth.add(prayerTimesPerMonthModel);
    }

    return prayerTimesForMonth;
  }
}
