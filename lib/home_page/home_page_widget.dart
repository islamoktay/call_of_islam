import '../components/namaz_vakitleri_text_widget.dart';
import '../components/sections_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.primaryColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asr 17:09',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '1 hour 42 Min left',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                          Text(
                            'New Yourk,USA',
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0x002FF2F1),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
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
                        vakitIsmi: 'Güneş',
                        vakitSaati: '05:00',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: NamazVakitleriTextWidget(
                        vakitIsmi: 'Sabah',
                        vakitSaati: '06:00',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: NamazVakitleriTextWidget(
                        vakitIsmi: 'Öğlen',
                        vakitSaati: '12:00',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: NamazVakitleriTextWidget(
                        vakitIsmi: 'İkindi',
                        vakitSaati: '16:00',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: NamazVakitleriTextWidget(
                        vakitIsmi: 'Akşam',
                        vakitSaati: '18:00',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: NamazVakitleriTextWidget(
                        vakitIsmi: 'Yatsı',
                        vakitSaati: '21:00',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0x002FF2F1),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
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
                    SectionsWidget(
                      text: 'Prayer Times',
                    ),
                    SectionsWidget(
                      text: 'Qibla Finder',
                    ),
                    SectionsWidget(
                      text: 'Pray',
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
}
