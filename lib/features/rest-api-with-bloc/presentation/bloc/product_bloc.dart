import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/data/repository/repository.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/bloc/product_event.dart';
import 'package:flutter_bloc_lab/features/rest-api-with-bloc/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc(this._repository) :super(ProductInitial()) {
    on<FetchProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(ProductLoading());
      final products = await _repository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}