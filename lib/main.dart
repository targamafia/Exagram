import 'package:exagram/feature/home/page/home_page.dart';
import 'package:exagram/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Exagram',
      theme: exagramThemeLight(),
      home: const MyHomePage(title: 'MRP | Capacitación tecnológica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              color: Theme.of(context).backgroundColor,
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 30.0,
              ),
            ),
          )
        ],
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: [
        const HomePage(),
        const Center(child: Text('History')),
        const Center(child: Text('Profile')),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Inicio',
              selectedIcon: Icon(Icons.home)),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Buscar',
            selectedIcon: Icon(Icons.history_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.history_sharp),
            label: 'Historial',
            selectedIcon: Icon(Icons.person),
          )
        ],
        backgroundColor: Theme.of(context).canvasColor,
      ),
    );
  }
}
