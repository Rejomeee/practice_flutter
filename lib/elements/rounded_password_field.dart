import 'package:flutter/material.dart';
import 'package:igdb_app/elements/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final IconData preIcon;
  final String hintText;
  final String initialValue;
  final bool passVisible;
  final Function onTap;
  final Function onSaved;
  final Function validator;
  final String errorText;
  final bool hasError;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.preIcon = Icons.lock,
    this.hintText,
    this.passVisible = true,
    this.onTap,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.errorText,
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      hasError: hasError,
      child: TextFormField(
        obscureText: passVisible,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            preIcon,
            color: Colors.black,
          ),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              passVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}
