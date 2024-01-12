import 'package:final_project/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate an asynchronous operation, such as loading data or initializing the app.
    // You can replace this with your actual initialization logic.
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your logo image here
                    Image.asset('assets/images/logo.jpg', width: 100, height: 100),
                    const SizedBox(height: 20),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : const LoginView(),
        // Replace MainApp() with your main application screen
      ),
    );
  }
}
