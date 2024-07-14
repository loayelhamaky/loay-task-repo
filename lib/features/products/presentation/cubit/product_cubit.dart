import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:loayelhamaky_route_task/features/products/presentation/cubit/product_state.dart';
import '../../data/models/product.dart';
import '../../data/repos/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;
  List<Product> _allProducts = [];

  ProductCubit(this.repository) : super(ProductInitial());

  void getProducts() async {
    emit(ProductLoading());
    print('Fetching products...');
    final Either<String, List<Product>> productsOrFailure = await repository.getProducts();
    productsOrFailure.fold(
          (error) {
        print('Error fetching products: $error');
        emit(ProductError(error));
      },
          (products) {
        print('Products fetched successfully');
        _allProducts = products; // Store all products
        emit(ProductLoaded(products));
      },
    );
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(ProductLoaded(_allProducts));
    } else {
      final filteredProducts = _allProducts.where((product) {
        final titleLower = product.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();
      emit(ProductLoaded(filteredProducts));
    }
  }
}
