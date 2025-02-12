import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home_view.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

// SingleTickerProviderStateMixin : Control the animation (identiy when making refresh? when values appear?)
class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
/* AnimationController output value between 0 and 1 , i want to modify this value to be in a suitable format
 using make an animation and name it sliding animation (name of animation i will do)*/

// initState : provides a place to initialize animation controllers, ideal because it called only once
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }

  // you must make dispose with any controller to prevent lack in memory
  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment
            .center, // stretch child to fill all the available space
        children: [
          Image.asset(
            AssetsData.logo,
          ),
          /* SlideTransition to make animation on the text
             animation builder to update UI for the text only , instead of using setState and update all UI
             SlidingText : widget i made about extract widget */
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    /* this : he takes SingleTickerProviderStateMixin as a parameter
     druation : the time for Animation */
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    /* inside Tween : i identify the values , i want him to appear instead of 0,1 outputs from animationController
       Offset : the value cames from animationController you will output them as an Offset */
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);

    /* forward : to start animation from the current value to end value
       repeat : repeats the animation
       reset : reset the animation but you need to call forward after reset to start */
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted)
        return; // Ensure widget is still in the tree before using context
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }
}
