import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/responsive.dart';
import 'package:portifolio/screens/main/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
      drawer: const SideMenu(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(
                  flex: 2,
                  child: SideMenu(),
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
