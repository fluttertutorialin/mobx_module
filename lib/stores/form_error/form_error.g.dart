// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_error.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool> _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??=
          Computed<bool>(() => super.hasErrorsInLogin))
      .value;
  Computed<bool> _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister))
      .value;
  Computed<bool> _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword))
      .value;

  final _$userEmailAtom = Atom(name: '_FormErrorStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportObserved();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.context
        .checkIfStateModificationsAreAllowed(_$userEmailAtom);
    super.userEmail = value;
    _$userEmailAtom.reportChanged();
  }

  final _$passwordAtom = Atom(name: '_FormErrorStore.password');

  @override
  String get password {
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.checkIfStateModificationsAreAllowed(_$passwordAtom);
    super.password = value;
    _$passwordAtom.reportChanged();
  }

  final _$confirmPasswordAtom = Atom(name: '_FormErrorStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context
        .checkIfStateModificationsAreAllowed(_$confirmPasswordAtom);
    super.confirmPassword = value;
    _$confirmPasswordAtom.reportChanged();
  }
}
