import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class CircularCheckboxWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CircularCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CircularCheckboxWidget> createState() => _CircularCheckboxWidgetState();
}

class _CircularCheckboxWidgetState extends State<CircularCheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.value ? primaryColor : secondaryColor,
            width: 2,
          ),
          color: widget.value ? primaryColor : Colors.transparent,
        ),
        child: widget.value
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
