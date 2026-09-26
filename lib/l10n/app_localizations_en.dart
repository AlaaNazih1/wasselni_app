// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get myOrders => 'My Orders';

  @override
  String get newOrder => 'New Order';

  @override
  String get profile => 'Profile';

  @override
  String get chooseLanguage => 'Choose Language';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get notifications => 'Notifications';

  @override
  String get trackOrder => 'Track Order';

  @override
  String get logout => 'Logout';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get profileLoadError => 'An error occurred while loading data';

  @override
  String get noUserData => 'No user data available';

  @override
  String get noOrdersYet => 'No orders yet';

  @override
  String get delivered => 'Delivered';

  @override
  String get onTheWay => 'On the way';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get orderReceived => 'Order received';

  @override
  String get currency => 'EGP';

  @override
  String get menu => 'Menu';

  @override
  String get welcome => 'Welcome';

  @override
  String get orderWhatYouNeed => 'Order what you need easily';

  @override
  String get orders => 'Orders';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get pharmacies => 'Pharmacies';

  @override
  String get stores => 'Stores';

  @override
  String get alwaysAhead => 'With Wasselni, always';

  @override
  String get oneStepAhead => 'One step ahead';

  @override
  String get latestOrders => 'Latest Orders';

  @override
  String get viewAll => 'View All';

  @override
  String get orderCreatedSuccessfully => 'Order created successfully';

  @override
  String get pickupAddress => 'From (Pickup Address)';

  @override
  String get pickupExample => 'Example: Dairut';

  @override
  String get deliveryAddress => 'To (Delivery Address)';

  @override
  String get deliveryExample => 'Example: Assiut';

  @override
  String get continueButton => 'Continue';

  @override
  String get createNewOrder => 'Create New Order';

  @override
  String get pickupAndDelivery => 'Pickup & Delivery';

  @override
  String get deliveryOnly => 'Delivery Only';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get enterOrderDetails => 'Please enter order details';

  @override
  String get orderDetailsHint => 'Write order details...';

  @override
  String get priceDetails => 'Price Details';

  @override
  String get loginRequired => 'You must log in first';

  @override
  String get orderConfirmedSuccessfully => 'Order confirmed successfully';

  @override
  String orderCreationError(String error) {
    return 'An error occurred while creating the order: $error';
  }

  @override
  String get pickupLocation => 'Pickup Location';

  @override
  String get deliveryLocation => 'Delivery Location';

  @override
  String get deliveryPrice => 'Delivery Price';

  @override
  String get additionalFees => 'Additional Fees';

  @override
  String get ifAny => '(if any)';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get creatingOrder => 'Creating order...';

  @override
  String get confirmOrder => 'Confirm Order';

  @override
  String get pleaseEnter => 'Please enter';
}
