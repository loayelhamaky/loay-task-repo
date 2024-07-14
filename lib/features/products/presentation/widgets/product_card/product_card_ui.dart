import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/product.dart';
import 'card_widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double originalPrice = product.price / (1 - product.discountPercentage / 100);

    return Card(
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImage(thumbnail: product.thumbnail),
            CardTitleDescription(text: product.title),
            CardTitleDescription(text: product.description),
            CardPrice(price: product.price, originalPrice: originalPrice),
            CardReviewStarAdd(rating: product.rating),
          ],
        ),
      ),
    );
  }
}
