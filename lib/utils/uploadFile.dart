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
            "Bearer ya29.GlxkB7B7p-QhLG652nrQDULevJT2NFSmLwBzWpUgoPiPo3CewXHDCXjs7g03q5Uq2IF5yMkSWxjH97668aDKSF87TzMuVJsKMWFAnUJq8YFvcOCQ6Uy_KrMevW11Fw" // set content-length
      },
    ),
  );
}

// L337h4x()r
