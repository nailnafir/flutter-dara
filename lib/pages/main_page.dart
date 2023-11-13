part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;

  List<Map<String, dynamic>> pageViews = [
    {
      'iconActive': Icons.home,
      'iconInactive': Icons.home_outlined,
      'text': 'Beranda',
      'page': const HomePage()
    },
    {
      'iconActive': Icons.calendar_month,
      'iconInactive': Icons.calendar_month_outlined,
      'text': 'Acara',
      'page': const EventPage()
    },
    {
      'iconActive': Icons.shopping_cart,
      'iconInactive': Icons.shopping_cart_outlined,
      'text': 'Pasar',
      'page': const MarketPage()
    },
    {
      'iconActive': Icons.person_3,
      'iconInactive': Icons.person_3_outlined,
      'text': 'Profil',
      'page': const ProfilePage()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SpaceConfiguration.normalSpace,
                ),
              ),
              title: Text(
                "Konfirmasi",
                style: TextThemeUtilities.subTitleTextFont,
              ),
              content: Text(
                "Yakin mau keluar aplikasi?",
                style: TextThemeUtilities.normalTextFont,
              ),
              actions: [
                TextButton(
                  child: Text(
                    "Tidak",
                    style: TextThemeUtilities.normalTextFont
                        .copyWith(color: ColorThemeUtilities.greenColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false); // tidak keluar
                  },
                ),
                TextButton(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SpaceConfiguration.shortSpace,
                      ),
                      color: ColorThemeUtilities.redColor,
                    ),
                    child: Text(
                      "Keluar",
                      style: TextThemeUtilities.normalTextFont
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true); // keluar
                  },
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: ColorThemeUtilities.backgroundLight,
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: pageViews.map((page) => page['page'] as Widget).toList(),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: SpaceConfiguration.shortSpace / 2,
          shape: const CircularNotchedRectangle(),
          notchMargin: SpaceConfiguration.shortSpace,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              pageViews.length,
              (index) {
                return Container(
                  margin: EdgeInsets.only(
                    bottom: SpaceConfiguration.shortSpace,
                    right: index == 1 ? SpaceConfiguration.longSpace : 0,
                    left: index == 2 ? SpaceConfiguration.longSpace : 0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        color: ColorThemeUtilities.primaryColor,
                        tooltip: pageViews[index]['text'] ?? '',
                        icon: _selectedPage == index
                            ? Icon(pageViews[index]['iconActive'])
                            : Icon(pageViews[index]['iconInactive']),
                        onPressed: () {
                          _selectedPage = index;
                          _pageController.jumpToPage(_selectedPage);
                        },
                      ),
                      Text(
                        pageViews[index]['text'] ?? '',
                        style: TextThemeUtilities.smallTextFont.copyWith(
                          color: ColorThemeUtilities.primaryColor,
                          fontWeight: _selectedPage == index
                              ? FontWeight.w600
                              : FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorThemeUtilities.primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const PostPage();
                },
              ),
            );
          },
          tooltip: 'Bagikan Informasi',
          elevation: SpaceConfiguration.shortSpace / 2,
          child: const Icon(Icons.add_box),
        ),
      ),
    );
  }
}
