import 'package:http/http.dart' as http;

class NotifactionRepo {
  static postNotifaction({required String token}) async {
    print(token);
    var headers = {
      'Authorization': 'key=AAAAm1dtSco:APA91bFaB-8vwoXXO8MOSoKUqV21eIb_'
          'aQEJzq0f1dYr4m_NzIZe8mgw7B-E1vWJ0ra52Id2Lz7XprEtImPOKEH7XnfeEqVscjqmccimVIL-xMWkg3UlikAJtcD8NlCKvf596aDVZIyv',
      'Content-Type': ' application/json'
    };
    print(token);
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body =
        '''{\r\n "to" : "cQS8rDpTTpWvaAb9-cxJXq:APA91bFDjs5cTlMjJ3O0uF7x3IVRCysuR9HOIBBNdtQ1xEIfwK8ki3yQ8Fp9tCosxFkXzpw25UfYE7ZlNP0uSXqpXV88iiYaCqPsYxyEOLEvVqO5zBEkxXj9rTToOagqYOw9-C9jEb1w",\r\n "data" : {\r\n     "body" : "Notification Body",\r\n     "title": "Notification Title",\r\n     "key_1" : "Value for key_1",\r\n     "key_2" : "Value for key_2"\r\n }\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('ok');
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
