/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class VideoPlayCard extends StatelessWidget {
  const VideoPlayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 201.h,
      left: 139.w,
      child: Container(
        height: 99.r,
        width: 99.r,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ThemeHelper.primaryWhite2,
              blurRadius: 10.r,
              offset: const Offset(0, 5),
            ),
          ],
          color: ThemeHelper.primaryAuthButton,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Icon(
          Icons.play_arrow,
          color: ThemeHelper.primaryWhite,
          size: 50.sp,
        ),
      ),
    );
  }
}
