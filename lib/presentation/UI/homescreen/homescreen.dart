import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbihapp/core/getx/homescreenget.dart';
import 'package:tasbihapp/presentation/UI/homescreen/reusablewidget/tabbarContainer.dart';
import 'package:vibration/vibration.dart';

// import 'package:vibration/vibration.dart';

class CounterScreen extends StatefulWidget {
  final HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // bool istap = false;

  @override
  void initState() {
    // TODO: implement initState
    // count;
    widget.homeScreenController.currentColorIndex.value;
    widget.homeScreenController.loadPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    return Obx(
      () => 
      Scaffold(
        backgroundColor: widget.homeScreenController.containerColor.value,
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
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {},
              ),
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
                              '${widget.homeScreenController.count}',
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
                              widget.homeScreenController.removeOneCount();
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
                              widget.homeScreenController.resetCounter();
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
                        widget.homeScreenController.incrementCounter();
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
              child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _vibrate();
                          widget.homeScreenController.colorChange(0);
                        },
                        child: tabbarContainer(
                          istap: widget.homeScreenController.isTabTapped[0],
                          icon: Icons.vibration_outlined,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            widget.homeScreenController.colorChange(1);
                          },
                          child: tabbarContainer(
                            istap: widget.homeScreenController.isTabTapped[1],
                            icon: Icons.vibration,
                          )),
                      InkWell(
                          onTap: () {
                            widget.homeScreenController.colorChange(2);
                          },
                          child: tabbarContainer(
                            istap: widget.homeScreenController.isTabTapped[2],
                            icon: Icons.countertops,
                          )),
                      InkWell(
                          onTap: () {
                           
                              widget.homeScreenController.colorChangeBackground();
      
                            widget.homeScreenController.colorChange(3);
                         
                          },
                          child: tabbarContainer(
                            istap: widget.homeScreenController.isTabTapped[3],
                            icon: Icons.invert_colors,
                          )),
                    ],
                  ))
                
            
          ],
        ),
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
