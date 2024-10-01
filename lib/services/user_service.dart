part of "services.dart";

class UserService {
  static Future<ApiReturnValue<User>> signin(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + "/login";

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Login failed, pleae try again");
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
    // await Future.delayed(const Duration(milliseconds: 500));

    // // login berhasil
    // return ApiReturnValue(value: mockUser);

    // // login gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }
}
