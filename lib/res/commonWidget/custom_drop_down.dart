import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownSelector<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<T> items;
  final void Function(T) onSelected;
  final String Function(T) itemToString;

  const CustomDropdownSelector({
    Key? key,
    required this.title,
    required this.items,
    required this.onSelected,
    required this.itemToString,
    this.value,
  }) : super(key: key);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items.map((item) {
            return ListTile(
              title: Text(itemToString(item)),
              onTap: () {
                Navigator.pop(context);
                onSelected(item);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showBottomSheet(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value != null ? itemToString(value!) : title,
              style: TextStyle(
                fontSize: 14.sp,
                color: value != null ? Colors.black : Colors.grey,
              ),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
