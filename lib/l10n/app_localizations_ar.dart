// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get home => 'الرئيسية';

  @override
  String get myOrders => 'طلباتي';

  @override
  String get newOrder => 'طلب جديد';

  @override
  String get profile => 'حسابي';

  @override
  String get chooseLanguage => 'اختر اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get trackOrder => 'تتبع الطلب';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get profileLoadError => 'حدث خطأ في تحميل البيانات';

  @override
  String get noUserData => 'لا توجد بيانات للمستخدم';

  @override
  String get noOrdersYet => 'لا توجد طلبات حتى الآن';

  @override
  String get delivered => 'تم التسليم';

  @override
  String get onTheWay => 'في الطريق';

  @override
  String get cancelled => 'ملغي';

  @override
  String get orderReceived => 'تم استلام الطلب';

  @override
  String get currency => 'جنيه';

  @override
  String get menu => 'القائمة';

  @override
  String get welcome => 'أهلاً بك';

  @override
  String get orderWhatYouNeed => 'اطلب اللي محتاجه بسهولة';

  @override
  String get orders => 'طلبات';

  @override
  String get restaurants => 'مطاعم';

  @override
  String get pharmacies => 'صيدليات';

  @override
  String get stores => 'متاجر';

  @override
  String get alwaysAhead => 'مع وصلني دائماً';

  @override
  String get oneStepAhead => 'سابقين بخطوة';

  @override
  String get latestOrders => 'آخر الطلبات';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get orderCreatedSuccessfully => 'تم إنشاء الطلب بنجاح';

  @override
  String get pickupAddress => 'من (عنوان الاستلام)';

  @override
  String get pickupExample => 'مثال: ديروط';

  @override
  String get deliveryAddress => 'إلى (عنوان التسليم)';

  @override
  String get deliveryExample => 'مثال: أسيوط';

  @override
  String get continueButton => 'متابعة';

  @override
  String get createNewOrder => 'إنشاء طلب جديد';

  @override
  String get pickupAndDelivery => 'استلام وتوصيل';

  @override
  String get deliveryOnly => 'توصيل فقط';

  @override
  String get orderDetails => 'تفاصيل الطلب';

  @override
  String get enterOrderDetails => 'من فضلك أدخل تفاصيل الطلب';

  @override
  String get orderDetailsHint => 'اكتب تفاصيل الطلب...';

  @override
  String get priceDetails => 'تفاصيل السعر';

  @override
  String get loginRequired => 'يجب تسجيل الدخول أولاً';

  @override
  String get orderConfirmedSuccessfully => 'تم تأكيد الطلب بنجاح';

  @override
  String orderCreationError(String error) {
    return 'حدث خطأ أثناء إنشاء الطلب: $error';
  }

  @override
  String get pickupLocation => 'مكان الاستلام';

  @override
  String get deliveryLocation => 'مكان التوصيل';

  @override
  String get deliveryPrice => 'سعر التوصيل';

  @override
  String get additionalFees => 'رسوم إضافية';

  @override
  String get ifAny => '(إن وجدت)';

  @override
  String get totalAmount => 'إجمالي المبلغ';

  @override
  String get creatingOrder => 'جاري إنشاء الطلب...';

  @override
  String get confirmOrder => 'تأكيد الطلب';

  @override
  String get pleaseEnter => 'من فضلك أدخل';

  @override
  String get welcomeTo => 'مرحباً بك في';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get enterPhoneNumber => 'من فضلك أدخل رقم الهاتف';

  @override
  String get phoneNumberMustBe11Digits => 'رقم الهاتف يجب أن يكون 11 رقم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get enterPassword => 'من فضلك أدخل كلمة المرور';

  @override
  String get passwordMustBe6Characters =>
      'كلمة المرور يجب أن تكون 6 أحرف على الأقل';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get createNewAccount => 'إنشاء حساب جديد';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get joinWasselni => 'انضم إلى Wasselni';

  @override
  String get fullName => 'الاسم بالكامل';

  @override
  String get enterYourName => 'أدخل اسمك';

  @override
  String get pleaseEnterYourName => 'من فضلك أدخل اسمك';

  @override
  String get nameMinLength => 'الاسم يجب أن يكون 3 أحرف على الأقل';

  @override
  String get pleaseEnterPhone => 'من فضلك أدخل رقم الهاتف';

  @override
  String get phoneMustBe11 => 'رقم الهاتف يجب أن يكون 11 رقم';

  @override
  String get invalidPhone => 'رقم الهاتف غير صحيح';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get enterEmail => 'example@email.com';

  @override
  String get pleaseEnterEmail => 'من فضلك أدخل البريد الإلكتروني';

  @override
  String get invalidEmail => 'البريد الإلكتروني غير صحيح';

  @override
  String get pleaseEnterPassword => 'من فضلك أدخل كلمة المرور';

  @override
  String get passwordMinLength => 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get pleaseConfirmPassword => 'من فضلك أكد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get register => 'إنشاء الحساب';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟ تسجيل الدخول';

  @override
  String get accountCreatedSuccessfully => 'تم إنشاء الحساب بنجاح';

  @override
  String get hintPhoneNumber => '01XXXXXXXXX';
}
