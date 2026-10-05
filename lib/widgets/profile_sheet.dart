import 'package:segari_app/data/dummy_data.dart';
import 'package:segari_app/screen/login_screen.dart';
import 'package:segari_app/state/auth_controller.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:segari_app/widgets/sheet_drag_handle.dart';
import 'package:flutter/material.dart';

void showProfileSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      return _ProfileSheetContent(homeContext: context);
    },
  );
}

class _ProfileSheetContent extends StatelessWidget {
  const _ProfileSheetContent({required this.homeContext});

  final BuildContext homeContext;

  Future<void> _logout(BuildContext sheetContext) async {
    Navigator.of(sheetContext).pop();

    await AuthController.instance.logout();

    if (homeContext.mounted) {
      Navigator.of(homeContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // =========================
          // DRAG HANDLE
          // =========================
          const SheetDragHandle(),

          const SizedBox(height: 24),

          // =========================
          // PROFILE HEADER
          // =========================
          Row(
            children: [
              // AVATAR
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.primary, AppTheme.primary],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),

              const SizedBox(width: 16),

              // NAME + EMAIL
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DummyUser.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      DummyUser.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // =========================
          // DIVIDER
          // =========================
          Divider(height: 1, color: Colors.grey.shade200),

          const SizedBox(height: 20),

          // =========================
          // LOGOUT
          // =========================
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.secondary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout_rounded, size: 19),
                  SizedBox(width: 9),
                  Text(
                    'Keluar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
