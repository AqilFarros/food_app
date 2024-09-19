part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransactions
      .where((e) =>
          e.status == TransactionStatus.pending ||
          e.status == TransactionStatus.on_delivery)
      .toList();
  List<Transaction> past = mockTransactions
      .where((e) =>
          e.status == TransactionStatus.delivered ||
          e.status == TransactionStatus.canceled)
      .toList();

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;
    return (inProgress.isEmpty && past.isEmpty)
        ? IllustrationPage(
            title: 'Ouch! Hungry',
            subtitle: 'Seems like you have not\nordered any food yet',
            picturePath: 'assets/food_wishes.png',
            buttonTitle1: 'find foods',
            buttonTap1: () {},
          )
        : ListView(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: defaultMargin),
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 15,
                ),
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Orders.",
                      style: heading2,
                    ),
                    Text(
                      "Wait for your orders.",
                      style: heading3,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Tabbar(
                      selectedIndex: selectedIndex,
                      titles: const ["In Progress", "Past Orders"],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: (selectedIndex == 0 ? inProgress : past)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OrderListItem(
                                  transaction: e, itemWidth: itemWidth),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              )
            ],
          );
  }
}
