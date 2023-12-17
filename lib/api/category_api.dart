import 'package:htppapp/api/get_api.dart';
import 'package:http/http.dart' as http;

class CategoryAPI extends BaseAPI {
  String apiUrl = BaseAPI.baseUrl;

  Future getCategories() {
    return http.get(Uri.parse("${apiUrl}categories"));
  }

  Future getProductsbyCategory(String category) {
    return http.get(Uri.parse("${apiUrl}category/$category"));
  }
}
