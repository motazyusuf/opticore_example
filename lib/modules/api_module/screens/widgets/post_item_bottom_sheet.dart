import 'package:flutter/material.dart';
import 'package:opticore/opticore.dart';

import '../../api_module_import.dart';
import '../../products_model.dart';

class PostItemBottomSheet extends StatelessWidget {
  PostItemBottomSheet({super.key, required this.parentContext});

  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController image = TextEditingController();
  final BuildContext parentContext;

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
                backgroundColor: Theme.of(context).primaryColorLight,
              ),
              onPressed: () {
                parentContext.read<ApiModuleBloc>().add(
                  AddProductEvent(
                    Product(
                      imageURL: image.text,
                      price: price.text.toDouble(),
                      title: name.text,
                    ),
                  ),
                );
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
