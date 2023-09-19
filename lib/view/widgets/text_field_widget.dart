import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_color/app_color.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.label,
    this.controller,
    this.onPressed,
    this.obsText,
    this.icon,
    this.validator,
  });

  final String label;
  final TextEditingController? controller;
  final Icon? icon;
  final Function()? onPressed;
  final bool? obsText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppText.text16,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              validator: validator,
              controller: controller,
              obscureText: obsText ?? false,
              style: AppText.text14.copyWith(
                fontWeight: AppText.fontWeight['500'],
              ),
              decoration: InputDecoration(
                suffixIcon: label == 'Password'
                    ? IconButton(
                        onPressed: onPressed,
                        icon: icon ?? const SizedBox(),
                      )
                    : const SizedBox(),
                hintText: 'Masukkan $label',
                hintStyle: AppText.text14.copyWith(
                  fontWeight: AppText.fontWeight['500'],
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
