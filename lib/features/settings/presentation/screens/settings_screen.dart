/* External dependencies */
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty/features/settings/presentation/logic/bloc/profile_bloc.dart';

/* Local dependencies */
import 'package:flutter/services.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ProfileBloc bloc;

  @override
  void initState() {
    bloc = getIt<ProfileBloc>();
    bloc.add(GetProfileEvent());
    super.initState();
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeHelper.primaryWhite,
        centerTitle: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_box,
              size: 50,
            ),
            color: ThemeHelper.primaryGrey3),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 21.h),
                  Center(
                    child: SizedBox(
                      height: 150.r,
                      width: 150.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.r),
                        child: image == null
                            ? Image.asset(
                                state.profileModel.image,
                                fit: BoxFit.cover,
                              )
                            : Image.file(image!, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        await pickImage();
                      },
                      child: Text(
                        S.of(context).change_photo,
                        style: TextStyle(
                          color: ThemeHelper.primaryAuthButton,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    S.of(context).profile,
                    style: TextStyle(
                      color: ThemeHelper.primaryGrey3,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).change_full_name,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '${state.profileModel.name} ${state.profileModel.surname} ${state.profileModel.patronymic ?? ''}',
                            style: TextStyle(
                              color: ThemeHelper.primaryGrey3,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).about_me,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            state.profileModel.selfInfo.toString(),
                            style: TextStyle(
                              color: ThemeHelper.primaryGrey3,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).login,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            state.profileModel.login,
                            style: TextStyle(
                              color: ThemeHelper.primaryGrey3,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.r,
                      ),
                    ],
                  )
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
