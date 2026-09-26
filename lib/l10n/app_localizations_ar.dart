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
}
