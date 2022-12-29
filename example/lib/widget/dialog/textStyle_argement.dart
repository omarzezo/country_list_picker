import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dialog_provider.dart';
import '../custom_list_tile.dart';


class TextStyleArguments extends StatelessWidget {
  const TextStyleArguments({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DialogProvider>(
      builder: (context, dialog, child) {
        return Column(
          children: [
            CustomListTile<Switch, bool>(
              title: "Font Bold",
              value: dialog.textStyle.fontWeight == FontWeight.bold,
              onChanged: (bool value) => dialog.textStyle =
                  dialog.textStyle.copyWith(fontWeight: (value == false) ? FontWeight.normal : FontWeight.bold),
            ),
            CustomListTile<Slider, double>(
              title: "Font Size",
              min: 12,
              max: 30,
              divisions: 18,
              value: dialog.textStyle.fontSize!,
              sliderLabel: dialog.textStyle.fontSize?.toInt().toString(),
              onChanged: (value) =>
                  dialog.textStyle = dialog.textStyle.copyWith(fontSize: value, color: dialog.textStyle.color),
            ),
            CustomListTile<ColorPicker, Color>(
              title: "Font Color",
              value: dialog.textStyle.color!,
              onChanged: (Color color) => dialog.textStyle = dialog.textStyle.copyWith(color: color),
            ),
          ],
        );
      },
    );
  }
}
