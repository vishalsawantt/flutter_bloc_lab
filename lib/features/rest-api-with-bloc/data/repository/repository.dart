import 'package:flutter_bloc_lab/core/rest/ApiConstants/api_constants.dart';
import 'package:flutter_bloc_lab/core/rest/NetworkApiService/network_api_services.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/data/model/ProductModel.dart';

class ProductRepository {
  final _networkapiservices = NetworkApiServices();

  Future<List<Productmodel>> fetchProducts() async {
    final response = await _networkapiservices.getApi(
      ApiConstants.fetchProducts,
    );

    if (response is List) {
      return response.map((e) => Productmodel.fromJson(e)).toList();
    } else {
      throw Exception('Unexpested response format');
    }
  }
}