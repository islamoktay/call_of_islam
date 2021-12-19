import 'package:flutter/material.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';

class TimeChipForPrayer extends StatelessWidget {
  final String stringPrayTime;
  final DateTime datePrayeTime;
  const TimeChipForPrayer({Key key, this.datePrayeTime, this.stringPrayTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.035,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.moreDarkerPrimaryBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        '$stringPrayTime  ' + buildTimeOfPrayer(datePrayeTime),
        style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Poppins',
          color: FlutterFlowTheme.tertiaryColor,
        ),
      ),
    );
  }

  String buildTimeOfPrayer(DateTime timeOfPrayer) {
    return '${timeOfPrayer.toLocal().hour < 10 ? "0${timeOfPrayer.toLocal().hour}" : "${timeOfPrayer.toLocal().hour}"} : ${timeOfPrayer.toLocal().minute < 10 ? "0${timeOfPrayer.toLocal().minute}" : "${timeOfPrayer.toLocal().minute}"}';
  }
}
