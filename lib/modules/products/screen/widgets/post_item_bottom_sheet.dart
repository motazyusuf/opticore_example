import 'package:flutter/material.dart';
import 'package:opticore/opticore.dart';


class PostItemBottomSheet extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController image = TextEditingController();
  final Function(String? image, String? name, double? price)? onAdd;

  PostItemBottomSheet({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: "Item Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: price,
              decoration: InputDecoration(labelText: "Item Price"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: image,
              decoration: InputDecoration(labelText: "Item Image"),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.inversePrimary,
              ),
              onPressed: () {
                onAdd!(
                  image.text,
                  name.text,
                  price.text.toDouble(),
                );
                Navigator.pop(context);
              },
              child: const Text(
                "Confirm",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
