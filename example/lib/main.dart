import 'package:flutter/material.dart';
import 'package:responsive_widget/responsive_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ResponsiveWidget(
          phoneBuilder: (_) => const Center(child: Text("Phone widget")),
          tabletBuilder: (_) => const Center(child: Text("Tablet widget")),
          desktopBuilder: (_) => ResponsiveDesktopWidget(
            smallBuilder: (_) => const Center(child: Text("Small desktop widget")),
            largeBuilder: (_) => const Center(child: Text("Large esktop widget")),
          ),
        ),
      );
}
