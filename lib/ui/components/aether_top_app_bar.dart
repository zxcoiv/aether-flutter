import 'package:flutter/material.dart';
import 'package:aether_app/ui/components/app_logo.dart';

class AetherTopBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool showBack;
  final VoidCallback? onBackClick;
  final String? title;

  const AetherTopBar({
    super.key,
    this.actions,
    this.showBack = false,
    this.onBackClick,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackClick,
            )
          : null,
      title: title != null ? Text(title!) : const AppLogo(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
