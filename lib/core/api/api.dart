import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/service_locator.dart';
import '../../features/products/presentation/cubit/product_cubit.dart';
import '../utils/error/error_model.dart';
import '../utils/error/error_strings.dart';
import 'end_points.dart';

class ApiService {
  final Dio dio = sl<Dio>();

  ApiService() {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<Response> get(String path, BuildContext context) async {
    try {
      return await dio.get(path);
    } catch (e) {
      showErrorDialog(context, e.toString());
      throw Exception(ErrorStrings.failMessage);
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ErrorDialog(
          errorModel: ErrorModel(
            message: message,
            onOkTap: () {
              Navigator.of(context).pop();
            },
            onRefreshTap: () {
              Navigator.of(context).pop();
              // Using a correct context to access the ProductCubit
              BlocProvider.of<ProductCubit>(context, listen: false).getProducts();
            },
          ),
        );
      },
    );
  }
}
