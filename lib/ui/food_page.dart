part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        // header
        Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          color: darkColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Food Market.",
                    style: heading1,
                  ),
                  Text(
                    "Let's obtain some food.",
                    style: heading2,
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://i.pinimg.com/736x/c8/4b/1b/c84b1bc7fb9fe438e9ac111af9db1b94.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 220,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: mockFoods
                .map(
                  (food) => Padding(
                    padding: EdgeInsets.only(
                        left: food == mockFoods.first ? defaultMargin : 0,
                        right: defaultMargin),
                    child: FoodCard(
                      food: food,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              Tabbar(
                selectedIndex: selectedIndex,
                titles: const ["New Taste", "Popular", "Recommended"],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Builder(
                builder: (_) {
                  List<Food> foods = (selectedIndex == 0)
                      ? mockFoods
                      : (selectedIndex == 1)
                          ? []
                          : [];
                  return Column(
                    children: foods
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FoodListItem(
                              food: e,
                              itemWidth: listWidth,
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        )
      ],
    );
  }
}
