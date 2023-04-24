import 'package:mobx/mobx.dart';
part 'document_controller.g.dart';

class DocumentController = DocumentControllerBase with _$DocumentController;

abstract class DocumentControllerBase with Store {
  @observable
  String documentID = '';

  @action
  setDocumentID(String newDocumentID) {
    documentID = newDocumentID;
  }
}
