import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasselni/features/profile/presentation/controllers/profile_controller.dart';
import 'package:wasselni/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';

class HomeGreeting extends ConsumerWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final l10n = AppLocalizations.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.welcome,
              style: const TextStyle(fontSize: 15, color: AppColors.grey),
            ),

            profileAsync.when(
              loading: () => const Text(
                '...',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),

              error: (_, __) => const Text(
                '',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),

              data: (userData) {
                final name = userData?['name'] ?? '';

                return Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30,
                    color: AppColors.black,
                    fontWeight: FontWeight.w900,
                  ),
                );
              },
            ),

            const SizedBox(height: 4),

            Align(
              alignment: Alignment.topCenter,
              child: Text(
                l10n.orderWhatYouNeed,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
