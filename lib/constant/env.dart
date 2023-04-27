import 'package:online_learning_app/constant/base_env.dart';

class AppConstants {
  static String octetStreamEncoding = "application/octet-stream";
  String _baseUrl = "";

  String _apiKey = "";
  String _secretKey = "";
  String _clientID = "";
  String _clientSecret = "";
  String bluApiKey = "";

  String _mobileID = "";
  String _mobileSecret = "";

  String get baseUrl => _baseUrl;
  String get mobileID => _mobileID;
  String get mobileSecret => _mobileSecret;

  // API EMASKITA
  String get apiKey => _apiKey;
  String get secretKey => _secretKey;
  String get clientID => _clientID;
  String get clientSecret => _clientSecret;

  static const TIME_OUT_TEXT = {"result": false, "message": "Time out"};
  static const FIREBASE_ERROR = {"result": false, "message": "Firebase Error"};

  static const bool SUCCESS = true;
  static const bool FAILED = false;

  AppConstants() {
    switch (environmentMode) {
      case 'dev':
        {
          _baseUrl = "https://sb-apiemaskita.goldstep-indonesia.net/v3/";
          _mobileID = "cc99dba6df7f9f479b8586aa09ccaacf";
          _mobileSecret = "43b29f8457070586f781f4479baaacf";

          _apiKey = 'tCItSL82-IxlZcmT1-ZqCvmkYj-pbijKTqe';
          _secretKey = 'SkJqTGVO-ZqCed928-bS3XivKL-cT8R2L1k';
          _clientID = 'j6vezraw-JnL33tfE-O6DP8V1C-LWl1UnOO';
          _clientSecret = 'SlJqKWDQ-QHyXNVYb-KiHgqtU6-DFBtzPtV';
        }
        break;
      case 'test':
        {
          _baseUrl = "http://10.0.2.2:8000/api";
          _mobileID = "cc99dba6df7f9f479b8586aa09ccaacf";
          _mobileSecret = "43b29f8457070586f781f4479baaacf";

          _apiKey = 'skjfiewjfk34';
          _secretKey = 'hdgfhutyj5567653';
          _clientID = 'asdjaskdjaksjdks3';
          _clientSecret = 'dsjfjwiofeijw33';
        }
        break;
      case 'prod':
        {}
        break;
      default:
        {
          _baseUrl = "";
          // _mobileID = "";
          // _mobileSecret = "";
        }
        break;
    }
  }
}
