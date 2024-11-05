import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0.9, end: 0.3).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
    animation2 = Tween<double>(begin: 0.8, end: 0.03).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    controller.forward();
    controller.addListener(() {
      setState(() {
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else if (controller.status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF89216B),
            Color(0xFFDA4453),
          ],
          begin: Alignment(0.3, -1),
          end: Alignment(-0.8, 1),
        ),
      ),
      child: Center(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Transform.rotate(
                angle: animation2.value,
                child: Transform(
                  alignment: Alignment.topLeft,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateY(0.3),
                  child: Container(
                    height: 240,
                    width: 250,
                    margin: const EdgeInsets.only(right: 120, left: 70),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFF8E1).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..rotateY(animation.value),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 300,
                          width: 500,
                          padding: const EdgeInsets.only(left: 50),
                          margin: const EdgeInsets.only(right: 50),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE0A3F9),
                                Color(0xFFF9D4A3),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    '"DREAM BIG\nWORK HARD\nSTAY HUMBLE"',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                  Positioned(
                                    left: 2,
                                    top: 2,
                                    child: Text(
                                      '"DREAM BIG\nWORK HARD\nSTAY HUMBLE"',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.3)),
                                    ),
                                  ),
                                  Text(
                                    '"DREAM BIG\nWORK HARD\nSTAY HUMBLE"',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: const Offset(2, 5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                margin: const EdgeInsets.only(top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    customcontainer(
                                      height: 20,
                                      width: 20,
                                    ),
                                    customcontainer(
                                      height: 20,
                                      width: 30,
                                    ),
                                    customcontainer(
                                      height: 20,
                                      width: 40,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'BY ZEESHAN\nFollow for more',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(2, 5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -90,
                          left: 70,
                          child: Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/1.png')),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }

  Widget customcontainer({
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey.shade300,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(2, 5),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            blurRadius: 10,
            offset: const Offset(-2, -5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
