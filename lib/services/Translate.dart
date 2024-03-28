import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:tyt/Model/TransletModel.dart';

class TranslateService {
  // final Map<String, String> headers = {
  //   'Content-Type': 'application/x-www-form-urlencoded',
  //   'Accept-Encoding': 'application/gzip',
  //   'X-Rapidapi-Key': '10bc1057d7msh7a23c67770ee6e8p15a2f4jsn7e2ef7ba056f',
  //   'X-Rapidapi-Host': 'google-translate1.p.rapidapi.com',
  //   'Host': 'google-translate1.p.rapidapi.com',
  // };

  final String apiKey = '10bc1057d7msh7a23c67770ee6e8p15a2f4jsn7e2ef7ba056f';
  final String url =
      'https://google-translate1.p.rapidapi.com/language/translate/v2';

  Future<String> translateText(String text) async {
    Dio dio = Dio();

    try {
      Options options = Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'X-Rapidapi-Key': apiKey,
          'X-Rapidapi-Host': 'google-translate1.p.rapidapi.com',
          'Host': 'google-translate1.p.rapidapi.com',
        },
      );

      // Envoi de la requête POST avec Dio
      Response response = await dio.post(url,
          data: {'q': text, 'target': 'fr'}, options: options);

      // Traitement de la réponse
      if (response.statusCode == 200) {
        print(response.data);
        TranslateResponse translateResponses =
            TranslateResponse.fromJson(response.data);
        final textTranslate =
            translateResponses.translateResponse.first.translatedText;

        return textTranslate;
      } else {
        print('Erreur: ${response.statusCode}');
        print('Corps de la réponse: ${response.data}');
        return 'Erreur: ${response.statusCode}';
      }
    } catch (error) {
      print('Erreur: ${error.toString()}');
      return 'Erreur: ${error.toString()}';
    }

  }
}
