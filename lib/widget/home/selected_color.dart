import 'package:flutter/material.dart';

import '../../config/colors.dart';

class SelectedColor extends StatelessWidget {
  final int selectedColor;
  final Function(int) onColorSelected;
  final Function(String) onRemindSelected;

  const SelectedColor(
      {Key? key,
      required this.selectedColor,
      required this.onColorSelected,
      required this.onRemindSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Màu : '),
            Container(
              width: 130,
              child: Wrap(
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () => onColorSelected(index),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: index == 0
                            ? TColors.gray1
                            : index == 1
                                ? TColors.lightBlue
                                : index == 2
                                    ? TColors.green
                                    : TColors.yellow,
                        child: selectedColor == index
                            ? Icon(
                                Icons.done,
                                color: TColors.white,
                                size: 16,
                              )
                            : Container(),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        Container(
          width: 120,
          child: DropdownButtonFormField(
            items: ['5', '10', '15', '20', '25']
                .map(
                  (minute) => DropdownMenuItem(
                    child: Text(minute + ' phút'),
                    value: minute,
                  ),
                )
                .toList(),
            onChanged: (value) => onRemindSelected(value!),
            decoration: InputDecoration(
              labelText: 'Nhắc lại',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
