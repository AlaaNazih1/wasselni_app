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

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get enterPhoneNumber => 'Please enter your phone number';

  @override
  String get phoneNumberMustBe11Digits => 'Phone number must be 11 digits';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Please enter your password';

  @override
  String get passwordMustBe6Characters =>
      'Password must be at least 6 characters';

  @override
  String get login => 'Login';

  @override
  String get createNewAccount => 'Create New Account';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinWasselni => 'Join Wasselni';

  @override
  String get fullName => 'Full Name';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get pleaseEnterYourName => 'Please enter your name';

  @override
  String get nameMinLength => 'Name must be at least 3 characters';

  @override
  String get pleaseEnterPhone => 'Please enter your phone number';

  @override
  String get phoneMustBe11 => 'Phone number must be 11 digits';

  @override
  String get invalidPhone => 'Invalid phone number';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'example@email.com';

  @override
  String get pleaseEnterEmail => 'Please enter your email';

  @override
  String get invalidEmail => 'Invalid email address';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get pleaseConfirmPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get register => 'Create Account';

  @override
  String get alreadyHaveAccount => 'Already have an account? Login';

  @override
  String get accountCreatedSuccessfully => 'Account created successfully';

  @override
  String get hintPhoneNumber => '01XXXXXXXXX';

  @override
  String get orderData => 'Order Details';

  @override
  String get orderNotFound => 'Order not found';

  @override
  String get unknownStatus => 'Unknown';

  @override
  String get statusPending => 'Order Received';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get tripDetails => 'Trip Details';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get price => 'Price';

  @override
  String get totalOrder => 'Total Order';

  @override
  String get settings => 'Settings';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get myAddresses => 'My Addresses';

  @override
  String get help => 'Help';

  @override
  String get language => 'Language';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get addAddress => 'Add Address';

  @override
  String get addressName => 'Address Name';

  @override
  String get addressNameHint => 'e.g. Home';

  @override
  String get enterAddressName => 'Please enter the address name';

  @override
  String get addressType => 'Address Type';

  @override
  String get addressTypeHome => 'Home';

  @override
  String get addressTypeWork => 'Work';

  @override
  String get addressTypeOther => 'Other';

  @override
  String get detailedAddress => 'Full Address';

  @override
  String get detailedAddressHint => 'e.g. Dairut - Assiut';

  @override
  String get enterDetailedAddress => 'Please enter the address';

  @override
  String get savingAddress => 'Saving...';

  @override
  String get saveAddress => 'Save Address';

  @override
  String get addressUpdatedSuccessfully => 'Address updated successfully';

  @override
  String get addressAddedSuccessfully => 'Address added successfully';

  @override
  String get savedAddresses => 'Saved Addresses';

  @override
  String get addressesLoadError => 'An error occurred while loading addresses';

  @override
  String get noSavedAddresses => 'No saved addresses';

  @override
  String get deleteAddress => 'Delete Address';

  @override
  String get confirmDeleteAddress =>
      'Are you sure you want to delete this address?';

  @override
  String get addressDeletedSuccessfully => 'Address deleted successfully';

  @override
  String get delete => 'Delete';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get faqCreateOrderQuestion => 'How do I create a new order?';

  @override
  String get faqCreateOrderAnswer =>
      'Choose the service you need from the home page, enter the order details and address, then confirm your order.';

  @override
  String get faqTrackOrderQuestion => 'How can I track my order?';

  @override
  String get faqTrackOrderAnswer =>
      'You can track your order status on the tracking page and view the latest updates about your order and driver.';

  @override
  String get faqEditProfileQuestion => 'How can I edit my account details?';

  @override
  String get faqEditProfileAnswer =>
      'Go to My Account, select Edit Profile, update your information, and save your changes.';

  @override
  String get faqAddAddressQuestion => 'How can I add a new address?';

  @override
  String get faqAddAddressAnswer =>
      'Go to My Account, select My Addresses, then tap Add Address.';

  @override
  String get faqOrderProblemQuestion =>
      'What should I do if I have a problem with my order?';

  @override
  String get faqOrderProblemAnswer =>
      'You can contact customer support using the contact options below.';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get callUs => 'Call Us';

  @override
  String get supportWorkingHours => 'Available daily from 9 AM to 10 PM';

  @override
  String get chatWithSupport => 'Chat with Support';

  @override
  String get contactSupportDirectly => 'Contact our support team directly';

  @override
  String get notificationsLoadError =>
      'An error occurred while loading notifications';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get justNow => 'Just now';

  @override
  String get yesterday => 'Yesterday';

  @override
  String minutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# minutes ago',
      one: '# minute ago',
      zero: 'Just now',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# hours ago',
      one: '# hour ago',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# days ago',
      one: '# day ago',
    );
    return '$_temp0';
  }

  @override
  String get addNewAddress => 'Add New Address';

  @override
  String get edit => 'Edit';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get enterFullName => 'Please enter your name';

  @override
  String get saving => 'Saving...';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String imagePickerError(String error) {
    return 'An error occurred while selecting the image: $error';
  }

  @override
  String get profileNoData => 'No user data available';

  @override
  String get ordersLoadError => 'An error occurred while loading orders';

  @override
  String get noOrders => 'No orders found';

  @override
  String get defaultDriverName => 'Ahmed Mohamed';

  @override
  String get deliveryDriver => 'Delivery Driver';

  @override
  String get call => 'Call';

  @override
  String get orderStatus => 'Order Status';

  @override
  String get onTheWayForDelivery => 'On the Way for Delivery';

  @override
  String get all => 'All';

  @override
  String get inProgress => 'In Progress';

  @override
  String get tracking => 'Tracking';

  @override
  String get confirmLogout => 'Are you sure you want to log out?';

  @override
  String get logoutError => 'An error occurred while logging out';
}
