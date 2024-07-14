// import 'dart:async';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import '../../../../core/api/api_consumer.dart';
// import '../../../../core/api/end_points.dart';
// import '../models/product.dart';
//
// class ProductRepository {
//   final ApiConsumer apiConsumer;
//
//   ProductRepository(this.apiConsumer);
//
//   Future<Either<String, List<Product>>> getProducts() async {
//     try {
//       print('Sending request to API...');
//       final response = await apiConsumer.get(Endpoints.products).timeout(Duration(seconds: 10));
//       print('Response received from API');
//       final List<Product> products = (response['products'] as List).map((e) => Product.fromJson(e)).toList();
//       print('Products parsed successfully');
//       return Right(products);
//     } on TimeoutException catch (_) {
//       return Left('Request timed out. Please try again.');
//     } catch (error) {
//       print('Error parsing products: $error');
//       return Left(error.toString());
//     }
//   }
//
//   Future<Either<String, List<Product>>> searchProducts(String query) async {
//     try {
//       print('Sending search request to API...');
//       final response = await apiConsumer.get('${Endpoints.products}?search=$query').timeout(Duration(seconds: 10));
//       print('Response received from API');
//       final List<Product> products = (response['products'] as List).map((e) => Product.fromJson(e)).toList();
//       print('Products parsed successfully');
//       return Right(products);
//     } on TimeoutException catch (_) {
//       return Left('Request timed out. Please try again.');
//     } catch (error) {
//       print('Error parsing products: $error');
//       return Left(error.toString());
//     }
//   }
// }
import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/product.dart';

class ProductRepository {
  final ApiConsumer apiConsumer;

  ProductRepository(this.apiConsumer);

  Future<Either<String, List<Product>>> getProducts() async {
    try {
      print('Sending request to API...');
      final response = await apiConsumer.get(Endpoints.products).timeout(Duration(seconds: 10));
      print('Response received from API');
      final List<Product> products = (response['products'] as List).map((e) => Product.fromJson(e)).toList();
      print('Products parsed successfully');
      return Right(products);
    } on TimeoutException catch (_) {
      return Left('Request timed out. Please try again.');
    } catch (error) {
      print('Error parsing products: $error');
      return Left(error.toString());
    }
  }
}
