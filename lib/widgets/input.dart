import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? hint;
  final Color hintColor;
  final String? label;
  final Color? labelColor;
  final Color? background;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final bool shadow;
  final bool bold;
  final bool? obscure;
  final EdgeInsetsGeometry? padding;
  final double? size;
  final int? maxCharacters;
  final TextCapitalization capitalization;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  const Input(this.controller,{
    this.type=TextInputType.text,
    this.hint,
    this.hintColor=Colors.grey,
    this.label,
    this.labelColor,
    this.background,
    this.padding,
    this.color=Colors.black,
    this.borderColor=Colors.transparent,
    this.borderWidth=2,
    this.borderRadius=0,
    this.leading,
    this.trailing,
    this.shadow=false,
    this.size,
    this.maxCharacters,
    this.obscure,
    this.bold=false,
    this.capitalization=TextCapitalization.none,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadow?[
          const BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            spreadRadius: 1,
            offset: Offset(2,2),
          ),
        ]:null,
      ),
      child: TextField(
        style: TextStyle(
          color:color,
          fontSize:size??16,
          fontWeight:bold?FontWeight.bold:null,
        ),
        focusNode: focusNode,
        textCapitalization: capitalization,
        controller: controller,
        keyboardType: type,
        maxLines:type==TextInputType.multiline?null:1,
        maxLength:maxCharacters,
        obscureText:obscure??type==TextInputType.visiblePassword,
        onSubmitted:onSubmitted,
        onChanged:onChanged,
        decoration: InputDecoration(
          contentPadding: padding??const EdgeInsets.symmetric(horizontal:12,vertical:0),
          prefixIcon: leading,
          suffixIcon: trailing,
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(color:hintColor,fontSize:size??16),
          labelStyle: TextStyle(color:labelColor,fontSize:size??16),
          filled: true,
          fillColor: background??Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color:borderColor,width:borderWidth),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color:borderColor,width:borderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color:borderColor,width:borderWidth),
          ),
        ),
      ),
    );
  }
}