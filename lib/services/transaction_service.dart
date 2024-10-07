part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client? client}) async {
    // await Future.delayed(const Duration(seconds: 3));

    // return ApiReturnValue(value: mockTransactions);

    client ??= http.Client();

    String url = '${baseUrl}transaction';

    var response = await client.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${User.token}',
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Failed To Get Transactions');
    }

    var data = jsonDecode(response.body);

    List<Transaction> value = (data['data']['data'] as Iterable).map((e) => Transaction.fromJson(e)).toList();

    return ApiReturnValue(value: mockTransactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 2));

    return ApiReturnValue(
        value: transaction.copyWith(
      id: 123,
      status: TransactionStatus.pending,
      total: (transaction.quantity! * transaction.food!.price!).toInt(),
    ));
  }
}
