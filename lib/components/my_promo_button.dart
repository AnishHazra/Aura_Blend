import 'package:flutter/material.dart';

class MyPromoButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyPromoButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFF0000),
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
