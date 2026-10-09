import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:wasselni/l10n/app_localizations.dart';

class NotificationTimeFormatter {
  const NotificationTimeFormatter._();

  static String format(BuildContext context, dynamic value) {
    if (value == null) return '';

    if (value is! Timestamp) {
      return value.toString();
    }

    final l10n = AppLocalizations.of(context)!;
    final date = value.toDate();
    final difference = DateTime.now().difference(date);

    if (difference.isNegative) {
      return l10n.justNow;
    }

    if (difference.inMinutes < 1) {
      return l10n.justNow;
    }

    if (difference.inHours < 1) {
      return l10n.minutesAgo(difference.inMinutes);
    }

    if (difference.inDays < 1) {
      return l10n.hoursAgo(difference.inHours);
    }

    if (difference.inDays == 1) {
      return l10n.yesterday;
    }

    return l10n.daysAgo(difference.inDays);
  }
}
