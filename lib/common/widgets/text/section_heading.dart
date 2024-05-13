import 'package:flutter/material.dart';


class MultipleSectionHeadings extends StatelessWidget {
  const MultipleSectionHeadings({
    super.key,
    this.textcolor ,
    this.showactionbutton = true,
    required this.title,
    this.buttontitle = "view all",
    this.onpressed ,
  });
  final Color? textcolor;
  final bool showactionbutton;
  final String title, buttontitle;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textcolor),),
        if(showactionbutton) TextButton(onPressed:onpressed, child: Text(buttontitle))
      ],
    );
  }
}

class body_heading extends StatelessWidget {
  const body_heading({
    super.key,

    this.showactionbutton = true,
    required this.title,
    this.buttontitle = "View all",
    this.onpressed,
  });


  final bool showactionbutton;
  final String title, buttontitle;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        if (showactionbutton)
          TextButton(onPressed: onpressed, child: Text(buttontitle))
      ],
    );
  }
}























