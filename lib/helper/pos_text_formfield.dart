


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/enum/pos_text_formfield_validation_rule.dart';
import 'package:pos/helper/style.dart';

class PosTextFormfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? lebel;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObsecure;
  final PosTextFormfieldValidationRule? rule;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  const PosTextFormfield(
    {super.key, 
    this.controller,
    this.placeholder,
    this.lebel,
    this.prefixIcon,
    this.suffixIcon,
    this.isObsecure = false,
    this.rule,
    this.validator,
    this.onChanged
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      keyboardType: _getKeyboardType(),
      obscureText: isObsecure,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction, // when user input data 
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: HexColor('#F5F9FE'),
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintText: placeholder,
        hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: 
          EdgeInsets.symmetric(
            vertical: 8.0, 
            horizontal: 18
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: StyleColor.primary,width: 1.5),
          ),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch(rule){
      case PosTextFormfieldValidationRule.decimalNumber:
        return TextInputType.numberWithOptions(decimal: true);

      case PosTextFormfieldValidationRule.digitNumber:
        return TextInputType.numberWithOptions(decimal: false);

      case PosTextFormfieldValidationRule.email:
        return TextInputType.emailAddress;

      case PosTextFormfieldValidationRule.password:
        return TextInputType.visiblePassword;

      case PosTextFormfieldValidationRule.phone:
        return TextInputType.phone;

      default:
        return TextInputType.text;
    }
  }
}