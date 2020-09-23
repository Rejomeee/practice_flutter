class GetTokenResponse {
  final int error;
  final String message;
  final Data data;

  GetTokenResponse(this.error, this.message, this.data);

  GetTokenResponse.fromJson(Map<String, dynamic> json)
      : error = json["error"],
        message = json["message"],
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
}

class Data {
  final String token;

  Data(this.token);

  Data.fromJson(Map<String, dynamic> json) : token = json["token"];
}
