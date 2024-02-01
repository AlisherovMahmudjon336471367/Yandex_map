import 'package:dio/dio.dart';

import '../models/address_details_models.dart';
import '../models/app_lat_long.dart';

class AddressDetailsRepository {
  @override
  Future<AddressDetailsModel?> getAddressDetail(AppLatLong latLong) async {
    String mapApiKey = "89b8facb-d5f6-43cb-9ab4-64dee735601d";
    try {
      Map<String, String> queryParams = {
        'apikey': mapApiKey,
        'geocode': "${latLong.long}, ${latLong.lat}",
        'lang': 'uz',
        'format': 'json',
        'results': '1',
      };
      Dio yandexDio = Dio();
      var response = await yandexDio.get(
        "https://geocode-maps.yandex.ru/1.x/",
        queryParameters: queryParams,
      );
      return AddressDetailsModel.fromJson(response.data);
    } catch (e) {
      print("Error $e");
    }
  }
}
