import 'package:chronos/const.dart';
import 'package:flutter/material.dart';

class CurvedAppBar extends StatelessWidget {
  String? title;
  bool? isBackButton;
  double? height;
  Widget? widget;
  CurvedAppBar({this.title, this.isBackButton, this.height, this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 130,
        alignment: (title != null) ? Alignment.center : null,
        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientGreenColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 50.0),
          ),
        ),
        child: (isBackButton ?? false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 40,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          size: 35,
                          color: Colors.white,
                        )),
                  ),
                  title != null
                      ? Text(
                          title!,
                          style: titleStyleWhite,
                        )
                      : const SizedBox(),
                ],
              )
            : (widget != null)
                ? widget!
                : title != null
                    ? Text(
                        title!,
                        style: titleStyleWhite,
                      )
                    : const SizedBox());
  }
}
