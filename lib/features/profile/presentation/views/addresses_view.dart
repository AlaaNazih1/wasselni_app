import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/features/profile/presentation/controllers/address_controller.dart';
import 'package:wasselni/features/profile/presentation/views/add_edit_address_view.dart';
import 'package:wasselni/features/profile/widgets/add_address_button.dart';
import 'package:wasselni/features/profile/widgets/address_card.dart';
import 'package:wasselni/features/profile/widgets/addresses_header.dart';
import 'package:wasselni/features/profile/widgets/delete_address_dialog.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class AddressesView extends ConsumerWidget {
  const AddressesView({super.key});

  IconData _getAddressIcon(String type) {
    switch (type) {
      case 'work':
        return Icons.work_outline;

      case 'other':
        return Icons.location_on_outlined;

      case 'home':
      default:
        return Icons.home_outlined;
    }
  }

  Future<void> _deleteAddress(
    BuildContext context,
    WidgetRef ref,
    String addressId,
  ) async {
    final shouldDelete = await DeleteAddressDialog.show(context);

    if (shouldDelete != true || !context.mounted) {
      return;
    }

    final l10n = AppLocalizations.of(context);

    try {
      await ref
          .read(addressControllerProvider)
          .deleteAddress(addressId: addressId);

      ref.invalidate(addressesProvider);

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.addressDeletedSuccessfully),
          backgroundColor: AppColors.success,
        ),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final addressesAsync = ref.watch(addressesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AddressesHeader(),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    l10n.savedAddresses,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  addressesAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    error: (error, stackTrace) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        l10n.addressesLoadError,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.error),
                      ),
                    ),
                    data: (addresses) {
                      if (addresses.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            l10n.noSavedAddresses,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: addresses.map((address) {
                          final type = (address['type'] ?? 'home').toString();

                          return AddressCard(
                            icon: _getAddressIcon(type),
                            title: (address['title'] ?? '').toString(),
                            address: (address['address'] ?? '').toString(),
                            onEdit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AddEditAddressView(address: address),
                                ),
                              );
                            },
                            onDelete: () {
                              _deleteAddress(
                                context,
                                ref,
                                address['id'].toString(),
                              );
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  AddAddressButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddEditAddressView(),
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
