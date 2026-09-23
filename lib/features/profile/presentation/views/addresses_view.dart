import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wasselni/features/profile/widgets/add_address_button.dart';
import 'package:wasselni/features/profile/widgets/address_card.dart';
import 'package:wasselni/features/profile/widgets/addresses_header.dart';

import '../../../../core/theme/app_colors.dart';
import '../controllers/address_controller.dart';
import 'add_edit_address_view.dart';

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
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('حذف العنوان', textAlign: TextAlign.right),
          content: const Text(
            'هل أنت متأكد من حذف هذا العنوان؟',
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text(
                'حذف',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true) {
      return;
    }

    try {
      await ref
          .read(addressControllerProvider)
          .deleteAddress(addressId: addressId);

      ref.invalidate(addressesProvider);

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حذف العنوان'),
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
                  const Text(
                    'العناوين المحفوظة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
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

                    error: (error, stackTrace) => const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'حدث خطأ في تحميل العناوين',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.error),
                      ),
                    ),

                    data: (addresses) {
                      if (addresses.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            'لا توجد عناوين محفوظة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: addresses.map((address) {
                          final type = address['type'] ?? 'home';

                          return AddressCard(
                            icon: _getAddressIcon(type),
                            title: address['title'] ?? '',
                            address: address['address'] ?? '',
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
                              _deleteAddress(context, ref, address['id']);
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
