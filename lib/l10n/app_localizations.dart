import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Home navigation label
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// My orders navigation label
  ///
  /// In ar, this message translates to:
  /// **'طلباتي'**
  String get myOrders;

  /// New order label
  ///
  /// In ar, this message translates to:
  /// **'طلب جديد'**
  String get newOrder;

  /// Profile navigation label
  ///
  /// In ar, this message translates to:
  /// **'حسابي'**
  String get profile;

  /// Language selection prompt
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة'**
  String get chooseLanguage;

  /// Arabic language name
  ///
  /// In ar, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// English language name
  ///
  /// In ar, this message translates to:
  /// **'English'**
  String get english;

  /// Notifications label
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// Track order label
  ///
  /// In ar, this message translates to:
  /// **'تتبع الطلب'**
  String get trackOrder;

  /// Log out action
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// Cancel action
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// Confirm action
  ///
  /// In ar, this message translates to:
  /// **'تأكيد'**
  String get confirm;

  /// Profile data loading error
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل البيانات'**
  String get profileLoadError;

  /// Message shown when user data is unavailable
  ///
  /// In ar, this message translates to:
  /// **'لا توجد بيانات للمستخدم'**
  String get noUserData;

  /// Message shown when there are no orders
  ///
  /// In ar, this message translates to:
  /// **'لا توجد طلبات حتى الآن'**
  String get noOrdersYet;

  /// Delivered order status
  ///
  /// In ar, this message translates to:
  /// **'تم التسليم'**
  String get delivered;

  /// Order is on the way status
  ///
  /// In ar, this message translates to:
  /// **'في الطريق'**
  String get onTheWay;

  /// Cancelled order status
  ///
  /// In ar, this message translates to:
  /// **'ملغي'**
  String get cancelled;

  /// Order received status
  ///
  /// In ar, this message translates to:
  /// **'تم استلام الطلب'**
  String get orderReceived;

  /// Currency name
  ///
  /// In ar, this message translates to:
  /// **'جنيه'**
  String get currency;

  /// Menu label
  ///
  /// In ar, this message translates to:
  /// **'القائمة'**
  String get menu;

  /// Welcome message
  ///
  /// In ar, this message translates to:
  /// **'أهلاً بك'**
  String get welcome;

  /// Prompt encouraging users to order what they need
  ///
  /// In ar, this message translates to:
  /// **'اطلب اللي محتاجه بسهولة'**
  String get orderWhatYouNeed;

  /// Orders category label
  ///
  /// In ar, this message translates to:
  /// **'طلبات'**
  String get orders;

  /// Restaurants category label
  ///
  /// In ar, this message translates to:
  /// **'مطاعم'**
  String get restaurants;

  /// Pharmacies category label
  ///
  /// In ar, this message translates to:
  /// **'صيدليات'**
  String get pharmacies;

  /// Stores category label
  ///
  /// In ar, this message translates to:
  /// **'متاجر'**
  String get stores;

  /// Always ahead message
  ///
  /// In ar, this message translates to:
  /// **'مع وصلني دائماً'**
  String get alwaysAhead;

  /// One step ahead message
  ///
  /// In ar, this message translates to:
  /// **'سابقين بخطوة'**
  String get oneStepAhead;

  /// Latest orders label
  ///
  /// In ar, this message translates to:
  /// **'آخر الطلبات'**
  String get latestOrders;

  /// View all orders label
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get viewAll;

  /// Order creation success message
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الطلب بنجاح'**
  String get orderCreatedSuccessfully;

  /// Pickup address label
  ///
  /// In ar, this message translates to:
  /// **'من (عنوان الاستلام)'**
  String get pickupAddress;

  /// Pickup address example
  ///
  /// In ar, this message translates to:
  /// **'مثال: ديروط'**
  String get pickupExample;

  /// Delivery address label
  ///
  /// In ar, this message translates to:
  /// **'إلى (عنوان التسليم)'**
  String get deliveryAddress;

  /// Delivery address example
  ///
  /// In ar, this message translates to:
  /// **'مثال: أسيوط'**
  String get deliveryExample;

  /// Continue action
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get continueButton;

  /// Create a new order label
  ///
  /// In ar, this message translates to:
  /// **'إنشاء طلب جديد'**
  String get createNewOrder;

  /// Pickup and delivery option label
  ///
  /// In ar, this message translates to:
  /// **'استلام وتوصيل'**
  String get pickupAndDelivery;

  /// Delivery only option label
  ///
  /// In ar, this message translates to:
  /// **'توصيل فقط'**
  String get deliveryOnly;

  /// Order details section label
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الطلب'**
  String get orderDetails;

  /// Prompt to enter order details
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل تفاصيل الطلب'**
  String get enterOrderDetails;

  /// Hint for entering order details
  ///
  /// In ar, this message translates to:
  /// **'اكتب تفاصيل الطلب...'**
  String get orderDetailsHint;

  /// Price details section label
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل السعر'**
  String get priceDetails;

  /// Message shown when login is required
  ///
  /// In ar, this message translates to:
  /// **'يجب تسجيل الدخول أولاً'**
  String get loginRequired;

  /// Order confirmation success message
  ///
  /// In ar, this message translates to:
  /// **'تم تأكيد الطلب بنجاح'**
  String get orderConfirmedSuccessfully;

  /// Order creation error message
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء إنشاء الطلب: {error}'**
  String orderCreationError(String error);

  /// Pickup location label
  ///
  /// In ar, this message translates to:
  /// **'مكان الاستلام'**
  String get pickupLocation;

  /// Delivery location label
  ///
  /// In ar, this message translates to:
  /// **'مكان التوصيل'**
  String get deliveryLocation;

  /// Delivery price label
  ///
  /// In ar, this message translates to:
  /// **'سعر التوصيل'**
  String get deliveryPrice;

  /// Additional fees label
  ///
  /// In ar, this message translates to:
  /// **'رسوم إضافية'**
  String get additionalFees;

  /// Optional fees qualifier
  ///
  /// In ar, this message translates to:
  /// **'(إن وجدت)'**
  String get ifAny;

  /// Total amount label
  ///
  /// In ar, this message translates to:
  /// **'إجمالي المبلغ'**
  String get totalAmount;

  /// Message shown while creating an order
  ///
  /// In ar, this message translates to:
  /// **'جاري إنشاء الطلب...'**
  String get creatingOrder;

  /// Confirm order action
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الطلب'**
  String get confirmOrder;

  /// Prompt preceding a required input
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل'**
  String get pleaseEnter;

  /// Welcome message prefix
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في'**
  String get welcomeTo;

  /// Phone number label
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phoneNumber;

  /// Phone number input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل رقم الهاتف'**
  String get enterPhoneNumber;

  /// Phone number validation message
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يكون 11 رقم'**
  String get phoneNumberMustBe11Digits;

  /// Password label
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// Password input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل كلمة المرور'**
  String get enterPassword;

  /// Password validation message
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تكون 6 أحرف على الأقل'**
  String get passwordMustBe6Characters;

  /// Log in action
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// Create account action
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get createNewAccount;

  /// Create account heading
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get createAccount;

  /// Join Wasselni message
  ///
  /// In ar, this message translates to:
  /// **'انضم إلى Wasselni'**
  String get joinWasselni;

  /// Full name label
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالكامل'**
  String get fullName;

  /// Name input hint
  ///
  /// In ar, this message translates to:
  /// **'أدخل اسمك'**
  String get enterYourName;

  /// Name required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل اسمك'**
  String get pleaseEnterYourName;

  /// Name minimum length validation message
  ///
  /// In ar, this message translates to:
  /// **'الاسم يجب أن يكون 3 أحرف على الأقل'**
  String get nameMinLength;

  /// Phone number required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل رقم الهاتف'**
  String get pleaseEnterPhone;

  /// Phone number length validation message
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يكون 11 رقم'**
  String get phoneMustBe11;

  /// Invalid phone number validation message
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف غير صحيح'**
  String get invalidPhone;

  /// Email address label
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// Email input hint
  ///
  /// In ar, this message translates to:
  /// **'example@email.com'**
  String get enterEmail;

  /// Email required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل البريد الإلكتروني'**
  String get pleaseEnterEmail;

  /// Invalid email validation message
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير صحيح'**
  String get invalidEmail;

  /// Password required validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل كلمة المرور'**
  String get pleaseEnterPassword;

  /// Password minimum length validation message
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تكون 6 أحرف على الأقل'**
  String get passwordMinLength;

  /// Confirm password label
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// Confirm password validation message
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أكد كلمة المرور'**
  String get pleaseConfirmPassword;

  /// Password mismatch validation message
  ///
  /// In ar, this message translates to:
  /// **'كلمتا المرور غير متطابقتين'**
  String get passwordsDoNotMatch;

  /// Register action
  ///
  /// In ar, this message translates to:
  /// **'إنشاء الحساب'**
  String get register;

  /// Existing account login prompt
  ///
  /// In ar, this message translates to:
  /// **'لديك حساب بالفعل؟ تسجيل الدخول'**
  String get alreadyHaveAccount;

  /// Account creation success message
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الحساب بنجاح'**
  String get accountCreatedSuccessfully;

  /// Phone number input hint
  ///
  /// In ar, this message translates to:
  /// **'01XXXXXXXXX'**
  String get hintPhoneNumber;

  /// Order data label
  ///
  /// In ar, this message translates to:
  /// **'بيانات الطلب'**
  String get orderData;

  /// Order not found message
  ///
  /// In ar, this message translates to:
  /// **'الطلب غير موجود'**
  String get orderNotFound;

  /// Unknown order status
  ///
  /// In ar, this message translates to:
  /// **'غير معروف'**
  String get unknownStatus;

  /// Pending order status
  ///
  /// In ar, this message translates to:
  /// **'تم استلام الطلب'**
  String get statusPending;

  /// Order in progress status
  ///
  /// In ar, this message translates to:
  /// **'في الطريق'**
  String get statusInProgress;

  /// Delivered order status
  ///
  /// In ar, this message translates to:
  /// **'تم التسليم'**
  String get statusDelivered;

  /// Cancelled order status
  ///
  /// In ar, this message translates to:
  /// **'ملغي'**
  String get statusCancelled;

  /// Trip details label
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الرحلة'**
  String get tripDetails;

  /// Pickup origin label
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get from;

  /// Delivery destination label
  ///
  /// In ar, this message translates to:
  /// **'إلى'**
  String get to;

  /// Price label
  ///
  /// In ar, this message translates to:
  /// **'السعر'**
  String get price;

  /// Total order amount label
  ///
  /// In ar, this message translates to:
  /// **'إجمالي الطلب'**
  String get totalOrder;

  /// Settings label
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// Edit profile action
  ///
  /// In ar, this message translates to:
  /// **'تعديل البيانات'**
  String get editProfile;

  /// My addresses label
  ///
  /// In ar, this message translates to:
  /// **'عناويني'**
  String get myAddresses;

  /// Help label
  ///
  /// In ar, this message translates to:
  /// **'المساعدة'**
  String get help;

  /// Language label
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// Edit address action
  ///
  /// In ar, this message translates to:
  /// **'تعديل العنوان'**
  String get editAddress;

  /// Add address action
  ///
  /// In ar, this message translates to:
  /// **'إضافة عنوان'**
  String get addAddress;

  /// Address name label
  ///
  /// In ar, this message translates to:
  /// **'اسم العنوان'**
  String get addressName;

  /// Address name input hint
  ///
  /// In ar, this message translates to:
  /// **'مثال: المنزل'**
  String get addressNameHint;

  /// Address name input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل اسم العنوان'**
  String get enterAddressName;

  /// Address type label
  ///
  /// In ar, this message translates to:
  /// **'نوع العنوان'**
  String get addressType;

  /// Home address type
  ///
  /// In ar, this message translates to:
  /// **'المنزل'**
  String get addressTypeHome;

  /// Work address type
  ///
  /// In ar, this message translates to:
  /// **'العمل'**
  String get addressTypeWork;

  /// Other address type
  ///
  /// In ar, this message translates to:
  /// **'أخرى'**
  String get addressTypeOther;

  /// Detailed address label
  ///
  /// In ar, this message translates to:
  /// **'العنوان بالتفصيل'**
  String get detailedAddress;

  /// Detailed address input hint
  ///
  /// In ar, this message translates to:
  /// **'مثال: ديروط - أسيوط'**
  String get detailedAddressHint;

  /// Detailed address input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل العنوان'**
  String get enterDetailedAddress;

  /// Message shown while saving an address
  ///
  /// In ar, this message translates to:
  /// **'جاري الحفظ...'**
  String get savingAddress;

  /// Save address action
  ///
  /// In ar, this message translates to:
  /// **'حفظ العنوان'**
  String get saveAddress;

  /// Address update success message
  ///
  /// In ar, this message translates to:
  /// **'تم تعديل العنوان بنجاح'**
  String get addressUpdatedSuccessfully;

  /// Address addition success message
  ///
  /// In ar, this message translates to:
  /// **'تم إضافة العنوان بنجاح'**
  String get addressAddedSuccessfully;

  /// Saved addresses section title
  ///
  /// In ar, this message translates to:
  /// **'العناوين المحفوظة'**
  String get savedAddresses;

  /// Error message shown when saved addresses cannot be loaded
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل العناوين'**
  String get addressesLoadError;

  /// Message shown when there are no saved addresses
  ///
  /// In ar, this message translates to:
  /// **'لا توجد عناوين محفوظة'**
  String get noSavedAddresses;

  /// Delete address action
  ///
  /// In ar, this message translates to:
  /// **'حذف العنوان'**
  String get deleteAddress;

  /// Confirmation prompt for deleting an address
  ///
  /// In ar, this message translates to:
  /// **'هل أنت متأكد من حذف هذا العنوان؟'**
  String get confirmDeleteAddress;

  /// Address deletion success message
  ///
  /// In ar, this message translates to:
  /// **'تم حذف العنوان بنجاح'**
  String get addressDeletedSuccessfully;

  /// Delete action
  ///
  /// In ar, this message translates to:
  /// **'حذف'**
  String get delete;

  /// Frequently asked questions section title
  ///
  /// In ar, this message translates to:
  /// **'الأسئلة الشائعة'**
  String get faqTitle;

  /// FAQ question about creating a new order
  ///
  /// In ar, this message translates to:
  /// **'إزاي أعمل طلب جديد؟'**
  String get faqCreateOrderQuestion;

  /// FAQ answer about creating a new order
  ///
  /// In ar, this message translates to:
  /// **'اختار الخدمة اللي محتاجها من الصفحة الرئيسية، وبعدها أدخل تفاصيل الطلب والعنوان وأكد الطلب.'**
  String get faqCreateOrderAnswer;

  /// FAQ question about tracking an order
  ///
  /// In ar, this message translates to:
  /// **'إزاي أتابع طلبي؟'**
  String get faqTrackOrderQuestion;

  /// FAQ answer about tracking an order
  ///
  /// In ar, this message translates to:
  /// **'تقدر تتابع حالة طلبك من صفحة تتبع الطلب وتشوف آخر تحديثات الطلب والمندوب.'**
  String get faqTrackOrderAnswer;

  /// FAQ question about editing profile information
  ///
  /// In ar, this message translates to:
  /// **'إزاي أعدل بيانات حسابي؟'**
  String get faqEditProfileQuestion;

  /// FAQ answer about editing profile information
  ///
  /// In ar, this message translates to:
  /// **'ادخل على حسابي ثم اختار تعديل البيانات، وبعدها عدّل البيانات واضغط حفظ التعديلات.'**
  String get faqEditProfileAnswer;

  /// FAQ question about adding a new address
  ///
  /// In ar, this message translates to:
  /// **'إزاي أضيف عنوان جديد؟'**
  String get faqAddAddressQuestion;

  /// FAQ answer about adding a new address
  ///
  /// In ar, this message translates to:
  /// **'من حسابي اختار عناويني، وبعدها اضغط على إضافة عنوان جديد.'**
  String get faqAddAddressAnswer;

  /// FAQ question about problems with an order
  ///
  /// In ar, this message translates to:
  /// **'ماذا أفعل لو عندي مشكلة في الطلب؟'**
  String get faqOrderProblemQuestion;

  /// FAQ answer about problems with an order
  ///
  /// In ar, this message translates to:
  /// **'تقدر تتواصل مع خدمة العملاء من خلال وسائل التواصل الموجودة بالأسفل.'**
  String get faqOrderProblemAnswer;

  /// Contact us section or action
  ///
  /// In ar, this message translates to:
  /// **'تواصل معنا'**
  String get contactUs;

  /// Action to call support
  ///
  /// In ar, this message translates to:
  /// **'اتصل بنا'**
  String get callUs;

  /// Support team working hours
  ///
  /// In ar, this message translates to:
  /// **'متاح يوميًا من 9 ص إلى 10 م'**
  String get supportWorkingHours;

  /// Action to chat with support
  ///
  /// In ar, this message translates to:
  /// **'المحادثة مع الدعم'**
  String get chatWithSupport;

  /// Action to contact the support team directly
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع فريق الدعم مباشرة'**
  String get contactSupportDirectly;

  /// Error message shown when notifications fail to load
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل الإشعارات'**
  String get notificationsLoadError;

  /// Message shown when there are no notifications
  ///
  /// In ar, this message translates to:
  /// **'لا توجد إشعارات'**
  String get noNotifications;

  /// Relative time label for an event that happened moments ago
  ///
  /// In ar, this message translates to:
  /// **'منذ لحظات'**
  String get justNow;

  /// Relative time label for an event that happened yesterday
  ///
  /// In ar, this message translates to:
  /// **'أمس'**
  String get yesterday;

  /// No description provided for @minutesAgo.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, zero{منذ لحظات} one{منذ دقيقة واحدة} two{منذ دقيقتين} few{منذ # دقائق} many{منذ # دقيقة} other{منذ # دقيقة}}'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, one{منذ ساعة واحدة} two{منذ ساعتين} few{منذ # ساعات} many{منذ # ساعة} other{منذ # ساعة}}'**
  String hoursAgo(int count);

  /// No description provided for @daysAgo.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, one{منذ يوم واحد} two{منذ يومين} few{منذ # أيام} many{منذ # يومًا} other{منذ # يوم}}'**
  String daysAgo(int count);

  /// Add new address action
  ///
  /// In ar, this message translates to:
  /// **'إضافة عنوان جديد'**
  String get addNewAddress;

  /// Edit action
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get edit;

  /// Personal information section title
  ///
  /// In ar, this message translates to:
  /// **'البيانات الشخصية'**
  String get personalInformation;

  /// Full name input prompt
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل الاسم'**
  String get enterFullName;

  /// Saving status message
  ///
  /// In ar, this message translates to:
  /// **'جاري الحفظ...'**
  String get saving;

  /// Save changes action
  ///
  /// In ar, this message translates to:
  /// **'حفظ التعديلات'**
  String get saveChanges;

  /// Profile update success message
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ البيانات بنجاح'**
  String get profileUpdatedSuccessfully;

  /// No description provided for @imagePickerError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء اختيار الصورة: {error}'**
  String imagePickerError(String error);

  /// Message shown when user profile data is unavailable
  ///
  /// In ar, this message translates to:
  /// **'لا توجد بيانات للمستخدم'**
  String get profileNoData;

  /// Error message shown when orders fail to load
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في تحميل الطلبات'**
  String get ordersLoadError;

  /// Message shown when there are no orders
  ///
  /// In ar, this message translates to:
  /// **'لا توجد طلبات'**
  String get noOrders;

  /// Default driver name
  ///
  /// In ar, this message translates to:
  /// **'أحمد محمد'**
  String get defaultDriverName;

  /// Delivery driver label
  ///
  /// In ar, this message translates to:
  /// **'مندوب توصيل'**
  String get deliveryDriver;

  /// Call action
  ///
  /// In ar, this message translates to:
  /// **'اتصال'**
  String get call;

  /// Order status label
  ///
  /// In ar, this message translates to:
  /// **'حالة الطلب'**
  String get orderStatus;

  /// Order status shown when the delivery is on the way
  ///
  /// In ar, this message translates to:
  /// **'في الطريق للتسليم'**
  String get onTheWayForDelivery;

  /// Label for all items
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get all;

  /// Order status shown when an order is in progress
  ///
  /// In ar, this message translates to:
  /// **'قيد التنفيذ'**
  String get inProgress;

  /// Tracking label
  ///
  /// In ar, this message translates to:
  /// **'متابعة الطلب'**
  String get tracking;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
