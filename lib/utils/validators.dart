import 'dart:async';

import 'package:email_validator/email_validator.dart';

mixin Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      final bool isValid = EmailValidator.validate(email);

      if (email == '') {
        sink.addError('Email is required.');
      } else if (!isValid) {
        sink.addError('Invalid email format.');
      } else {
        sink.add(email);
      }
    },
  );

  var passValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
      bool hasDigits = password.contains(new RegExp(r'[0-9]'));
      bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
      bool hasSpecialCharacters =
          password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      /* This is the combined regex to all */

      // String pattern =
      //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      // RegExp regExp = new RegExp(pattern);
      // regExp.hasMatch(password) ... returns true or false
      String error = '';

      if (password == '')
        error = 'Password is required.';
      else if (password.length < 7) error = 'Minimum of 7 characters.';

      if (error == '') {
        if (!hasUppercase)
          error == ''
              ? error += 'Must contain: 1 uppercase'
              : error += ', 1 uppercase';

        if (!hasLowercase)
          error == ''
              ? error += 'Must contain: 1 lowercase'
              : error += ', 1 lowercase';

        if (!hasDigits)
          error == ''
              ? error += 'Must contain: 1 numeric'
              : error += ', 1 numeric';

        if (!hasSpecialCharacters)
          error == ''
              ? error += 'Must contain: 1 special character.'
              : error += ', 1 special character.';
      }

      if (error == '')
        sink.add(password);
      else
        sink.addError(error);
    },
  );
}
