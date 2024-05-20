import 'dart:math';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasbihapp/core/getx/homescreenget.dart';
import 'package:tasbihapp/presentation/UI/homescreen/reusablewidget/alertdialog.dart';
import 'package:tasbihapp/presentation/UI/homescreen/reusablewidget/customalertdialog.dart';
import 'package:tasbihapp/presentation/UI/homescreen/reusablewidget/tabbarContainer.dart';

// import 'package:vibration/vibration.dart';

class CounterScreen extends StatefulWidget {
  String values = '';
  int? loop;
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  void updateValue(String value) {
    setState(() {
      widget.values = value;
    });
  }
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
      () => Scaffold(
        backgroundColor: widget.homeScreenController.containerColor.value,
        appBar: AppBar(
          title: Column(
            children: [
              const Text('Tasbih Lite'),
              Text("Remindar :${widget.homeScreenController.reminder.value}"),
            ],
          ),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: _containerColor,

                    color: Colors.white,
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
                                showResetConfirmationDialog(
                                    context,
                                    "Reset Counter",
                                    "Are you sure to reset the count?", () {
                                  widget.homeScreenController.resetCounter();
                                });
                                // widget.homeScreenController.resetCounter();
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
                          if (widget.homeScreenController.count.value ==
                              int.parse(
                                  widget.homeScreenController.reminder.value)) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Goal Reached'),
                                  content: Text(
                                      'Congratulations! You have reached your goal.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          // else
                          // {
                          //   print("Not selected");
                          // }
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            color: const Color(0xFFEFEEEE),
      //  borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.1),
                                  offset: const Offset(-6.0, -6.0),
                                  blurRadius: 16.0,
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(6.0, 6.0),
                                  blurRadius: 16.0,
                                ),
                              ]),
                          // child: Icon(Icons.add,size: 26,
                          // weight: 2),
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
                          //  _vibrate();
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
                            showDialog(
                              context: context,
                              builder: (context) {
                                return MyAlertDialog(
                                  onvalueEntered: updateValue,
                                  homeScreenController:
                                      widget.homeScreenController,
                                );
                              },
                            );
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
      ),
    );
  }
}
