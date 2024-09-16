part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPresses: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Orders',
                  style: heading3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(transaction.food!.picturePath!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 189,
                          child: Text(
                            transaction.food!.name!,
                            style: heading2,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            decimalDigits: 0,
                            locale: 'id_ID',
                            symbol: 'IDR ',
                          ).format(transaction.food!.price),
                          style: heading3,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        '${transaction.quantity} item(s)',
                        style: greyFontStyle.copyWith(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Text(
                  'Details Transaction',
                  style: heading3.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      transaction.food!.name!,
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(transaction.food!.price),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      "${transaction.quantity.toString()} item(s)",
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Sub Total',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        decimalDigits: 0,
                        locale: 'id_ID',
                        symbol: 'IDR ',
                      ).format(
                        transaction.food!.price! * transaction.quantity!,
                      ),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Row(
                  children: [
                    Text(
                      'Tax 10%',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(50000),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Driver',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(50000),
                      style: heading3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: whiteColor,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: heading3,
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.currency(
                        symbol: 'IDR ',
                        decimalDigits: 0,
                        locale: 'id_ID',
                      ).format(
                        (transaction.food!.price! * transaction.quantity!) *
                                1.1 +
                            50000,
                      ),
                      style: heading3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
