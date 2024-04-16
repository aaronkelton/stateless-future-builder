import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Future Builder Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stateless Future Builder'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[TheFuture()],
        ),
      ),);
  }
}

class TheFuture extends StatelessWidget {
  TheFuture({super.key});

  final Future<List<dynamic>> packageInfo = Future.wait([
    Future.delayed(const Duration(seconds: 3)),
    PackageInfo.fromPlatform(),
  ]);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: packageInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
              'Version: ${snapshot.data?.last.version}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
