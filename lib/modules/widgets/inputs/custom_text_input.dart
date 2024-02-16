import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../animation_components/easein_anim.dart';
import '../../../utils/helpers.dart';

typedef CustomCallBack = String Function(String value);

class CustomTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final bool? ignoreCursor;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? contentPadding;
  final String? defaultText;
  final FocusNode? focusNode;
  late final bool? obscureText;
  final bool togglePassword;
  final bool? enforceLength;
  final int? maxLength;
  final bool enabled;
  final Function? validator;
  final TextEditingController? controller;
  final String? Function(String)? functionValidate;
  final String? parametersValidate;
  final int? maximumLines;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final String? label;

  CustomTextField(
      {required this.hintText,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.ignoreCursor = false,
      this.maximumLines = 1,
      this.onTap,
      this.enabled = true,
      this.obscureText = false,
      this.togglePassword = false,
      this.controller,
      this.validator,
      this.functionValidate,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.prefixIcon,
      this.suffixIcon,
      this.label, this.contentPadding, this.maxLength = 100, this.enforceLength = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double bottomPaddingToError = 12;
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.blue,
      ),
      child: EaseInAnimationWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.label != null
                ? Text(
                    widget.label!,
                    style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      fontSize: 17.0,
                    ),
                  )
                : Container(),
            widget.label != null
                ? const SizedBox(
                    height: 5.0,
                  )
                : Container(),
            TextFormField(
              obscureText: _obscureText,
              keyboardType: widget.textInputType,
              readOnly: widget.ignoreCursor!,
              enabled: widget.enabled,
              maxLengthEnforcement: widget.enforceLength! ? MaxLengthEnforcement.enforced : MaxLengthEnforcement.enforced,
              maxLength: widget.maxLength,
              textInputAction: widget.actionKeyboard,
              maxLines: widget.maximumLines,
              focusNode: widget.focusNode,
              style: const TextStyle(
                fontSize: 16.0,
              ),
              initialValue: widget.defaultText,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon ??
                    (widget.togglePassword
                        ? IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                logItem(_obscureText);
                                _obscureText = !_obscureText;
                              });
                            },
                          )
                        : null),
                filled: false,
                hintText: widget.hintText,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w200),
                contentPadding: EdgeInsets.only(
                    top: 10,
                    bottom: bottomPaddingToError,
                    left: widget.contentPadding ?? 10.0,
                    right: widget.contentPadding ?? 10.0),
                isDense: true,
                errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
                errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: widget.controller,
              validator: (value) => widget.functionValidate != null
                  ? widget.functionValidate!(value!)
                  : commonValidation(value!, widget.label!),
              onFieldSubmitted: (value) {
                if (widget.onSubmitField != null) widget.onSubmitField!();
              },
              onTap: () {
                if (widget.onFieldTap != null) widget.onFieldTap!();
              },
            ),
          ],
        ),
      ),
    );
  }
}

String? commonValidation(String value, String fieldName) {
  var required = requiredValidator(value, fieldName);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return "$messageError is required";
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
