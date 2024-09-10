part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: darkColor,
          ),
          Container(
            color: '191919'.toColor(),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Text(
                  'Screen 1',
                  style: heading1,
                ),
                Text(
                  'Screen 2',
                  style: heading1,
                ),
                Text(
                  'Screen 3',
                  style: heading1,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Bottom Navbar',
              style: heading1,
            ),
          )
        ],
      ),
    );
  }
}
