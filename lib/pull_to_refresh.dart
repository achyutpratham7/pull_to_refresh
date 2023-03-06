import 'package:flutter/material.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({super.key});

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  late List<String> demodata;
  @override
  void initState() {
    demodata = [
      "FLUTTER",
      "REACT"
          "NODE JS"
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PULL TO REFRESH"),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
            itemCount: demodata.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(title: Text(demodata[index].toString())),
              );
            },
          ),
          onRefresh: () {
            return Future.delayed(const Duration(milliseconds: 3), (() {
              setState(() {
                demodata.addAll(["HTML", "CSS"]);
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Page Refresh")));
            }));
          }),
    );
  }
}
