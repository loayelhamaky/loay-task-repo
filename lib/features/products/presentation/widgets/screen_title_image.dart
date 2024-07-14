import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class ScreenTitleImage extends StatelessWidget {
  const ScreenTitleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 15,bottom: 20),
        child: Image.asset(
          AppAssets.appLogoSvg,
          width: 80,
        ),
    );
  }
}
