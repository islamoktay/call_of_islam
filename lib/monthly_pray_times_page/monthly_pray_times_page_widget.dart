import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthlyPrayTimesPageWidget extends StatefulWidget {
  MonthlyPrayTimesPageWidget({Key key}) : super(key: key);

  @override
  _MonthlyPrayTimesPageWidgetState createState() =>
      _MonthlyPrayTimesPageWidgetState();
}

class _MonthlyPrayTimesPageWidgetState
    extends State<MonthlyPrayTimesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tarih',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    'imsak',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    'sabah',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    'ogle',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    'ikindi',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    'aksam',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  Text(
                                    'yatsi',
                                    style: FlutterFlowTheme.title3,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
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
}
