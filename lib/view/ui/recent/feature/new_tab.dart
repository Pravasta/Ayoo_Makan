import 'package:flutter/material.dart';
import 'package:restaurant_submission/view/widgets/recent_menu_widget.dart';

class NewTab extends StatelessWidget {
  const NewTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        RecentMenuWidget(
          title: 'Nasi Goreng',
          status: 'Process',
          isCancel: false,
        ),
      ],
    );
  }
}
