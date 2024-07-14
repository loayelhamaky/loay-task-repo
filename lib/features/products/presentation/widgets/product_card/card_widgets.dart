import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/utils/app_colors.dart';

///Image Stack
class CardImage extends StatelessWidget {
  final String thumbnail;

  const CardImage({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        thumbnail.isNotEmpty
            ? Image.network(
                thumbnail,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              )
            : const Icon(Icons.error),
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Icon(
              IconlyLight.heart,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

///Same Design
class CardTitleDescription extends StatelessWidget {
  final String text;
  const CardTitleDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

///Price Row
class CardPrice extends StatelessWidget {
  final double price;
  final double originalPrice;

  const CardPrice({Key? key, required this.price, required this.originalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Text(
            '$price EGP',
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(width: 6),
        Flexible(
          flex: 1,
          child: Text(
            '${originalPrice.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.lightBlue,
                  color: AppColors.lightBlue,
                  fontSize: 14,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

///Last Line
class CardReviewStarAdd extends StatelessWidget {
  final double rating;

  const CardReviewStarAdd({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Text(
            'Review: ($rating)  ',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
          ),
          Icon(
            IconlyBold.star,
            color: Colors.amber,
            size: 20,
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 2),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
