import 'dart:convert';

// import 'package:astrology_app/modals/horoscope.dart';
import 'package:astology_app/modal/Horoscope.dart';
import 'package:http/http.dart' as http;

class HoroscopeApiHelper {
  HoroscopeApiHelper._();

  static final HoroscopeApiHelper horoscopeApiHelper = HoroscopeApiHelper._();

  //Todo: Fetch love Data
  Future<Horoscope?> todayLoveData(
      {required String sunShineName, required String day}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://horoscope-astrology.p.rapidapi.com/horoscope?day=$day&sunsign=$sunShineName"),
        headers: {
          "X-RapidAPI-Key":
              "b3858852dcmsh14446e0f6a5d54dp137ef6jsn32cd8e2a31aa",
          "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com",
        });
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      String data = decodedData['areas'][0]['desc'];
      // print(data);
      Horoscope horoscope = Horoscope(data: data);

      return horoscope;
    }
    return null;
  }

  //Todo: Fetch career Data
  Future<Horoscope?> todayCareerData(
      {required String sunShineName, required String day}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://horoscope-astrology.p.rapidapi.com/horoscope?day=$day&sunsign=$sunShineName"),
        headers: {
          "X-RapidAPI-Key":
              "b3858852dcmsh14446e0f6a5d54dp137ef6jsn32cd8e2a31aa",
          "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com",
        });
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      String data = decodedData['areas'][0]['desc'];
      // print(data);
      Horoscope horoscope = Horoscope(data: data);

      return horoscope;
    }
    return null;
  }

  //Todo: Fetch today's Data
  Future<Horoscope?> todayData(
      {required String sunShineName, required String day}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://horoscope-astrology.p.rapidapi.com/horoscope?day=$day&sunsign=$sunShineName"),
        headers: {
          "X-RapidAPI-Key":
              "b3858852dcmsh14446e0f6a5d54dp137ef6jsn32cd8e2a31aa",
          "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com",
        });
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      String data = decodedData['areas'][0]['desc'];
      // print(data);
      Horoscope horoscope = Horoscope(data: data);

      return horoscope;
    }
    return null;
  }

//Todo: Fetch Weekly data

//Todo: Fetch Monthly Data
}
