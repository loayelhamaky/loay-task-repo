// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:loayelhamaky_route_task/core/api/api_consumer.dart';
// import 'package:loayelhamaky_route_task/features/products/data/repos/product_repo.dart';
// import 'package:loayelhamaky_route_task/features/products/data/models/product.dart';
// import 'package:dartz/dartz.dart';
//
// class MockApiConsumer extends Mock implements ApiConsumer {}
//
// void main() {
//   late ProductRepository repository;
//   late MockApiConsumer mockApiConsumer;
//
//   setUp(() {
//     mockApiConsumer = MockApiConsumer();
//     repository = ProductRepository(mockApiConsumer);
//   });
//
//   group('getProducts', () {
//     final List<Product> productList = [
//       Product(
//         id: 1,
//         title: 'Product 1',
//         price: 10.0,
//         rating: 4.5,
//         thumbnail: 'url1',
//         discountPercentage: 10.0, description: 'desc',
//       ),
//       Product(
//         id: 2,
//         title: 'Product 2',
//         price: 20.0,
//         rating: 4.0,
//         thumbnail: 'url2',
//         discountPercentage: 20.0, description: 'des 2',
//       ),
//     ];
//
//     test('should return list of products when the call to the API is successful', () async {
//       // Arrange
//       when(mockApiConsumer.get(any)).thenAnswer((_) async => {'products': productList.map((p) => p.toJson()).toList()});
//
//       // Act
//       final result = await repository.getProducts();
//
//       // Assert
//       expect(result, equals(Right(productList)));
//       verify(mockApiConsumer.get(any));
//       verifyNoMoreInteractions(mockApiConsumer);
//     });
//
//     test('should return error message when the call to the API is unsuccessful', () async {
//       // Arrange
//       when(mockApiConsumer.get(any)).thenThrow(Exception('Error'));
//
//       // Act
//       final result = await repository.getProducts();
//
//       // Assert
//       expect(result, equals(Left('Error: Exception: Error')));
//       verify(mockApiConsumer.get(any));
//       verifyNoMoreInteractions(mockApiConsumer);
//     });
//
//     test('should return timeout message when the call to the API times out', () async {
//       // Arrange
//       when(mockApiConsumer.get(any)).thenAnswer((_) async => Future.delayed(Duration(seconds: 11), () => {}));
//
//       // Act
//       final result = await repository.getProducts();
//
//       // Assert
//       expect(result, equals(Left('Request timed out. Please try again.')));
//       verify(mockApiConsumer.get(any));
//       verifyNoMoreInteractions(mockApiConsumer);
//     });
//   });
// }
