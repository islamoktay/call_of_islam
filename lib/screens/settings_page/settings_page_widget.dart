import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:prayer_times_project/services/extensions/string_extension.dart';
import 'package:prayer_times_project/services/flutter_flow_drop_down.dart';
import 'package:prayer_times_project/services/flutter_flow_icon_button.dart';
import 'package:prayer_times_project/services/flutter_flow_theme.dart';
import 'package:prayer_times_project/services/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPageWidget extends StatefulWidget {
  SettingsPageWidget({Key key}) : super(key: key);

  @override
  _SettingsPageWidgetState createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  Future<String> permissionStatusFuture;
  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";
  String dropDownValue;
  bool switchListTileNotification;
  bool switchListTileLocation;
  LocationPermission permission;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    checkLocationPermission();
    permissionStatusFuture = getCheckNotificationPermStatus();
    super.initState();
  }

  Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.denied:
          switchListTileNotification = false;
          return permDenied;
        case PermissionStatus.granted:
          switchListTileNotification = true;
          return permGranted;
        case PermissionStatus.provisional:
          return permProvisional;
        default:
          return '';
      }
    });
  }

  checkLocationPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() {
        switchListTileLocation = false;
      });
    } else {
      setState(() {
        switchListTileLocation = true;
      });
    }
  }

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
            color: FlutterFlowTheme.tertiaryColor,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${LocaleKeys.menus_settings.locale} ${LocaleKeys.general_page.locale}',
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
              value: switchListTileNotification ??= true,
              onChanged: (value) {
                setState(() {
                  NotificationPermissions.requestNotificationPermissions(
                          iosSettings: const NotificationSettingsIos(
                              sound: true, badge: true, alert: true))
                      .then((_) {
                    // when finished, check the permission status
                    setState(() {
                      permissionStatusFuture = getCheckNotificationPermStatus();
                      switchListTileNotification = value;
                    });
                  });
                });
              },
              title: Text(
                LocaleKeys.settings_menu_notifications.locale,
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
            value: switchListTileLocation ??= true,
            onChanged: (newValue) async {
              await Geolocator.openLocationSettings();
              setState(() => switchListTileLocation = newValue);
            },
            title: Text(
              LocaleKeys.settings_menu_location_services.locale,
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
                  LocaleKeys.settings_menu_language_settings.locale,
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Lexend Deca',
                    fontSize: 20,
                  ),
                ),
                FlutterFlowDropDown(
                  options: ['Türkçe', 'English'].toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      if (newValue == 'English') {
                        this.setState(() {
                          context.setLocale(Locale('en', 'US'));
                          dropDownValue = "English";
                        });
                      } else if (newValue == 'Türkçe') {
                        this.setState(() {
                          context.setLocale(Locale('tr', 'TR'));
                          dropDownValue = "Türkçe";
                        });
                      }
                    });
                  },
                  width: 100,
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
                  initialOption: dropDownValue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
