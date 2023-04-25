class DocumentController {
  static final DocumentController _instance = DocumentController._internal();

  String documentID = "Valor inicial";

  factory DocumentController() {
    return _instance;
  }

  DocumentController._internal();
}
