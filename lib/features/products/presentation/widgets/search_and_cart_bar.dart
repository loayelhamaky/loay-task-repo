import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/product_cubit.dart';
import 'package:iconly/iconly.dart';

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: TextField(
              decoration: InputDecoration(
                helperMaxLines: 1,
                hintText: AppStrings.hintSearch,
                prefixIcon: Icon(
                  IconlyLight.search,
                  size: 30,
                  color: AppColors.primary,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: AppColors.searchBar,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
              ),
              onChanged: (query) {
                BlocProvider.of<ProductCubit>(context).searchProducts(query);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyLight.buy,
                  size: 30,
                  color: AppColors.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
