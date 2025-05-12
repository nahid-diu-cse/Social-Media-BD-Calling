import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownSelector<T> extends StatelessWidget {
  final String title; // Title will act as a static heading
  final T? value;
  final List<T> items;
  final void Function(T) onSelected;
  final String Function(T) itemToString;
  final String bottomSheetHeading; // New parameter for the bottom sheet heading

  const CustomDropdownSelector({
    Key? key,
    required this.title,
    required this.items,
    required this.onSelected,
    required this.itemToString,
    this.value,
    required this.bottomSheetHeading, // Initialize the bottom sheet heading
  }) : super(key: key);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) => Container(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Static heading for the bottom sheet
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                bottomSheetHeading,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            // Divider to separate heading from the list
            Divider(),
            // Render the list of items excluding the selected one
            ...items.where((item) => item != value).map((item) {
              return ListTile(
                title: Text(itemToString(item)),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  onSelected(item); // Update the selected item in parent
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Static heading (title)
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h), // Space between title and dropdown
        InkWell(
          onTap: () => _showBottomSheet(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Display either selected value or placeholder (title)
                Text(
                  value != null ? itemToString(value!) : "Select an option",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: value != null ? Colors.black : Colors.grey,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
