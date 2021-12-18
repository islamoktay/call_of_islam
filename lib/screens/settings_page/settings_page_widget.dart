import 'package:flutter/material.dart';
import 'package:prayer_times_project/services/flutter_flow_drop_down.dart';
import 'package:prayer_times_project/services/flutter_flow_icon_button.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';

class SettingsPageWidget extends StatefulWidget {
  SettingsPageWidget({Key key}) : super(key: key);

  @override
  _SettingsPageWidgetState createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  String dropDownValue;
  bool switchListTileValue1;
  bool switchListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings Page',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: SwitchListTile.adaptive(
              value: switchListTileValue1 ??= true,
              onChanged: (newValue) =>
                  setState(() => switchListTileValue1 = newValue),
              title: Text(
                'Push Notifications',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 20,
                ),
              ),
              activeColor: FlutterFlowTheme.secondaryColor,
              activeTrackColor: FlutterFlowTheme.secondaryColor,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            ),
          ),
          SwitchListTile.adaptive(
            value: switchListTileValue2 ??= true,
            onChanged: (newValue) =>
                setState(() => switchListTileValue2 = newValue),
            title: Text(
              'Location Services',
              style: FlutterFlowTheme.title3.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
                fontSize: 20,

              ),
            ),
            tileColor: Color(0x004EE034),
            activeColor: FlutterFlowTheme.secondaryColor,
            activeTrackColor: FlutterFlowTheme.secondaryColor,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Language',
                  style: FlutterFlowTheme.title3.override(
                fontFamily: 'Lexend Deca',
                    fontSize: 20,
                  ),
                ),
                FlutterFlowDropDown(
                  options: ['Turkce', 'English'].toList(),
                  onChanged: (val) => setState(() => dropDownValue = val),
                  width: 130,
                  height: 40,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: FlutterFlowTheme.tertiaryColor,
                    size: 15,
                  ),
                  fillColor: FlutterFlowTheme.secondaryColor,
                  elevation: 10,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 15,
                  margin: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                  hidesUnderline: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
