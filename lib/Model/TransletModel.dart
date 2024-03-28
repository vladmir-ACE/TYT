class TranslateResponse {
  final List<TranslateModel> translateResponse;

  TranslateResponse({required this.translateResponse});

  factory TranslateResponse.fromJson(Map<String, dynamic> json) {
    return TranslateResponse(
        translateResponse: List<TranslateModel>.from(json["data"]["translations"]
            .map((x) => TranslateModel.fromJson(x))));
  }
}

class TranslateModel {
  final String translatedText;
  final String detectedSourceLanguage;

  TranslateModel(
      {required this.translatedText, required this.detectedSourceLanguage});

  factory TranslateModel.fromJson(Map<String, dynamic> json) {
    return TranslateModel(
        translatedText: json['translatedText'],
        detectedSourceLanguage: json['detectedSourceLanguage']);
  }
}
