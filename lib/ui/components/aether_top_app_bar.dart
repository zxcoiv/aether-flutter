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
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00D4FF)),
              onPressed: onBackClick,
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: Color(0xFFE8F0FE),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            )
          : const AppLogo(),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: const Color(0xFF1E2D45)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
