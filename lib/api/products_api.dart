import 'package:htppapp/api/get_api.dart';
import 'package:http/http.dart' as http;

class ProductAPI extends BaseAPI {
  String apiUrl = BaseAPI.baseUrl;

  Future getProducts() {
    return http.get(Uri.parse(apiUrl));
  }

  Future getProdcutbyId(int itemId) {
    return http.get(Uri.parse(apiUrl + itemId.toString()));
  }
}
