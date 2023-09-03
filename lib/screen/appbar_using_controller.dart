import 'package:flutter/material.dart';
import 'package:flutter_tabbar/const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({super.key});

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

class _AppBarUsingControllerState extends State<AppBarUsingController>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: TABS.length,
      vsync: this,
    ); // this = TickerProviderStateMixin 를 with로 지정해줬기 때문에 this 가 딱 값에 들어감
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appbar Using Controller',
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: TABS
              .map((e) => Tab(
                    icon: Icon(e.icon),
                    child: Text(e.label),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(e.icon),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (tabController.index != 0)
                          ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(
                                tabController.index - 1,
                              );
                            },
                            child: Text('이전'),
                          ),
                        const SizedBox(
                          width: 16,
                        ),
                        if (tabController.index != TABS.length - 1)
                          ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(
                                tabController.index + 1,
                              );
                            },
                            child: Text('다음'),
                          )
                      ],
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
