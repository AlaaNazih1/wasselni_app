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

  @override
  String get orderData => 'بيانات الطلب';

  @override
  String get orderNotFound => 'الطلب غير موجود';

  @override
  String get unknownStatus => 'غير معروف';

  @override
  String get statusPending => 'تم استلام الطلب';

  @override
  String get statusInProgress => 'في الطريق';

  @override
  String get statusDelivered => 'تم التسليم';

  @override
  String get statusCancelled => 'ملغي';

  @override
  String get tripDetails => 'تفاصيل الرحلة';

  @override
  String get from => 'من';

  @override
  String get to => 'إلى';

  @override
  String get price => 'السعر';

  @override
  String get totalOrder => 'إجمالي الطلب';

  @override
  String get settings => 'الإعدادات';

  @override
  String get editProfile => 'تعديل البيانات';

  @override
  String get myAddresses => 'عناويني';

  @override
  String get help => 'المساعدة';

  @override
  String get language => 'اللغة';

  @override
  String get editAddress => 'تعديل العنوان';

  @override
  String get addAddress => 'إضافة عنوان';

  @override
  String get addressName => 'اسم العنوان';

  @override
  String get addressNameHint => 'مثال: المنزل';

  @override
  String get enterAddressName => 'من فضلك أدخل اسم العنوان';

  @override
  String get addressType => 'نوع العنوان';

  @override
  String get addressTypeHome => 'المنزل';

  @override
  String get addressTypeWork => 'العمل';

  @override
  String get addressTypeOther => 'أخرى';

  @override
  String get detailedAddress => 'العنوان بالتفصيل';

  @override
  String get detailedAddressHint => 'مثال: ديروط - أسيوط';

  @override
  String get enterDetailedAddress => 'من فضلك أدخل العنوان';

  @override
  String get savingAddress => 'جاري الحفظ...';

  @override
  String get saveAddress => 'حفظ العنوان';

  @override
  String get addressUpdatedSuccessfully => 'تم تعديل العنوان بنجاح';

  @override
  String get addressAddedSuccessfully => 'تم إضافة العنوان بنجاح';

  @override
  String get savedAddresses => 'العناوين المحفوظة';

  @override
  String get addressesLoadError => 'حدث خطأ في تحميل العناوين';

  @override
  String get noSavedAddresses => 'لا توجد عناوين محفوظة';

  @override
  String get deleteAddress => 'حذف العنوان';

  @override
  String get confirmDeleteAddress => 'هل أنت متأكد من حذف هذا العنوان؟';

  @override
  String get addressDeletedSuccessfully => 'تم حذف العنوان بنجاح';

  @override
  String get delete => 'حذف';

  @override
  String get faqTitle => 'الأسئلة الشائعة';

  @override
  String get faqCreateOrderQuestion => 'إزاي أعمل طلب جديد؟';

  @override
  String get faqCreateOrderAnswer =>
      'اختار الخدمة اللي محتاجها من الصفحة الرئيسية، وبعدها أدخل تفاصيل الطلب والعنوان وأكد الطلب.';

  @override
  String get faqTrackOrderQuestion => 'إزاي أتابع طلبي؟';

  @override
  String get faqTrackOrderAnswer =>
      'تقدر تتابع حالة طلبك من صفحة تتبع الطلب وتشوف آخر تحديثات الطلب والمندوب.';

  @override
  String get faqEditProfileQuestion => 'إزاي أعدل بيانات حسابي؟';

  @override
  String get faqEditProfileAnswer =>
      'ادخل على حسابي ثم اختار تعديل البيانات، وبعدها عدّل البيانات واضغط حفظ التعديلات.';

  @override
  String get faqAddAddressQuestion => 'إزاي أضيف عنوان جديد؟';

  @override
  String get faqAddAddressAnswer =>
      'من حسابي اختار عناويني، وبعدها اضغط على إضافة عنوان جديد.';

  @override
  String get faqOrderProblemQuestion => 'ماذا أفعل لو عندي مشكلة في الطلب؟';

  @override
  String get faqOrderProblemAnswer =>
      'تقدر تتواصل مع خدمة العملاء من خلال وسائل التواصل الموجودة بالأسفل.';

  @override
  String get contactUs => 'تواصل معنا';

  @override
  String get callUs => 'اتصل بنا';

  @override
  String get supportWorkingHours => 'متاح يوميًا من 9 ص إلى 10 م';

  @override
  String get chatWithSupport => 'المحادثة مع الدعم';

  @override
  String get contactSupportDirectly => 'تواصل مع فريق الدعم مباشرة';

  @override
  String get notificationsLoadError => 'حدث خطأ في تحميل الإشعارات';

  @override
  String get noNotifications => 'لا توجد إشعارات';

  @override
  String get justNow => 'منذ لحظات';

  @override
  String get yesterday => 'أمس';

  @override
  String minutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ # دقيقة',
      many: 'منذ # دقيقة',
      few: 'منذ # دقائق',
      two: 'منذ دقيقتين',
      one: 'منذ دقيقة واحدة',
      zero: 'منذ لحظات',
    );
    return '$_temp0';
  }

  @override
  String hoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ # ساعة',
      many: 'منذ # ساعة',
      few: 'منذ # ساعات',
      two: 'منذ ساعتين',
      one: 'منذ ساعة واحدة',
    );
    return '$_temp0';
  }

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'منذ # يوم',
      many: 'منذ # يومًا',
      few: 'منذ # أيام',
      two: 'منذ يومين',
      one: 'منذ يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get addNewAddress => 'إضافة عنوان جديد';

  @override
  String get edit => 'تعديل';

  @override
  String get personalInformation => 'البيانات الشخصية';

  @override
  String get enterFullName => 'من فضلك أدخل الاسم';

  @override
  String get saving => 'جاري الحفظ...';

  @override
  String get saveChanges => 'حفظ التعديلات';

  @override
  String get profileUpdatedSuccessfully => 'تم حفظ البيانات بنجاح';

  @override
  String imagePickerError(String error) {
    return 'حدث خطأ أثناء اختيار الصورة: $error';
  }

  @override
  String get profileNoData => 'لا توجد بيانات للمستخدم';
}
