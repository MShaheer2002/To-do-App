import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  String Description;

  DescriptionWidget({super.key, required this.Description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Description"),
      actions: [
        Center(
            child: Description.isEmpty
                ? const Text("No Description")
                : Text(Description)),
      ],
    );
  }
}
