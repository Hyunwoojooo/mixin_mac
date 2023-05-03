import 'package:flutter/material.dart';

import '../const/colors.dart';

class CategoryLayout extends StatelessWidget {
  final double? mainSizedBoxWidth;
  final Color borderSideColor;
  final Color? backgroundColor;
  final Color? containerColor;
  final VoidCallback? onPressed;
  final String? imageAsset;
  final double? imageWidth;
  final double? imageHeight;
  final double? sizedBoxWidth;
  final String? text;

  const CategoryLayout(
      {this.mainSizedBoxWidth,
      this.text,
      required this.borderSideColor,
      required this.onPressed,
      this.sizedBoxWidth,
      this.imageHeight,
      this.imageWidth,
      this.imageAsset,
      this.containerColor,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: mainSizedBoxWidth,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: borderSideColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.zero,
            elevation: 0.0,
            backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Container(
          color: containerColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '$imageAsset',
                width: imageWidth,
                height: imageHeight,
              ),
              SizedBox(
                width: sizedBoxWidth,
              ),
              Text(
                '$text',
                style: const TextStyle(
                    fontFamily: 'SUIT',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: MIXIN_BLACK_1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
