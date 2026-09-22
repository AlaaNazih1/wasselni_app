import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TrackingFilter extends StatelessWidget {
  const TrackingFilter({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final int selectedFilter;
  final ValueChanged<int> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: _FilterItem(
                  title: 'الكل',
                  selected: selectedFilter == 0,
                  onTap: () => onFilterChanged(0),
                ),
              ),

              Expanded(
                child: _FilterItem(
                  title: 'قيد التنفيذ',
                  selected: selectedFilter == 1,
                  onTap: () => onFilterChanged(1),
                ),
              ),

              Expanded(
                child: _FilterItem(
                  title: 'تم التسليم',
                  selected: selectedFilter == 2,
                  onTap: () => onFilterChanged(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterItem extends StatelessWidget {
  const _FilterItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
