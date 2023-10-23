/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/all_characters_card.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/filter_dialog.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/search_card.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/all_shimmer_widgets/character_shimmer_screen.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late CharacterBloc bloc;
  late bool isListView;
  late ScrollController scrollController;
  bool isLoading = false;
  List<CharacterResult> characterResultList = [];
  int counter = 1;
  int totalCount = 0;
  bool? showAliveOnly = false;

  @override
  void initState() {
    bloc = getIt<CharacterBloc>();
    bloc.add(GetCharacterEvent(
      isFirstCall: true,
      page: counter,
    ));

    isListView = true;

    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    if (characterResultList.isNotEmpty) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        isLoading = true;

        if (isLoading) {
          counter = counter + 1;

          bloc.add(GetCharacterEvent(
            isFirstCall: false,
            page: counter,
          ));
        }
      }
    }
  }

  @override
  void dispose() {
    bloc.close();
    scrollController.dispose();

    super.dispose();
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterDialog(showAliveOnly: showAliveOnly);
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          showAliveOnly = value as bool?;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 54.h),
            TextFieldSearchCard(
              hintText: S.of(context).findcharacter,
              onFilterPressed: () {
                _showFilterDialog(context);
              },
              onSearch: (String value) {},
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Text(
                  S.of(context).totalcharacters,
                  style: TextStyle(
                    color: ThemeHelper.primaryGrey3,
                  ),
                ),
                BlocBuilder<CharacterBloc, CharacterState>(
                  builder: (context, state) {
                    return BlocConsumer<CharacterBloc, CharacterState>(
                      bloc: bloc,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is CharacterLoadingState) {
                          return Container(
                            height: 20.h,
                            width: 40.w,
                            color: ThemeHelper.primaryGrey3,
                          );
                        }

                        if (state is CharacterLoadedState) {
                          return Text(
                            state.characterModel.info!.count.toString(),
                          );
                        }
                        return const Text('загружается');
                      },
                    );
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    isListView = !isListView;
                    setState(() {});
                  },
                  child: isListView
                      ? Image.asset(
                          'assets/images/listview.png',
                          height: 24.h,
                          width: 24.w,
                        )
                      : Image.asset(
                          'assets/images/gridview.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                )
              ],
            ),
            BlocConsumer<CharacterBloc, CharacterState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is CharacterLoadedState) {
                  totalCount = state.characterModel.info?.count ?? 0;

                  characterResultList
                      .addAll(state.characterModel.results ?? []);

                  isLoading = false;
                }
              },
              builder: (context, state) {
                if (state is CharacterLoadingState) {
                  return const CharacterShimmerScreen();
                }

                if (state is CharacterLoadedState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      characterResultList.clear();

                      bloc.add(GetCharacterEvent(
                        isFirstCall: true,
                        page: 1,
                      ));
                    },
                    child: AllCharactersCard(
                      isListView: isListView,
                      scrollController: scrollController,
                      totalCount: totalCount,
                      characterResultList: characterResultList,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
