import 'package:flutter/material.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  final Widget child;

  const CustomShimmerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeHelper.primaryWhite2,
      highlightColor: ThemeHelper.primaryGrey3,
      child: child,
    );
  }
}
