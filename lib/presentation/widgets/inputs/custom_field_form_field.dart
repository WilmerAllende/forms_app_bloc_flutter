import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChange;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {Key? key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChange,
      this.validator, 
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(20));
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        errorText: errorMessage,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        //icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary,),
      ),
    );
  }
}
