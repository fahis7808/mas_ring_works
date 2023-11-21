import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? action;
  final bool backPage;


  const CustomAppBar(
      {super.key,
        required this.title,
        this.leading,
        this.action,
        this.backPage = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text(
        title,
        style: AppFont.whiteLargeText,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // Change the icon color here
      ),
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: () => Navigator.pop(context),
        color: Colors.white,
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: action
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
