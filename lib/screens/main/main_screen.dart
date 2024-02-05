import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/screens/main/components/sideMenu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: sideMenu(),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: Column(
                      children: [...children],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
