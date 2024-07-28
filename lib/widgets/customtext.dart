import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsreaderapp/controller/themeController.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double size;
  final Color color;
  CustomText(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.lato(color: widget.color, fontSize: widget.size),
    );
  }
}

class boldText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const boldText(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
