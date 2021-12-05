import 'package:flutter/material.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';

class SectionsWidget extends StatefulWidget {
  SectionsWidget({Key key, this.text, this.image}) : super(key: key);

  final String text;
  final String image;

  @override
  _SectionsWidgetState createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<SectionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: 95,
            height: 80,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          widget.text,
          style: FlutterFlowTheme.bodyText1,
        )
      ],
    );
  }
}
