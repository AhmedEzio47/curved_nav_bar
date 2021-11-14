import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Curved Navigation Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Salma'),
          );
        },
        itemCount: 20,
      ),
      bottomNavigationBar: const BNB(),
    );
  }
}

class BNB extends StatelessWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: CustomPaint(
                painter: NavBarPainter(),
                size: const Size(double.infinity, 100),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        Center(
          heightFactor: 1.5,
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 5,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.qr_code),
          ),
        ),
        Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 35,
              ),
              SizedBox(
                width: 1,
              ),
              Icon(
                Icons.airplane_ticket_outlined,
                size: 35,
              )
            ],
          ),
        )
      ],
    );
  }
}

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * .275);
    path.lineTo(size.width * .3, size.height * .275);

    path.quadraticBezierTo(size.width * .36, size.height * .275,
        size.width * .4, size.height * .1375);

    path.quadraticBezierTo(size.width * .5, size.height * -.25, size.width * .6,
        size.height * .1375);

    path.quadraticBezierTo(size.width * .64, size.height * .275,
        size.width * .7, size.height * .275);

    path.lineTo(size.width, size.height * .275);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();
    canvas.drawShadow(path, Colors.black, 2.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
