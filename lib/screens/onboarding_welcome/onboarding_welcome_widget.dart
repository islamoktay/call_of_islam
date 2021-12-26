import 'package:geolocator/geolocator.dart';
import 'package:prayer_times_project/services/extensions/string_extension.dart';
import 'package:prayer_times_project/services/flutter_flow_animations.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/flutter_flow_widgets.dart';
import 'package:prayer_times_project/services/local_notification_service.dart';
import 'package:prayer_times_project/services/locale_keys.g.dart';
import 'package:prayer_times_project/services/location_service.dart';

import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';

class OnboardingWelcomeWidget extends StatefulWidget {
  OnboardingWelcomeWidget({Key key}) : super(key: key);

  @override
  _OnboardingWelcomeWidgetState createState() =>
      _OnboardingWelcomeWidgetState();
}

class _OnboardingWelcomeWidgetState extends State<OnboardingWelcomeWidget>
    with TickerProviderStateMixin {
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 1000,
      fadeIn: true,
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      scale: 0.4,
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      slideOffset: Offset(0, -70),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      slideOffset: Offset(0, -100),
    ),
  };

  @override
  void initState() {
    LocalNotificationService.init(initScheduled: true);
    listenNotification();
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  void listenNotification() {
    LocalNotificationService.onNotifications.stream
        .listen(onClickedNotification);
  }

  void onClickedNotification(String payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePageWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.secondaryColor,
              FlutterFlowTheme.primaryColor
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(1, -1),
            end: AlignmentDirectional(-1, 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/best-kaaba-png-clipart-11.png',
              width: 140,
              height: 140,
              fit: BoxFit.fitHeight,
            ).animated([animationsMap['imageOnPageLoadAnimation']]),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'بسم الله الرحمن الرحيم',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ).animated([animationsMap['textOnPageLoadAnimation1']]),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 120),
              child: Text(
                LocaleKeys.general_bismillah.locale,
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ).animated([animationsMap['textOnPageLoadAnimation2']]),
            ),
            FFButtonWidget(
              onPressed: () async {
                setState(() => _loadingButton = true);
                try {
                  await Geolocator.requestPermission();
                  await LocationService.getCurrentLocation();

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageWidget(),
                    ),
                  );
                } finally {
                  setState(() => _loadingButton = false);
                }
              },
              text: LocaleKeys.general_welcome.locale,
              options: FFButtonOptions(
                width: 160,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.subtitle2.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 12,
              ),
              loading: _loadingButton,
            )
          ],
        ).animated([animationsMap['columnOnPageLoadAnimation']]),
      ).animated([animationsMap['containerOnPageLoadAnimation']]),
    );
  }
}
