import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

// import 'package:vibration/vibration.dart';



class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  bool istap= false;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void resetCounter() {
    setState(() {
      count = 0;
    });
  }

  void removeOneCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Text(
                        '$count',
                        style: const TextStyle(fontSize: 50.0),
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
                            removeOneCount();
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
                            resetCounter();
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
                    onTap: () {
                      incrementCounter();
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _vibrate();
                         setState(() {
                           istap=true;
                         });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: istap? Colors.yellow: Colors.grey,
                        ),
                        child: const Icon(Icons.volume_up_outlined),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: const Icon(Icons.vibration),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: const Icon(Icons.record_voice_over),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: const Icon(Icons.vibration),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: const Icon(Icons.vibration),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );

  }
   void _vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      // Check if the device has a vibrator
      Vibration.vibrate();
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          istap = false;
        });
      });
    } else {
      // Handle the case where vibration is not supported
      print('Vibration is not supported on this device.');
    }
  }
}
