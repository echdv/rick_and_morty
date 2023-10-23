/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class LocationCard extends StatelessWidget {
  final String title;
  final String origin;

  const LocationCard({
    super.key,
    required this.origin,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: ThemeHelper.primaryGrey3,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                origin,
                style: TextStyle(
                  color: ThemeHelper.primaryBlack,
                ),
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
          )
        ],
      ),
    );
  }
}
