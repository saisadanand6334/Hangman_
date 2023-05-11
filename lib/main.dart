import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const game()));
}

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  @override
  Widget build(BuildContext context) {
    return Splesh();
  }
}

class Splesh extends StatefulWidget {
  const Splesh({Key? key}) : super(key: key);

  @override
  State<Splesh> createState() => _SpleshState();
}

class _SpleshState extends State<Splesh> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Color(0xff004699),
        duration: 3000,
        splash: "images/cover.jpeg",
        splashIconSize: 200,
        nextScreen: hangman());
  }
}

class hangman extends StatefulWidget {
  const hangman({Key? key}) : super(key: key);

  @override
  State<hangman> createState() => _hangmanState();
}

class _hangmanState extends State<hangman> {
  CountDownController _controller = CountDownController();

  int count = 0;
  int ennam = 0;

  bool head = false;
  bool body = false;
  bool hang = false;
  bool la = false;
  bool ll = false;
  bool ra = false;
  bool rl = false;

  bool j1 = false;
  bool j2 = false;
  bool j3 = false;
  bool j4 = false;
  bool j5 = false;
  bool j6 = false;
  bool j7 = false;

  void alrt() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Game Over",
      desc: "Better Luck Next Time",
      onWillPopActive: true,
      buttons: [
        DialogButton(
          child: Text(
            "New Game",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => hangman(),
              )),
          width: 120,
        )
      ],
    ).show();
  }

  void alart() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Winner",
      desc: "Congragulations",
      onWillPopActive: true,
      buttons: [
        DialogButton(
          child: Text(
            "New Game",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => hangman(),
              )),
          width: 120,
        )
      ],
    ).show();
  }

  design(String a) {
    return InkWell(
      onTap: () {
        setState(() {
          setState(() {
            if (a == 'C') {
              j1 = true;
              j4 = true;
              ennam = ennam + 1;
              if (ennam == 7) {
                alart();
              }
            } else if (a == 'R') {
              j2 = true;
              ennam = ennam + 1;
              if (ennam == 7) {
                alart();
              }
            } else if (a == 'I') {
              j3 = true;
              ennam = ennam + 1;
              if (ennam == 7) {
                alart();
              }
            } else if (a == 'K') {
              j5 = true;

              ennam = ennam + 2;
              if (ennam == 7) {
                alart();
              }
            } else if (a == 'E') {
              j6 = true;
              ennam = ennam + 1;
              if (ennam == 7) {
                alart();
              }
            } else if (a == 'T') {
              j7 = true;
              ennam = ennam + 1;
              if (ennam == 7) {
                alart();
              }
            } else {
              count = count + 1;
              if (count == 1) {
                head = true;
              } else if (count == 2) {
                body = true;
              } else if (count == 3) {
                hang = true;
              } else if (count == 4) {
                la = true;
              } else if (count == 5) {
                ll = true;
              } else if (count == 6) {
                ra = true;
              } else if (count == 7) {
                rl = true;
                alrt();
              }
            }
          });
        });
      },
      child: Card(
        elevation: 2,
        color: Color(0xff3b6391),
        child: Center(
            child:
                Text(a, style: TextStyle(color: Colors.white, fontSize: 30))),
      ),
    );
  }

  letter(String a, bool k) {
    return Card(
      elevation: 2,
      color: Color(0xff3b6391),
      child: Center(
          child: Visibility(
              visible: k,
              child: Text(a,
                  style: TextStyle(color: Colors.white, fontSize: 30)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004699),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircularCountDownTimer(
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 10,
                  duration: 30,
                  fillColor: Colors.amber,
                  ringColor: Colors.white,
                  controller: _controller,
                  backgroundColor: Colors.white54,
                  strokeWidth: 3.0,
                  strokeCap: StrokeCap.round,
                  isTimerTextShown: true,
                  isReverse: true,
                  textStyle:
                      const TextStyle(fontSize: 17.0, color: Colors.black),
                  onComplete: () {
                    alrt();
                  },
                ),
              ),
              Center(
                child: Container(
                  width: 220,
                  height: 220,
                  child: Stack(
                    children: [
                      Visibility(
                          visible: body,
                          child: Image(image: AssetImage('images/body.png'))),
                      Visibility(
                          visible: head,
                          child: Image(image: AssetImage('images/head.png'))),
                      Visibility(
                          visible: la,
                          child: Image(image: AssetImage('images/la.png'))),
                      Visibility(
                          visible: ll,
                          child: Image(image: AssetImage('images/ll.png'))),
                      Visibility(
                          visible: ra,
                          child: Image(image: AssetImage('images/ra.png'))),
                      Visibility(
                          visible: rl,
                          child: Image(image: AssetImage('images/rl.png'))),
                      Visibility(
                          visible: hang,
                          child: Image(image: AssetImage('images/hang.png'))),
                    ],
                  ),
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 7,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: [
                  letter('C', j1),
                  letter('R', j2),
                  letter('I', j3),
                  letter('C', j4),
                  letter('K', j5),
                  letter('E', j6),
                  letter('T', j7),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 6,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1 / 1,
                  children: [
                    design('A'),
                    design('B'),
                    design('C'),
                    design('D'),
                    design('E'),
                    design('F'),
                    design('G'),
                    design('H'),
                    design('I'),
                    design('J'),
                    design('K'),
                    design('L'),
                    design('M'),
                    design('N'),
                    design('O'),
                    design('P'),
                    design('Q'),
                    design('R'),
                    design('S'),
                    design('T'),
                    design('U'),
                    design('V'),
                    design('W'),
                    design('X'),
                    design('Y'),
                    design('Z'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
