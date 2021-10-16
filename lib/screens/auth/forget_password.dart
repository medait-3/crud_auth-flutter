import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:workos_arabic/screens/auth/signup.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TextEditingController _forgetPasswordController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _animationController.dispose();
    _forgetPasswordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void _forgetpasswordFCT() {
    // print('_forgetPasswordController.text ${_forgetPasswordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Colors.red,
        body: Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
             "https://images.unsplash.com/photo-1634317069738-b1a80f60b93b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80",
             placeholder: (context, url) => Image.asset(
            'assets/images/wallpaper.jpg',
            fit: BoxFit.fill,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          alignment: FractionalOffset(_animation.value, 0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                'Forget password',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email adress',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextField(
                  controller: _forgetPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink.shade700),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                onPressed: _forgetpasswordFCT,
                color: Colors.redAccent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide.none),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Reset now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
