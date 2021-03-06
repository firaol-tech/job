import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techino_app/mainScreen.dart';
import 'package:techino_app/intro/utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFff8a00) : Color(0xFFb7b3bb),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFFf9ebda),
                Color(0xFFf9ebda),
                Color(0xFFf9ebda),
                Color(0xFFf9ebda),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFFff8a00),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/deal.png',
                                ),
                                height: 200.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Connect people\naround the world',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/joboffers.png',
                                ),
                                height: 200.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Live your life smarter\nwith us!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/Hiring.png',
                                ),
                                height: 200.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Get a new experience\nof imagination',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 7),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Color(0xFFff8a00),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Color(0xFFff8a00),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xFFff8a00),
                                      size: 15.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              color: Color(0xFFf9ebda),
              height: 50.0,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xFFff8a00),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return MainScreen();
                          }),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 1.0),
                          child: Text(
                            'Get started',
                            style: TextStyle(
                              color: Color(0xFFff8a00),
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Text(''),
    );
  }
}
