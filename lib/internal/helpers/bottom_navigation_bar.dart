import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_list_screen/character_list.dart';
import 'package:rick_and_morty/features/episodes/presentation/screens/all_episode_screen/all_episodes.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/settings_screen.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          CharacterList(),
          AllEpisodes(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/charactersA.png',
              scale: 4.r,
            ),
            icon: Image.asset(
              'assets/images/characters.png',
              scale: 4.r,
            ),
            label: S.of(context).characters,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/episodeA.png',
              scale: 4.sp,
            ),
            icon: Image.asset(
              'assets/images/episodes.png',
              scale: 4.sp,
            ),
            label: S.of(context).episodes_,
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/settingsA.png',
              scale: 4.sp,
            ),
            icon: Image.asset(
              'assets/images/settings.png',
              scale: 4.sp,
            ),
            label: S.of(context).nav_setting,
          ),
        ],
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
        ),
        unselectedFontSize: 12.sp,
        selectedFontSize: 12.sp,
        selectedItemColor: ThemeHelper.primaryAuthButton,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
