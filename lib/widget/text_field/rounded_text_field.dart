import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? hintColor;
  final Color? textColor;
  final Color? backgroundColor;
  final TextInputType? inputType;
  final bool? obscureText;
  final bool? enableInput;
  final bool? showSuffix;
  final void Function()? suffixAction;
  final String? Function(String?)? validator;
  final void Function(String value)? onChange;
  final TextEditingController? controller;

  const RoundedTextField({
    super.key,
    required this.hintText,
    this.prefixIcon = FontAwesomeIcons.magnifyingGlass,
    this.suffixIcon = FontAwesomeIcons.ban,
    this.hintColor = Colors.grey,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.enableInput = true,
    this.validator,
    this.onChange,
    this.controller,
    this.suffixAction,
    this.showSuffix = false,
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      scrollPhysics: const BouncingScrollPhysics(),
      validator: (value) => widget.validator!(value),
      onChanged: (value) => widget.onChange!(value),
      keyboardType: widget.inputType ?? TextInputType.text,
      obscureText: widget.obscureText! ? passwordVisible : widget.obscureText!,
      enabled: widget.enableInput,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          size: 16,
          color: widget.hintColor,
        ),
        suffixIcon: suffixOption(),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 1, style: BorderStyle.solid, color: Colors.red),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        filled: true,
        fillColor: widget.backgroundColor,
      ),
      style: TextStyle(
        color: widget.enableInput! ? widget.textColor : Colors.grey,
        fontSize: 16,
      ),
    );
  }

  Widget? suffixOption() {
    if (widget.showSuffix!) {
      return widget.obscureText!
          ? IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              icon: passwordVisible
                  ? Icon(
                      FontAwesomeIcons.eye,
                      size: 16,
                      color: widget.hintColor,
                    )
                  : Icon(
                      FontAwesomeIcons.eyeSlash,
                      size: 16,
                      color: widget.hintColor,
                    ),
            )
          : IconButton(
              onPressed: () {
                if (widget.suffixAction != null) {
                  widget.suffixAction!();
                } else {
                  widget.controller?.clear();
                }
              },
              icon: Icon(
                widget.suffixIcon!,
                size: 16,
                color: widget.hintColor,
              ),
            );
    }
    return null;
  }
}
