// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DocumentController on DocumentControllerBase, Store {
  late final _$documentIDAtom =
      Atom(name: 'DocumentControllerBase.documentID', context: context);

  @override
  String get documentID {
    _$documentIDAtom.reportRead();
    return super.documentID;
  }

  @override
  set documentID(String value) {
    _$documentIDAtom.reportWrite(value, super.documentID, () {
      super.documentID = value;
    });
  }

  late final _$DocumentControllerBaseActionController =
      ActionController(name: 'DocumentControllerBase', context: context);

  @override
  dynamic setDocumentID(String newDocumentID) {
    final _$actionInfo = _$DocumentControllerBaseActionController.startAction(
        name: 'DocumentControllerBase.setDocumentID');
    try {
      return super.setDocumentID(newDocumentID);
    } finally {
      _$DocumentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
documentID: ${documentID}
    ''';
  }
}
