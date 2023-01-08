import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetInformationRepository {
  GetInformationRepository._();

  static int? status;

  static getInformation(String? country) async {
    try {
      country ?? 'Uzbekistan';
      final url =
          Uri.parse("http://universities.hipolabs.com/search?country=$country");
      final res = await http.get(url);
      var data;
      if (res.statusCode == 200) {
        data = convert.jsonDecode(res.body);
      } else {
        status = res.statusCode;
      }

    return data;
    } catch (s) {}
  }
}
