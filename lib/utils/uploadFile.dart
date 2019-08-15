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
            "Bearer ya29.GlxlB1_0w9TdtmlU4IWS1QGUVzQjx_EWWD3JNp_2C5AUIOyRwgCQydMYwBWSC_IpOSAfbyApKv8VOVJH9ZFnulAzcx5jly1zkCDTqL3K_LWs2vCEnqUNcqvSgdGoWg"
      },
    ),
  );
}

// L337h4x()r
