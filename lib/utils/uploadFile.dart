import "package:dio/dio.dart";
import "dart:io";

Future uploadFile(String name, String path) async {
  var config = File(path);

  var contents = await config.readAsBytes();
  Dio dio = new Dio();
  await dio.post(
    "https://www.googleapis.com/upload/storage/v1/b/ai4vn-recording/o?uploadType=media&name=$name.wav",
    data: Stream.fromIterable(
        contents.map((e) => [e])), //create a Stream<List<int>>
    options: Options(
      headers: {
        HttpHeaders.contentLengthHeader: contents.length,
        HttpHeaders.contentTypeHeader: "audio/x-wav",
        HttpHeaders.authorizationHeader:
            "Bearer ya29.GlxkB-_lCR5Wg4Lx0ANuHW1YaLvoEFEYwdCEZOWgPnTQ92h5nMZ8yZ7a9fyBdTVntETRnEBoLcGXB4Dp6s2M1jw7e6IoTkUoATGRufU-opERzcH4OPlZgwzZZulD7Q"
      },
    ),
  );
}

// L337h4x()r
