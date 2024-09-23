part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 3));

    return ApiReturnValue(value: mockTransactions);
  }

  static Future<ApiReturnValue<List<Transaction>>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 2));

    return ApiReturnValue(value: mockTransactions);
  }
}
