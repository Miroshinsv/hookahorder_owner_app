
import 'package:chopper/chopper.dart';

class ApiClient {
  final chopper = ChopperClient(
    baseUrl: Uri(
      scheme: "http",
      host: "localhost",
      port: 8080
    ),

  );
}
