
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


enum InputType{number, text, discount}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.context,
    this.text,
    this.color = Colors.white,
    this.icon,
    this.radius = 100,
    this.height = 53,
    this.enabledBorderColor = Colors.deepPurple,
    this.hintColor = Colors.grey,
    this.horizontalPadding = 16,
    this.verticalPadding = 0,
    this.inputType = TextInputType.text,
    this.isDescription = false,
    this.isEnabled = true,
    this.isPassword = false,
    this.isSecured = false,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIconPressed,
    this.textType = InputType.text,
    this.withBorder = false
  }) : super(key: key);


  final TextEditingController controller;

  final String? Function(String?)? validator;
  final IconData ? icon;
  final IconData ? prefixIcon;
  final String ? text;
  final Color color;
  final bool withBorder;
  final bool isDescription;
  final bool isPassword;
  final bool isSecured;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final double radius;
  final bool isEnabled;
  final Color hintColor;
  final Color enabledBorderColor;
  final double height;
  final BuildContext context;
  final Function ? suffixIconPressed;
  final double verticalPadding;
  final double horizontalPadding;
  final TextInputType inputType;
  final InputType textType;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height.h,
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: color,
        // border: Border.all(
        //     color: withBorder ? Colors.grey : color),
        // borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: TextFormField(
          enabled: isEnabled ? true : false,
          inputFormatters: textType == InputType.number
              ? [
            FilteringTextInputFormatter.allow(
              RegExp(
                r'(^\d*\.?\d*)$',
              ),
            ),
          ] : null,
          controller: controller,
          onFieldSubmitted: onSubmitted,
          textAlignVertical: TextAlignVertical.bottom,
          validator: validator,
          onChanged: onChanged,
          maxLines: isDescription ? 7 : 1,
          obscureText: isSecured ? true : false,
          keyboardType: inputType,
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            isDense: true,
            hintText: text,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: verticalPadding, horizontal: horizontalPadding),
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 30, minWidth: 32),
            suffixIcon: icon == null ? null : Icon(
              icon, color: Colors.deepPurple,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(radius)),
              borderSide: const BorderSide(color: Colors.deepPurple),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(radius)),
              borderSide: BorderSide(
                  color: withBorder ? enabledBorderColor : color),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(radius)),
              borderSide: BorderSide(
                  color: withBorder ? enabledBorderColor : color),
            ),
          ),
        ),
      ),
    );
  }
}
