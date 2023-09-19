import 'package:flutter/material.dart';
import 'package:restaurant_submission/common/utils/app_text/app_text.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppText.text16.copyWith(
          fontWeight: AppText.fontWeight['500'],
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
