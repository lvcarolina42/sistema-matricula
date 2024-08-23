// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerStore, Store {
  Computed<bool>? _$showPasswordComputed;

  @override
  bool get showPassword =>
      (_$showPasswordComputed ??= Computed<bool>(() => super.showPassword,
              name: 'LoginControllerStore.showPassword'))
          .value;

  late final _$_showPasswordAtom =
      Atom(name: 'LoginControllerStore._showPassword', context: context);

  @override
  bool get _showPassword {
    _$_showPasswordAtom.reportRead();
    return super._showPassword;
  }

  @override
  set _showPassword(bool value) {
    _$_showPasswordAtom.reportWrite(value, super._showPassword, () {
      super._showPassword = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerStore.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$LoginControllerStoreActionController =
      ActionController(name: 'LoginControllerStore', context: context);

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$LoginControllerStoreActionController.startAction(
        name: 'LoginControllerStore.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$LoginControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword}
    ''';
  }
}
