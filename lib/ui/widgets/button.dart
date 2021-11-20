import 'package:app/ui/theme.dart';
import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const Mybutton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr
        ),
        child: Center(
          child: Text(
            label,
            style:const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
