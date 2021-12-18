import 'package:adhan/adhan.dart';
import 'package:prayer_times_project/services/location_service.dart';

class PrayerTimesConstants {
  static final prayerTimes = PrayerTimes.today(
      Coordinates(LocationService.latitude, LocationService.longitude),
      CalculationMethod.muslim_world_league.getParameters());
  static final double myDegree =
      Qibla(Coordinates(LocationService.latitude, LocationService.longitude))
          .direction;

}