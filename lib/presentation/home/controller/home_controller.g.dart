// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerStore, Store {
  Computed<BoletoModel?>? _$boletoComputed;

  @override
  BoletoModel? get boleto =>
      (_$boletoComputed ??= Computed<BoletoModel?>(() => super.boleto,
              name: 'HomeControllerStore.boleto'))
          .value;

  late final _$_boletoAtom =
      Atom(name: 'HomeControllerStore._boleto', context: context);

  @override
  BoletoModel? get _boleto {
    _$_boletoAtom.reportRead();
    return super._boleto;
  }

  @override
  set _boleto(BoletoModel? value) {
    _$_boletoAtom.reportWrite(value, super._boleto, () {
      super._boleto = value;
    });
  }

  @override
  String toString() {
    return '''
boleto: ${boleto}
    ''';
  }
}
