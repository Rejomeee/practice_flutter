import 'package:flutter/material.dart';
import 'package:igdb_app/elements/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final IconData preIcon;
  final String hintText;
  final String initialValue;
  final bool hasError;
  final String errorText;
  final TextInputType keyboardType;
  final IconData suffIcon;
  final Function onSaved;
  final Function validator;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.preIcon = Icons.person,
    this.hintText,
    this.suffIcon,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.errorText,
    this.hasError,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      hasError: hasError,
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            preIcon,
            color: Colors.black,
          ),
          hintText: hintText,
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}
