import 'package:intl/intl.dart';

class Util {
  static String appId = "4a16212fbbbeab956ca7edc6d9985491";
  static String getFormattedDate(DateTime dateTime) {
    //1999
    return new DateFormat("EEE,MMM d,y").format(dateTime);
  }
}
