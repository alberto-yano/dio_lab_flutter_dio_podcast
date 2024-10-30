import 'package:dio/dio.dart';
import 'package:dio_lab_flutter_dio_podcast/src/util/xml_2_json_adapter.dart';

class Xml2JsonTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
    RequestOptions options,
    ResponseBody responseBody,
  ) async {
    var result = await super.transformResponse(options, responseBody);
    return Xml2JsonAdapter.adapter(result);
  }
}
