/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:rick_and_morty/generated/l10n.dart';

class FilterDialog extends StatelessWidget {
  final bool? showAliveOnly;

  const FilterDialog({Key? key, required this.showAliveOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).filter_by_status),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(S.of(context).show_everyone),
            leading: Radio(
              value: null,
              groupValue: showAliveOnly,
              onChanged: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
          ListTile(
            title: Text(S.of(context).show_only_living_people),
            leading: Radio(
              value: true,
              groupValue: showAliveOnly,
              onChanged: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
          ListTile(
            title: Text(S.of(context).show_only_dead_ones),
            leading: Radio(
              value: false,
              groupValue: showAliveOnly,
              onChanged: (value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r),
      ),
    );
  }
}
