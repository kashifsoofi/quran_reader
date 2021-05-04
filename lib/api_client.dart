import 'package:http/http.dart' as http;

Future<String> fetchChapterList(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://api.quran.com/api/v3/chapters?language=en'));

  return response.body;
}
