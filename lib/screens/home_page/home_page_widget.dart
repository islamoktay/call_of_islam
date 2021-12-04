import 'package:adhan/adhan.dart';
import 'package:prayer_times_project/components/namaz_vakitleri_text_widget.dart';
import 'package:prayer_times_project/components/sections_widget.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/location_service.dart';
import 'package:geocoding/geocoding.dart';
import '../compass_page/compass_page_widget.dart';
import '../monthly_pray_times_page/monthly_pray_times_page_widget.dart';
import '../settings_page/settings_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int durationFinal;
  @override
  void initState() {
    getAddressFromLatLong();
    super.initState();
  }

  Future<void> getAddressFromLatLong() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        LocationService.latitude, LocationService.longitude);
    print(placemarks[0]);
  }

  final prayerTimes = PrayerTimes.today(
      Coordinates(LocationService.latitude, LocationService.longitude),
      CalculationMethod.karachi.getParameters());
  Future buildLocationName() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          LocationService.latitude, LocationService.longitude);
      print(placemarks[1]);
    } catch (e) {
      print("Error occured: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF146261),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Material(
                color: Colors.transparent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              buildHeaderCardText(),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              buildStaticCountDown(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            ),
                            Text(
                              'buildLocationName()',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                        child: Image.asset(
                          'assets/images/pngegg.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
                color: Colors.transparent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0x01EEEEEE),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: AutoSizeText(
                            'Namaz Vakitleri',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NamazVakitleriTextWidget(
                          vakitIsmi: 'Fajr',
                          vakitSaati: buildTimeOfPrayer(prayerTimes.fajr),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NamazVakitleriTextWidget(
                          vakitIsmi: 'Sunrise',
                          vakitSaati: buildTimeOfPrayer(prayerTimes.sunrise),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NamazVakitleriTextWidget(
                          vakitIsmi: 'Dhuhr',
                          vakitSaati: buildTimeOfPrayer(prayerTimes.dhuhr),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NamazVakitleriTextWidget(
                          vakitIsmi: 'Asr',
                          vakitSaati: buildTimeOfPrayer(prayerTimes.asr),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NamazVakitleriTextWidget(
                          vakitIsmi: 'Maghrib',
                          vakitSaati: buildTimeOfPrayer(prayerTimes.maghrib),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: NamazVakitleriTextWidget(
                          vakitIsmi: 'Isha',
                          vakitSaati: buildTimeOfPrayer(prayerTimes.isha),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompassPageWidget(),
                          ),
                        );
                      },
                      child: SectionsWidget(
                        text: 'Qibla Finder',
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MonthlyPrayTimesPageWidget(),
                          ),
                        );
                      },
                      child: SectionsWidget(
                        text: 'Prayer Times',
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPageWidget(),
                          ),
                        );
                      },
                      child: SectionsWidget(
                        text: 'Settings',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildStaticCountDown() {
    DateTime nowTime = DateTime.now().toLocal();
    if (nowTime.isBefore(prayerTimes.fajr)) {
      List<int> itemsOfTime = buildDuration(nowTime, prayerTimes.fajr);
      return '${itemsOfTime[0] <= 0 ? '' : '${itemsOfTime[0]} Hour '}' +
          '${itemsOfTime[1] < 10 ? '0${itemsOfTime[1]} Min Left' : '${itemsOfTime[1]} Min Left'}';
    } else if (nowTime.isBefore(prayerTimes.sunrise)) {
      List<int> itemsOfTime = buildDuration(nowTime, prayerTimes.sunrise);
      return '${itemsOfTime[0] <= 0 ? '' : '${itemsOfTime[0]} Hour '}' +
          '${itemsOfTime[1] < 10 ? '0${itemsOfTime[1]} Min Left' : '${itemsOfTime[1]} Min Left'}';
    } else if (nowTime.isBefore(prayerTimes.dhuhr)) {
      List<int> itemsOfTime = buildDuration(nowTime, prayerTimes.dhuhr);
      return '${itemsOfTime[0] <= 0 ? '' : '${itemsOfTime[0]} Hour '}' +
          '${itemsOfTime[1] < 10 ? '0${itemsOfTime[1]} Min Left' : '${itemsOfTime[1]} Min Left'}';
    } else if (nowTime.isBefore(prayerTimes.asr)) {
      List<int> itemsOfTime = buildDuration(nowTime, prayerTimes.asr);
      return '${itemsOfTime[0] <= 0 ? '' : '${itemsOfTime[0]} Hour '}' +
          '${itemsOfTime[1] < 10 ? '0${itemsOfTime[1]} Min Left' : '${itemsOfTime[1]} Min Left'}';
    } else if (nowTime.isBefore(prayerTimes.maghrib)) {
      List<int> itemsOfTime = buildDuration(nowTime, prayerTimes.maghrib);
      return '${itemsOfTime[0] <= 0 ? '' : '${itemsOfTime[0]} Hour '}' +
          '${itemsOfTime[1] < 10 ? '0${itemsOfTime[1]} Min Left' : '${itemsOfTime[1]} Min Left'}';
    } else if (nowTime.isBefore(prayerTimes.isha)) {
      List<int> itemsOfTime = buildDuration(nowTime, prayerTimes.isha);
      return '${itemsOfTime[0] <= 0 ? '' : '${itemsOfTime[0]} Hour '}' +
          '${itemsOfTime[1] < 10 ? '0${itemsOfTime[1]} Min Left' : '${itemsOfTime[1]} Min Left'}';
    }
  }

  buildDuration(DateTime nowTime, DateTime prayTime) {
    List<int> results = [];
    int durationOfNow = buildDurationSecondsForDateTimes(nowTime);
    int durationOfEnd = buildDurationSecondsForDateTimes(prayTime);

    durationFinal = durationOfEnd - durationOfNow;
    int hourOfitem = (durationFinal ~/ (60 * 60));
    results.add(hourOfitem);
    int minuteOfitem = (durationFinal - (hourOfitem * 60 * 60)) ~/ 60;
    results.add(minuteOfitem);

    int secondOfitem =
        (durationFinal - (minuteOfitem * 60) - (hourOfitem * 60 * 60));
    results.add(secondOfitem);

    return results;
  }

  int buildDurationSecondsForDateTimes(DateTime dateTime) {
    int hourOfItem = dateTime.hour;
    int minuteOfitem = dateTime.minute;
    int secondsOfitem = dateTime.second;
    int durationOfitems =
        ((hourOfItem * 60 * 60) + (minuteOfitem * 60) + (secondsOfitem));
    return durationOfitems;
  }

  buildHeaderCardText() {
    DateTime nowTime = DateTime.now().toLocal();
    if (nowTime.isBefore(prayerTimes.fajr)) {
      return 'Fajr ' + buildTimeOfPrayer(prayerTimes.fajr);
    } else if (nowTime.isBefore(prayerTimes.sunrise)) {
      return 'Sunrise ' + buildTimeOfPrayer(prayerTimes.sunrise);
    } else if (nowTime.isBefore(prayerTimes.dhuhr)) {
      return 'Dhuhr ' + buildTimeOfPrayer(prayerTimes.dhuhr);
    } else if (nowTime.isBefore(prayerTimes.asr)) {
      return 'Asr ' + buildTimeOfPrayer(prayerTimes.asr);
    } else if (nowTime.isBefore(prayerTimes.maghrib)) {
      return 'Maghrib ' + buildTimeOfPrayer(prayerTimes.maghrib);
    } else if (nowTime.isBefore(prayerTimes.isha)) {
      return 'Isha ' + buildTimeOfPrayer(prayerTimes.isha);
    }
  }

  buildTimeOfPrayer(DateTime timeOfPrayer) {
    return '${timeOfPrayer.toLocal().hour < 10 ? "0${timeOfPrayer.toLocal().hour}" : "${timeOfPrayer.toLocal().hour}"} : ${timeOfPrayer.toLocal().minute < 10 ? "0${timeOfPrayer.toLocal().minute}" : "${timeOfPrayer.toLocal().minute}"}';
  }
}
