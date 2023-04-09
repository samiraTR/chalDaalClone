import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tst_app2/bloc/theme_bloc.dart';

import 'package:tst_app2/ui/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.themeData,
            home: Scaffold(
                appBar: AppBar(),
                body: Column(
                  children: [
                    Switch(value: false, onChanged: (bool value) {}),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ThemeBloc>(context)
                              .add(const ThemeChanged(theme: AppTheme.system));
                        },
                        child: const Text("System")),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ThemeBloc>(context)
                              .add(const ThemeChanged(theme: AppTheme.light));
                        },
                        child: Text("Light")),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ThemeBloc>(context)
                              .add(const ThemeChanged(theme: AppTheme.dark));
                        },
                        child: const Text("Dark")),
                    Text("Ami Janni  na"),
                  ],
                )),
          );
        },
      ),
    );
  }
}
