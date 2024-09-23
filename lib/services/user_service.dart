part of "services.dart";

class UserService {
  static Future<ApiReturnValue<User>> signin(
      String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // login berhasil
    return ApiReturnValue(value: mockUser);

    // login gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }
}
