import 'package:covid19tracker/models/detail_country.dart';
import 'package:covid19tracker/services/api_services.dart';
import 'package:flutter/material.dart';

class ProvinceProvider with ChangeNotifier {
  var api = ApiServices();
  DetailCountry province;

  Future<DetailCountry> getProvinceProvider(String id) async {
    final response = await api.client.get("${api.baseUrl}/api/countries/$id");
    if (response.statusCode == 200) {
      notifyListeners();
      var res = detailCountryFromJson(response.body);
      province = res;
      return province;
    } else {
      return null;
    }
  }
}
