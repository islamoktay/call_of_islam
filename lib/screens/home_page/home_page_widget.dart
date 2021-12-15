import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:prayer_times_project/components/namaz_vakitleri_text_widget.dart';
import 'package:prayer_times_project/components/sections_widget.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/local_notification_services.dart';
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
  int hourOfRemain, minuteOfRemain;
  Timer timer;
  String nameOfCity, nameOfCountry;
  @override
  void initState() {
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => calculateCountdown());
    buildLocationName();
    super.initState();
  }

  final prayerTimes = PrayerTimes.today(
      Coordinates(LocationService.latitude, LocationService.longitude),
      CalculationMethod.muslim_world_league.getParameters());
  final double myDegree =
      Qibla(Coordinates(LocationService.latitude, LocationService.longitude))
          .direction;

  Future buildLocationName() async {
    try {
      setState(() {});
      List<Placemark> placemarks = await placemarkFromCoordinates(
          LocationService.latitude, LocationService.longitude);
      nameOfCountry = placemarks[0].country;
      nameOfCity = placemarks[0].administrativeArea;
    } catch (e) {
      print("Error occured: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
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
                            hourOfRemain != null && minuteOfRemain != null
                                ? Text(
                                    '$hourOfRemain Hour $minuteOfRemain Min Left',
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
                                  ),
                            Text(
                              buildLocationText(nameOfCity, nameOfCountry),
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
                            'Prayer Times',
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
                            builder: (context) => CompassPageWidget(
                              location:
                                  buildLocationText(nameOfCity, nameOfCountry),
                              degree: myDegree,
                            ),
                          ),
                        );
                      },
                      child: SectionsWidget(
                        image: 'assets/images/qibla-compass.png',
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
                        image: 'assets/images/crescent-moon.png',
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
                        image: 'assets/images/setting.png',
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

  Future<void> calculateCountdown() async {
    setState(() {});
    DateTime nowTime = DateTime.now().toLocal();
    switch (prayerTimes.nextPrayer()) {
      case Prayer.fajr:
        return buildCountdownText(nowTime, prayerTimes.fajr.toLocal());
        break;
      case Prayer.sunrise:
        return buildCountdownText(nowTime, prayerTimes.sunrise.toLocal());

        break;
      case Prayer.dhuhr:
        return buildCountdownText(nowTime, prayerTimes.dhuhr.toLocal());

        break;
      case Prayer.asr:
        return buildCountdownText(nowTime, prayerTimes.asr.toLocal());

        break;
      case Prayer.maghrib:
        return buildCountdownText(nowTime, prayerTimes.maghrib.toLocal());

        break;
      case Prayer.isha:
        return buildCountdownText(nowTime, prayerTimes.isha.toLocal());

        break;
      default:
        return buildCountdownText(
            nowTime, prayerTimes.fajr.add(Duration(days: 1)).toLocal());
    }
  }

  buildCountdownText(DateTime nowTime, DateTime relatedPrayerTime) {
    Duration differenceBetween = relatedPrayerTime.difference(nowTime);
    hourOfRemain = differenceBetween.inHours;
    minuteOfRemain = differenceBetween.inMinutes % 60;
  }

  buildHeaderCardText() {
    switch (prayerTimes.nextPrayer()) {
      case Prayer.fajr:
        return 'Fajr ' + buildTimeOfPrayer(prayerTimes.fajr);
        break;
      case Prayer.sunrise:
        return 'Sunrise ' + buildTimeOfPrayer(prayerTimes.sunrise);
        break;
      case Prayer.dhuhr:
        return 'Fajr ' + buildTimeOfPrayer(prayerTimes.dhuhr);
        break;
      case Prayer.asr:
        return 'Asr ' + buildTimeOfPrayer(prayerTimes.asr);
        break;
      case Prayer.maghrib:
        return 'Maghrib ' + buildTimeOfPrayer(prayerTimes.maghrib);
        break;
      case Prayer.isha:
        return 'Isha ' + buildTimeOfPrayer(prayerTimes.isha);
        break;
      default:
        return 'Fajr ' +
            buildTimeOfPrayer(prayerTimes.fajr.add(Duration(days: 1)));
    }
  }

  buildTimeOfPrayer(DateTime timeOfPrayer) {
    return '${timeOfPrayer.toLocal().hour < 10 ? "0${timeOfPrayer.toLocal().hour}" : "${timeOfPrayer.toLocal().hour}"} : ${timeOfPrayer.toLocal().minute < 10 ? "0${timeOfPrayer.toLocal().minute}" : "${timeOfPrayer.toLocal().minute}"}';
  }

  String buildLocationText(String nameOfCity, String nameOfCountry) {
    if (nameOfCountry == null && nameOfCity == null) {
      return '';
    } else if (nameOfCity == null) {
      return '$nameOfCountry';
    } else if (nameOfCountry == null) {
      return '$nameOfCity';
    } else {
      return '$nameOfCity, $nameOfCountry';
    }
  }

  void buildLocalNotificationFunc(DateTime time) {
    LocalNotificationService.showScheduledNotification(
      title: "Time For Pray",
    );
  }
}
