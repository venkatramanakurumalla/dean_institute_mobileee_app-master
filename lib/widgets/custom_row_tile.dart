import 'package:flutter/material.dart';

class CustomRowTile extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final void Function()? onTap;
  const CustomRowTile(
      {Key? key, required this.leading, required this.trailing, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          trailing,
        ],
      ),
    );
  }
}
