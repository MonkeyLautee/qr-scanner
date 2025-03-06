import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final Color? textColor;
  final double size;
  final bool bold;
  const Button(this.text,this.onTap,{
    this.color,
    this.borderRadius=7.0,
    this.borderWidth=2.0,
    this.borderColor,
    this.textColor,
    this.size = 15.0,
    this.bold = true,
    super.key
  });
  @override
  Widget build(BuildContext context)=>ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color??Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderColor==null?BorderSide.none:BorderSide(color:borderColor!,width:borderWidth),
      ),
    ),
    onPressed: onTap,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: bold?FontWeight.bold:FontWeight.normal,
      ),
      textAlign:TextAlign.center,
    ),
  );
}