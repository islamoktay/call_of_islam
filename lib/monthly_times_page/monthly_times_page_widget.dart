import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthlyTimesPageWidget extends StatefulWidget {
  MonthlyTimesPageWidget({Key key}) : super(key: key);

  @override
  _MonthlyTimesPageWidgetState createState() => _MonthlyTimesPageWidgetState();
}

class _MonthlyTimesPageWidgetState extends State<MonthlyTimesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}
