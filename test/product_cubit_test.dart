import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:loayelhamaky_route_task/features/products/presentation/cubit/product_cubit.dart';
import 'package:loayelhamaky_route_task/features/products/data/repos/product_repo.dart';
import 'package:loayelhamaky_route_task/features/products/presentation/cubit/product_state.dart';
import 'package:dartz/dartz.dart';
import 'package:loayelhamaky_route_task/features/products/data/models/product.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductCubit cubit;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    cubit = ProductCubit(mockProductRepository);
  });

  tearDown(() {
    cubit.close();
  });

  final List<Product> productList = [
    Product(
      id: 1,
      title: 'Product 1',
      price: 10.0,
      rating: 4.5,
      thumbnail: 'url1',
      discountPercentage: 10.0, description: 'description',
    ),
    Product(
      id: 2,
      title: 'Product 2',
      price: 20.0,
      rating: 4.0,
      thumbnail: 'url2',
      discountPercentage: 20.0, description: 'hh',
    ),
  ];

  group('getProducts', () {
    blocTest<ProductCubit, ProductState>(
      'emits [ProductLoading, ProductLoaded] when getProducts is called successfully',
      build: () {
        when(mockProductRepository.getProducts()).thenAnswer((_) async => Right(productList));
        return cubit;
      },
      act: (cubit) => cubit.getProducts(),
      expect: () => [
        ProductLoading(),
        ProductLoaded(productList),
      ],
      verify: (_) {
        verify(mockProductRepository.getProducts()).called(1);
      },
    );

    blocTest<ProductCubit, ProductState>(
      'emits [ProductLoading, ProductError] when getProducts fails',
      build: () {
        when(mockProductRepository.getProducts()).thenAnswer((_) async => Left('Error'));
        return cubit;
      },
      act: (cubit) => cubit.getProducts(),
      expect: () => [
        ProductLoading(),
        ProductError('Error'),
      ],
      verify: (_) {
        verify(mockProductRepository.getProducts()).called(1);
      },
    );
  });

  group('searchProducts', () {
    blocTest<ProductCubit, ProductState>(
      'emits [ProductLoaded] with filtered products when searchProducts is called',
      build: () {
        cubit.emit(ProductLoaded(productList));
        return cubit;
      },
      act: (cubit) => cubit.searchProducts('Product 1'),
      expect: () => [
        ProductLoaded([productList[0]]),
      ],
    );

    blocTest<ProductCubit, ProductState>(
      'emits [ProductLoaded] with all products when search query is empty',
      build: () {
        cubit.emit(ProductLoaded(productList));
        return cubit;
      },
      act: (cubit) => cubit.searchProducts(''),
      expect: () => [
        ProductLoaded(productList),
      ],
    );
  });
}
