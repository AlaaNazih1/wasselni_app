import 'package:flutter/material.dart';
import 'package:wasselni/features/profile/widgets/faq_item.dart';
import 'package:wasselni/features/profile/widgets/help_header.dart';
import 'package:wasselni/features/profile/widgets/support_card.dart';

import '../../../../core/theme/app_colors.dart';


class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HelpHeader(),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'الأسئلة الشائعة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  FaqItem(
                    question: 'إزاي أعمل طلب جديد؟',
                    answer:
                        'اختار الخدمة اللي محتاجها من الصفحة الرئيسية، وبعدها أدخل تفاصيل الطلب والعنوان وأكد الطلب.',
                  ),

                  FaqItem(
                    question: 'إزاي أتابع طلبي؟',
                    answer:
                        'تقدر تتابع حالة طلبك من صفحة تتبع الطلب وتشوف آخر تحديثات الطلب والمندوب.',
                  ),

                  FaqItem(
                    question: 'إزاي أعدل بيانات حسابي؟',
                    answer:
                        'ادخل على حسابي ثم اختار تعديل البيانات، وبعدها عدّل البيانات واضغط حفظ التعديلات.',
                  ),

                  FaqItem(
                    question: 'إزاي أضيف عنوان جديد؟',
                    answer:
                        'من حسابي اختار عناويني، وبعدها اضغط على إضافة عنوان جديد.',
                  ),

                  FaqItem(
                    question: 'ماذا أفعل لو عندي مشكلة في الطلب؟',
                    answer:
                        'تقدر تتواصل مع خدمة العملاء من خلال وسائل التواصل الموجودة بالأسفل.',
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'تواصل معنا',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SupportCard(
                    icon: Icons.phone_outlined,
                    title: 'اتصل بنا',
                    subtitle: 'متاح يوميًا من 9 ص إلى 10 م',
                    onTap: () {},
                  ),

                  SupportCard(
                    icon: Icons.chat_outlined,
                    title: 'المحادثة مع الدعم',
                    subtitle: 'تواصل مع فريق الدعم مباشرة',
                    onTap: () {},
                  ),

                  SupportCard(
                    icon: Icons.email_outlined,
                    title: 'البريد الإلكتروني',
                    subtitle: 'support@wasselni.com',
                    onTap: () {},
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
