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
            "Bearer ya29.GlxlB_qAkoOKwikBoznqdJjtzyMP8s6rkN20TAAwVTSNoB1G0RTFkCvXsh2r4n310ZN-c2Ar-jVmq_WYeWuqhmbwnmKOksl2l35yVS_M2YFQgp3DXr38uXvzJT2qlw"
      },
    ),
  );
}

// L337h4x()r
