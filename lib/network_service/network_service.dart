import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

String url = 'https://6169a28b09e030001712c4dc.mockapi.io/jobs';

class NetworkHelper {
  NetworkHelper();

  static Future fetchNetworkData() async {
    http.Response response = await retry(
      // Make a GET request
      () => http.get(Uri.parse(url)).timeout(const Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (response.statusCode);
    }
  }
}
