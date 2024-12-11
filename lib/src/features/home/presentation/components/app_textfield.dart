import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final VoidCallback? onSubmit;
  const AppTextfield({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(15),
                ),
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                onSubmitted: onSubmitted,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Enter IP Address',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ).copyWith(top: 18),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onSubmit,
            child: Container(
              width: 58,
              height: 58,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(15),
                ),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
