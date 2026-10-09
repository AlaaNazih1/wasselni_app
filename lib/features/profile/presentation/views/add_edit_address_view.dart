import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wasselni/core/theme/app_colors.dart';
import 'package:wasselni/core/widgets/custom_text_form_field.dart';
import 'package:wasselni/features/profile/presentation/controllers/address_controller.dart';
import 'package:wasselni/features/profile/widgets/address_form_actions.dart';
import 'package:wasselni/features/profile/widgets/address_form_field_title.dart';
import 'package:wasselni/features/profile/widgets/address_type_dropdown.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class AddEditAddressView extends ConsumerStatefulWidget {
  const AddEditAddressView({super.key, this.address});

  final Map<String, dynamic>? address;

  bool get isEditing => address != null;

  @override
  ConsumerState<AddEditAddressView> createState() => _AddEditAddressViewState();
}

class _AddEditAddressViewState extends ConsumerState<AddEditAddressView> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _addressController;

  String _type = 'home';
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.address?['title']?.toString() ?? '',
    );

    _addressController = TextEditingController(
      text: widget.address?['address']?.toString() ?? '',
    );

    final savedType = widget.address?['type']?.toString() ?? 'home';

    _type = ['home', 'work', 'other'].contains(savedType) ? savedType : 'home';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_isSaving) return;

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final l10n = AppLocalizations.of(context);

    setState(() {
      _isSaving = true;
    });

    try {
      final controller = ref.read(addressControllerProvider);

      if (widget.isEditing) {
        await controller.updateAddress(
          addressId: widget.address!['id'],
          title: _titleController.text.trim(),
          address: _addressController.text.trim(),
          type: _type,
        );
      } else {
        await controller.addAddress(
          title: _titleController.text.trim(),
          address: _addressController.text.trim(),
          type: _type,
        );
      }

      ref.invalidate(addressesProvider);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isEditing
                ? l10n.addressUpdatedSuccessfully
                : l10n.addressAddedSuccessfully,
          ),
          backgroundColor: AppColors.success,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.black),
        title: Text(
          widget.isEditing ? l10n.editAddress : l10n.addAddress,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AddressFormFieldTitle(title: l10n.addressName),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _titleController,
                  hintText: l10n.addressNameHint,
                  prefixIcon: const Icon(Icons.label_outline),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.enterAddressName;
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 18),
                AddressFormFieldTitle(title: l10n.addressType),
                const SizedBox(height: 8),
                AddressTypeDropdown(
                  value: _type,
                  onChanged: (value) {
                    setState(() {
                      _type = value;
                    });
                  },
                ),
                const SizedBox(height: 18),
                AddressFormFieldTitle(title: l10n.detailedAddress),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _addressController,
                  hintText: l10n.detailedAddressHint,
                  prefixIcon: const Icon(Icons.home_outlined),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.enterDetailedAddress;
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 30),
                AddressFormActions(isSaving: _isSaving, onSave: _save),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
