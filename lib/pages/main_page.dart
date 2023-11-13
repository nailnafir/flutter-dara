part of 'pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeUtilities.bgLight,
      body: SafeArea(
        child: Center(
          child: Text("DARA COMMUNITY", style: TextThemeUtilities.bigTextFont),
        ),
      ),
    );
  }
}
