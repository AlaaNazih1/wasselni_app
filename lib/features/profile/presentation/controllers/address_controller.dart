import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/address_remote_data_source.dart';

final addressRemoteDataSourceProvider = Provider<AddressRemoteDataSource>((
  ref,
) {
  return AddressRemoteDataSource();
});

final addressesProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    return [];
  }

  final dataSource = ref.read(addressRemoteDataSourceProvider);

  return dataSource.getAddresses(user.uid);
});

final addressControllerProvider = Provider<AddressController>((ref) {
  return AddressController(
    dataSource: ref.read(addressRemoteDataSourceProvider),
  );
});

class AddressController {
  AddressController({required AddressRemoteDataSource dataSource})
    : _dataSource = dataSource;

  final AddressRemoteDataSource _dataSource;

  Future<void> addAddress({
    required String title,
    required String address,
    required String type,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('المستخدم غير مسجل الدخول');
    }

    await _dataSource.addAddress(
      uid: user.uid,
      title: title,
      address: address,
      type: type,
    );
  }

  Future<void> updateAddress({
    required String addressId,
    required String title,
    required String address,
    required String type,
  }) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('المستخدم غير مسجل الدخول');
    }

    await _dataSource.updateAddress(
      uid: user.uid,
      addressId: addressId,
      title: title,
      address: address,
      type: type,
    );
  }

  Future<void> deleteAddress({required String addressId}) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('المستخدم غير مسجل الدخول');
    }

    await _dataSource.deleteAddress(uid: user.uid, addressId: addressId);
  }
}
