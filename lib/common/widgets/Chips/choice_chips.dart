import 'package:flutter/material.dart';
import 'package:shopify/features/shop/screen/Main_Screen/grid_view_container.dart';
import 'package:shopify/utils/helpers/heloper_functions.dart';

class Tchicechips extends StatelessWidget {
  const Tchicechips({
    super.key,
    required this.selected,
    this.onselected, required this.text,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onselected;
  @override
  Widget build(BuildContext context) {
    final iscolor = THelperfunctions.getcolor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(

        label: iscolor ? const SizedBox() :Text(text),
        selected: selected,
        onSelected: onselected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        avatar:iscolor ?TRoundcontainer(width: 50,height: 50,backgroundcolor: THelperfunctions.getcolor(text)!,) : null,
        shape:iscolor ? const CircleBorder() : null,
        padding: iscolor ?const EdgeInsets.all(0) : null,
        labelPadding: iscolor ? const EdgeInsets.all(0) : null,
        backgroundColor: iscolor ? THelperfunctions.getcolor(text)!:  null,

      ),
    );
  }
}
