/* External dependencies */
import 'package:flutter/material.dart';

/* Local dependencies */
import 'package:rick_and_morty/internal/helpers/theme_helper.dart';

class TextFieldSearchCard extends StatelessWidget {
  final String hintText;
  final VoidCallback onFilterPressed;

  const TextFieldSearchCard({
    super.key,
    required this.hintText,
    required this.onFilterPressed,
    required Null Function(String value) onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: ThemeHelper.primaryBlack),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: onFilterPressed,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ThemeHelper.primaryGrey2,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: ThemeHelper.primaryContainer,
        ),
        filled: true,
        fillColor: ThemeHelper.primaryWhite2,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: ThemeHelper.primaryBlack,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: ThemeHelper.primaryBlack,
          ),
        ),
      ),
    );
  }
}
