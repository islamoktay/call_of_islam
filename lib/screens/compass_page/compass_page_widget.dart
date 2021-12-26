import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:prayer_times_project/services/extensions/string_extension.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/locale_keys.g.dart';

class CompassPageWidget extends StatefulWidget {
  final String location;
  final double degree;
  CompassPageWidget({Key key, this.location, this.degree}) : super(key: key);

  @override
  _CompassPageWidgetState createState() => _CompassPageWidgetState();
}

class _CompassPageWidgetState extends State<CompassPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(widget.location);
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
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
                          Icons.arrow_back,
                          color: FlutterFlowTheme.tertiaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    widget.location == null || widget.location == ''
                        ? SizedBox(height: 0, width: 0)
                        : Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "${LocaleKeys.general_location.locale}" +
                                      ' : ',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                Text(
                                  widget.location,
                                  style: FlutterFlowTheme.bodyText1,
                                )
                              ],
                            ),
                          ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          ' ${LocaleKeys.general_date.locale} : ',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          buildTimeOfPrayer(),
                          style: FlutterFlowTheme.bodyText1,
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    StreamBuilder<CompassEvent>(
                      stream: FlutterCompass.events,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                              'Error reading heading: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        double direction = snapshot.data.heading;

                        // if direction is null, then device does not support this sensor
                        // show error message
                        if (direction == null)
                          return Center(
                            child: Text("Device does not have sensors !"),
                          );

                        return Material(
                          color: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Transform.rotate(
                              angle: (direction * (Math.pi / 180) * -1),
                              child: Stack(children: [
                                Image.asset(
                                  'assets/images/compass.png',
                                  color: Colors.transparent,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.width * 0.8,
                                  fit: BoxFit.fill,
                                ),
                                Transform.rotate(
                                  angle: widget.degree * (Math.pi / 180),
                                  child: Image.asset(
                                    'assets/images/compass.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height:
                                        MediaQuery.of(context).size.width * 0.8,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ]),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String buildTimeOfPrayer() {
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
        '${DateTime.now().toLocal().day} ${months[DateTime.now().toLocal().month - 1]} ${DateTime.now().toLocal().year}';
    return date;
  }
}
