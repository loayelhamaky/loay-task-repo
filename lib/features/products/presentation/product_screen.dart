import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loayelhamaky_route_task/features/products/presentation/widgets/screen_title_image.dart';
import 'package:loayelhamaky_route_task/features/products/presentation/widgets/search_and_cart_bar.dart';
import '../../../core/utils/error/error_notifier.dart';
import 'cubit/product_cubit.dart';
import 'widgets/product_card/product_card_ui.dart';
import 'cubit/product_state.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              ScreenTitleImage(),
              MySearchBar(),
              Expanded(
                child: BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      return ErrorNotifier(
                        errorMessage: null,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return ProductCard(product: product);
                          },
                        ),
                      );
                    } else if (state is ProductError) {
                      return ErrorNotifier(
                        errorMessage: state.message,
                        onRefresh: () {
                          context.read<ProductCubit>().getProducts();
                        },
                        child: Center(child: Text('Failed to load products')),
                      );
                    } else {
                      return Center(child: Text('Unexpected state'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
