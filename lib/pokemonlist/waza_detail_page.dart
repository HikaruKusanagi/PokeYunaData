import 'package:flutter/material.dart';

class WazaPage1 extends StatelessWidget {

  final String damagelv1;
  final String damagelv2;
  final String damagelv3;


  const WazaPage1({Key? key,

    required this.damagelv1,
    required this.damagelv2,
    required this.damagelv3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [

        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    damagelv1,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            color: Colors.blue,
                          ),
                          Text(
                            damagelv2,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            damagelv3,
                            style: const TextStyle(fontSize: 20,
                              color: Colors.red,),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class WazaPage1A extends StatelessWidget {

  final String damage1lv4;
  final String damage1lv5;
  final String damage1lv6;


  const WazaPage1A({Key? key,

    required this.damage1lv4,
    required this.damage1lv5,
    required this.damage1lv6,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [

        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                damage1lv4,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    damage1lv5,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    damage1lv6,
                    style: const TextStyle(fontSize: 20,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class WazaPage1B extends StatelessWidget {

  final String damage4;
  final String damage3lv5;
  final String damage3lv6;


  const WazaPage1B({Key? key,

    required this.damage4,
    required this.damage3lv5,
    required this.damage3lv6,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Column(
          children: const [
          ],
        ),
        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                damage4,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    damage3lv5,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    damage3lv6,
                    style: const TextStyle(fontSize: 20,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class WazaPage2 extends StatelessWidget {

  final String damage6lv1;
  final String damage6lv2;
  final String damage6lv3;


  const WazaPage2({Key? key,

    required this.damage6lv1,
    required this.damage6lv2,
    required this.damage6lv3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Column(
          children: const [

          ],
        ),
        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                damage6lv1,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    damage6lv2,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    damage6lv3,
                    style: const TextStyle(fontSize: 20,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class WazaPage2A extends StatelessWidget {

  final String damage7lv4;
  final String damage7lv5;
  final String damage7lv6;


  const WazaPage2A({Key? key,

    required this.damage7lv4,
    required this.damage7lv5,
    required this.damage7lv6,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Column(
          children: const [

          ],
        ),
        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                damage7lv4,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    damage7lv5,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    damage7lv6,
                    style: const TextStyle(fontSize: 20,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class WazaPage2B extends StatelessWidget {

  final String damage9lv6;
  final String damage9lv7;
  final String damage9lv8;


  const WazaPage2B({Key? key,

    required this.damage9lv6,
    required this.damage9lv7,
    required this.damage9lv8,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Column(
          children: const [
        ]),
        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                damage9lv6,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.blue,
                  ),
                  Text(
                    damage9lv7,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    damage9lv8,
                    style: const TextStyle(fontSize: 20,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class UniteWazaPage extends StatelessWidget {

  final String damage10lv9;
  final String damage10lv10;
  final String damage10lv11;


  const UniteWazaPage({Key? key,

    required this.damage10lv9,
    required this.damage10lv10,
    required this.damage10lv11,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        Column(
          children: const [
          ],
        ),
        const SizedBox(width: 10),
        SingleChildScrollView(
          child: Column(
            children: [
              Text(
                damage10lv9,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    damage10lv11,
                    style: const TextStyle(fontSize: 20,
                      color: Colors.red,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}