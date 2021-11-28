import '../flutter_flow/flutter_flow_theme.dart';

import 'package:flutter/material.dart';


class SectionsWidget extends StatefulWidget {
  SectionsWidget({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

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
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Image.asset(
                'assets/images/df3hg_',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 12,
          decoration: BoxDecoration(
            color: Color(0x00EEEEEE),
          ),
        ),
        Text(
          widget.text,
          style: FlutterFlowTheme.bodyText1,
        )
      ],
    );
  }
}
