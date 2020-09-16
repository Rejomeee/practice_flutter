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

      if (password == '')
        sink.addError('Password is required.');
      else if (password.length < 7)
        sink.addError('Password must atleast 7 characters.');
      else if (!hasUppercase)
        sink.addError('Must contain atleast 1 uppercase.');
      else if (!hasLowercase)
        sink.addError('Must contain atleast 1 lowercase.');
      else if (!hasDigits)
        sink.addError('Must contain atleast 1 numeric.');
      else if (!hasSpecialCharacters)
        sink.addError('Must contain atleast 1 special character.');
      else
        sink.add(password);
    },
  );
}
