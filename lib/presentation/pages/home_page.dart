import 'package:flutter/material.dart';
import 'package:url_shorter_by_cleanuri/presentation/components/home/url_converter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: UrlConverter(),
        )
      ),
    );
  }
}
