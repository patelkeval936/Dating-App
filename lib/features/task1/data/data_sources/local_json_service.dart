import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart';
import '../../../../utils/typedefs.dart';

class LocalJsonFetchService {
  Future<JsonData> getLocalData(String src) async {
    late JsonData jsonResult;
    String jsonText = await rootBundle.loadString(src);
    jsonResult = jsonDecode(jsonText) as JsonData;
    return jsonResult;
  }
}
