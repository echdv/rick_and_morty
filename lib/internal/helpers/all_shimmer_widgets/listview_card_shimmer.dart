import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/custom_shimmer_widget.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class ListViewCardShimmer extends StatelessWidget {
  const ListViewCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  height: 74.r,
                  width: 74.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(600).r,
                    child: Container(color: ThemeHelper.primaryGrey3,),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10.h,
                      width: 100.w,
                      color: ThemeHelper.primaryGrey3,
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      height: 10.h,
                      width: 150.w,
                      color: ThemeHelper.primaryGrey3,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 10.h,
                      width: 50.w,
                      color: ThemeHelper.primaryGrey3,
                    )
   
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
      ),
    );
  }
}
