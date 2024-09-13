part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.onBackButtonPressed,
    required this.food,
  });

  final Function onBackButtonPressed;
  final Food food;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: darkColor,
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.food.picturePath ??
                      'https://ui-avatars.com/api/?name=${widget.food.name}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.onBackButtonPressed != null) {
                      widget.onBackButtonPressed!();
                    }
                  },
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white12,
                        ),
                        child: Image.asset('assets/back_arrow_white.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
