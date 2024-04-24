import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbihapp/core/getx/homescreenget.dart';
import 'package:tasbihapp/presentation/UI/homescreen/reusablewidget/tabbarContainer.dart';
import 'package:vibration/vibration.dart';

// import 'package:vibration/vibration.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // bool istap = false;
  List<bool> isTabTapped = [false, false, false, false];
  final List<Color> _colorOptions = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  Color _containerColor = const Color.fromARGB(255, 25, 30, 34);
  int _currentColorIndex = 0;
  void colorChangeBackground() {
    setState(() {
      // Increment the current color index
      _currentColorIndex = (_currentColorIndex + 1) % _colorOptions.length;
      // Set the container color to the next color in the list
      _containerColor = _colorOptions[_currentColorIndex];
    });
  }

  void colorChange(int index) {
    isTabTapped[index] = !isTabTapped[index];
    print("color is ${isTabTapped[index]}");
  }

  @override
  void initState() {
    // TODO: implement initState
    // count;
    _currentColorIndex;
    _controller.loadprefrences();
    super.initState();
  }

  final HomeScreenController _controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _containerColor,
      appBar: AppBar(
        title: const Text('Tasbih Lite'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Add your action for the right-side icon
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Add your action for Drawer item 1
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Add your action for Drawer item 2
              },
            ),
            // Add more Drawer items as needed
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: _containerColor,

                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Obx(
                        () {
                          return Text(
                            '${_controller.count}',
                            style: const TextStyle(fontSize: 50.0),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _controller.removeOneCount();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.replay),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        InkWell(
                          onTap: () {
                            _controller.resetCounter();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.restart_alt_sharp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      _controller.incrementCounter();
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 250),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _vibrate();
                      colorChange(0);
                    });
                  },
                  child: tabbarContainer(
                    istap: isTabTapped[0],
                    icon: Icons.vibration_outlined,
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        colorChange(1);
                      });
                    },
                    child: tabbarContainer(
                      istap: isTabTapped[1],
                      icon: Icons.vibration,
                    )),
                InkWell(
                    onTap: () {
                      setState(() {
                        colorChange(2);
                      });
                    },
                    child: tabbarContainer(
                      istap: isTabTapped[2],
                      icon: Icons.countertops,
                    )),
                InkWell(
                    onTap: () {
                      colorChangeBackground();
                      setState(() {
                        colorChange(3);
                      });
                    },
                    child: tabbarContainer(
                      istap: isTabTapped[3],
                      icon: Icons.invert_colors,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //vibrate fun
  void _vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      // Check if the device has a vibrator
      Vibration.vibrate();
      Future.delayed(const Duration(milliseconds: 500), () {});
    } else {
      // Handle the case where vibration is not supported
      print('Vibration is not supported on this device.');
    }
  }
}
