class DocumentController {
  static final DocumentController _instance = DocumentController._internal();

  String documentID = "Valor inicial";
  List<dynamic> documentsStarted = [];
  List<dynamic> documentsEnd = [];

  factory DocumentController() {
    return _instance;
  }

  DocumentController._internal();
}
