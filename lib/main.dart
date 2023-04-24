import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tst_app2/bloc/theme_bloc.dart';
import 'package:tst_app2/ui/all_categories.dart';
import 'package:tst_app2/ui/home_page.dart';
import 'package:tst_app2/ui/search_product.dart';
import 'package:tst_app2/ui/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final navPage = [HomePage(), AllCategoriesScreen(), SearchproductScreen()];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: state.themeData,
              home: Scaffold(
                  body: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      print(value);

                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    children: navPage,
                  ),
                  bottomNavigationBar: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Checkout",
                                  style: textSTYLEHeadline16,
                                ),
                                Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color:
                                        const Color.fromARGB(255, 131, 7, 153),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "400 BDT",
                                        style: textSTYLEHeadline15,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: BottomNavigationBar(
                            selectedItemColor: Colors.purple,
                            unselectedItemColor: Colors.grey,
                            selectedIconTheme: const IconThemeData(size: 32),
                            currentIndex: _currentIndex,
                            onTap: (value) {
                              print(value);

                              setState(() {
                                _currentIndex = value;
                                pageController.animateToPage(_currentIndex,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.linear);
                              });
                            },
                            items: [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home), label: "Home"),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.category_outlined),
                                  label: "Categories"),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.search), label: "Search"),
                            ]),
                      ),
                    ],
                  )));
        },
      ),
    );
  }
}
