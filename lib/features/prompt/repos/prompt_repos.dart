import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class PromptRepo {
  static Future<Uint8List?> generateImage(String prompt) async {
    try {
      String url = 'https://api.vyro.ai/v1/imagine/api/generations';

      Map<String, dynamic> headers = {
        'Authorization':
            'Bearer vk-TD6PM3NoykhmM44OBbyPmvFWlRXY9xJuee6t4FcsQDm5o'
      };
      Map<String, dynamic> payloads = {
        'prompt': prompt,
        'style_id': '122',
        'aspect-ratio': '1:1',
        'cfg': '5',
        'seed': '1',
        'high_res_results': '1',
      };

      FormData formData = FormData.fromMap(payloads);

      Dio dio = Dio();
      dio.options = BaseOptions(
        headers: headers,
        responseType: ResponseType.bytes
      );

      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        log(response.data.runtimeType.toString());
        log(response.data.toString());
        //List<int> bytes = response.data.bytes;
        // File file = File('image.jpg');
        // file.writeAsString(response.data);
        // return file;
        //String bytes = response.data.toString();
        Uint8List uint8list = Uint8List.fromList(response.data);
        return uint8list;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
