import 'package:flutter/material.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';

class CompassPageWidget extends StatefulWidget {
  CompassPageWidget({Key key}) : super(key: key);

  @override
  _CompassPageWidgetState createState() => _CompassPageWidgetState();
}

class _CompassPageWidgetState extends State<CompassPageWidget> {
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Konum : ',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                          Text(
                            'Istanbul',
                            style: FlutterFlowTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Tarih : ',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '24.10.2021',
                          style: FlutterFlowTheme.bodyText1,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Saat : ',
                          style: FlutterFlowTheme.bodyText1,
                        ),
                        Text(
                          '14.00',
                          style: FlutterFlowTheme.bodyText1,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
