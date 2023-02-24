import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:notepad/pages/first_page.dart';

import '../models/welcome_model.dart';
import '../widget/text_widget.dart';

class FirstImage extends StatefulWidget {
  const FirstImage({Key? key}) : super(key: key);

  @override
  State<FirstImage> createState() => _FirstImageState();
}

class _FirstImageState extends State<FirstImage> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 300), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sWidth = size.width;
    var sHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: sWidth * 0.5,
          height: sHeight * 0.5,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sWidth = size.width;
    var sHeight = size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff2A135A),
          body: SizedBox(
            width: sWidth,
            height: sHeight,
            child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index.toInt() == 2) {
                    return Column(
                      children: [
                        closebtn(sWidth),
                        Expanded(child: Container()),
                        SizedBox(
                          height: sHeight * 0.8,
                          child: Stack(
                            children: [
                              FadeInUp(
                                delay: const Duration(milliseconds: 100),
                                child: Column(
                                  children: [
                                    Expanded(child: Container()),
                                    Container(
                                      width: sWidth,
                                      height: sHeight * 0.62,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment(0, 2),
                                            colors: <Color>[
                                              Color(0xffC4189B),
                                              Color(0xff01B5DA),
                                            ],
                                            tileMode: TileMode.mirror,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            topRight: Radius.circular(18),
                                          )),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: sHeight * 0.32,
                                            ),
                                            const AppText(
                                                text: "Welcome...",
                                                size: 25,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: sHeight * 0.03,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FadeInDown(
                                  delay: const Duration(milliseconds: 100),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/3.png',
                                          width: sWidth * 1.3,
                                          height: sHeight * 0.5,
                                        ),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                left: 50,
                                bottom: sWidth * 0.02 + 55,
                                width: sWidth,
                                child: FadeInUp(
                                  delay: const Duration(milliseconds: 100),
                                  child: Row(
                                    children: List.generate(
                                      3,
                                      (indexDots) => GestureDetector(
                                        onTap: () {
                                          pageController.animateToPage(
                                            indexDots,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear,
                                          );
                                        },
                                        child: AnimatedContainer(
                                          margin: EdgeInsets.only(
                                              right: size.width * 0.01,
                                              bottom: size.height * 0.008),
                                          width: 22,
                                          height: 22,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: index == indexDots
                                                  ? const Color(0xff35226C)
                                                  : Colors.transparent,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff35226C),
                                                  width: 3)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: sWidth * 0.06,
                                bottom: sWidth * 0.02 + 50,
                                width: sWidth * .42,
                                child: GestureDetector(
                                  onTap: () {
                                    pageController.animateToPage(
                                      pageController.page!.toInt() + 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: FadeInUp(
                                    delay: const Duration(milliseconds: 100),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(new FirstPageRoute());

                                      },
                                      child: Container(
                                        width: sWidth * 0.4,
                                        height: sHeight * 0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xff2A135A),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: sWidth * 0.08),
                                              child: Center(
                                                child: AppText(
                                                    text: "Get Started",
                                                    size: sWidth * 0.05,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    WelcomeModel current = welcomeComponents[index];
                    return Column(
                      children: [
                        closebtn(sWidth),
                        Expanded(child: Container()),
                        SizedBox(
                          height: sHeight * .8,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Expanded(child: Container()),
                                  FadeInUp(
                                    delay: const Duration(milliseconds: 100),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      width: sWidth,
                                      height: sHeight * 0.6,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment(0, 2),
                                            colors: <Color>[
                                              Color(0xffC4189B),
                                              Color(0xff01B5DA),
                                            ],
                                            tileMode: TileMode.mirror,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(140),
                                            bottomLeft: Radius.circular(50),
                                            bottomRight: Radius.circular(8),
                                          )),
                                      child: Center(
                                        child: FadeInUp(
                                          delay:
                                              const Duration(milliseconds: 100),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: sHeight * 0.19,
                                              ),
                                              AppText(
                                                  text: current.title,
                                                  size: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              SizedBox(
                                                height: sHeight * 0.03,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Wrap(children: [
                                                  AppText(
                                                      text: current.description,
                                                      size: 13,
                                                      color: const Color(
                                                          0xffDEDEDE),
                                                      fontWeight:
                                                          FontWeight.w600)
                                                ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: sHeight * 0.46,
                                left: current.posleft,
                                child: FadeInLeft(
                                    delay: const Duration(milliseconds: 100),
                                    child: Image.asset(current.imageUrl)),
                              ),
                              Positioned(
                                left: 50,
                                bottom: sHeight * 0.02,
                                child: FadeInUp(
                                  delay: const Duration(milliseconds: 100),
                                  child: Row(
                                    children: List.generate(
                                      3,
                                      (indexDots) => GestureDetector(
                                        onTap: () {
                                          pageController.animateToPage(
                                            indexDots,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear,
                                          );
                                        },
                                        child: AnimatedContainer(
                                          margin: EdgeInsets.only(
                                              right: size.width * 0.01,
                                              bottom: size.height * 0.008),
                                          width: 22,
                                          height: 22,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: index == indexDots
                                                  ? const Color(0xff35226C)
                                                  : Colors.transparent,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff35226C),
                                                  width: 3)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: sWidth * 0.06,
                                bottom: sHeight * 0.014,
                                child: GestureDetector(
                                  onTap: () {
                                    pageController.animateToPage(
                                      pageController.page!.toInt() + 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: FadeInUp(
                                    delay: const Duration(milliseconds: 100),
                                    child: Container(
                                      width: sWidth * 0.4,
                                      height: sHeight * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff2A135A),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 24.0),
                                            child: AppText(
                                                text: "Next",
                                                size: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 12.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        )
                      ],
                    );
                  }
                }),
          )),
    );


  }
  FadeInRight closebtn (sWidth){
    return FadeInRight(
      delay: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: () =>
            Timer(const Duration(milliseconds: 300), () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const FirstPage()));
            }),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 20),
          alignment: AlignmentDirectional.centerEnd,
          width: sWidth,
          child: Image.asset(
            'assets/images/close.png',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
