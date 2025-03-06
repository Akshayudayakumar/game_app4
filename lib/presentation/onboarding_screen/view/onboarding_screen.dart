import 'package:flutter/material.dart';
import 'package:game_app/core/constants/colors.dart';
import 'package:game_app/core/constants/global_text_style.dart';
import 'package:game_app/presentation/registration_page/view/registration_screen.dart';

import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/onboarding/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          pages: [
            PageViewModel(
                title: "Learn More",
                body:
                    "Discover the joy of learning English with our app, where each word learned opens new doors to opportunities and connections.",
                image: Image.asset("assets/onboarding/onboarding1.png",
                    height: MediaQuery.of(context).size.width - 40,
                    width: MediaQuery.of(context).size.width - 40),
                decoration: PageDecoration(
                    titleTextStyle: GlobalTextStyles.secondTittle,
                    bodyTextStyle: GlobalTextStyles.subTitle1)),
            PageViewModel(
                title: "It’s gamified!",
                body:
                    "Level up your English with our immersive games, designed to strengthen your language skills and make learning a rewarding adventure.",
                image: Image.asset("assets/onboarding/onboarding2.png",
                    height: MediaQuery.of(context).size.width - 40,
                    width: MediaQuery.of(context).size.width - 40),
                decoration: PageDecoration(
                    titleTextStyle: GlobalTextStyles.secondTittle,
                    bodyTextStyle: GlobalTextStyles.subTitle1)),
            PageViewModel(
                title: "Take learning beyond the classroom walls",
                body:
                    "Extend your learning journey with us beyond traditional classroom boundaries.",
                image: Image.asset("assets/onboarding/onboarding3.png",
                    height: MediaQuery.of(context).size.width - 40,
                    width: MediaQuery.of(context).size.width - 40),
                decoration: PageDecoration(
                    titleTextStyle: GlobalTextStyles.secondTittle,
                    bodyTextStyle: GlobalTextStyles.subTitle1)),
          ],
          next: Text(
            "",
            style: TextStyle(
                color: ColorTheme.maincolor,
                fontSize: size * 18,
                fontWeight: FontWeight.bold),
          ),
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: GlobalTextStyles.subTitle1,
          ),
          done: Text(
            "Start",
            style: GlobalTextStyles.subTitle1,
          ),
          onDone: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RegistrationScreen())),
          onSkip: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RegistrationScreen())),
          dotsDecorator: DotsDecorator(
            size: Size(0, 0),
            spacing: EdgeInsets.all(size * 10),
            activeSize: Size(size * 30, size * 10),
            color: ColorTheme.secondarycolor,
            activeColor: ColorTheme.maincolor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size * 60)),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:gaming_app/core/constants/colors.dart';
// import 'package:gaming_app/core/constants/global_text_style.dart';
// import 'package:gaming_app/presentation/registration_page/view/registration_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class OnboardingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double size = constantsize(context);
//     return SafeArea(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/onboarding/background.png"),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Expanded(
//           child: IntroductionScreen(
//             globalBackgroundColor: Colors.transparent,
//             pages: [
//               PageViewModel(
//                   title: "Learn More",
//                   body:
//                       "Discover the joy of learning English with our app, where each word learned opens new doors to opportunities and connections.",
//                   image: Image.asset("assets/onboarding/onboarding1.png",
//                       height: MediaQuery.of(context).size.width - 40,
//                       width: MediaQuery.of(context).size.width - 40),
//                   decoration: PageDecoration(
//                       titleTextStyle: GlobalTextStyles.secondTittle,
//                       bodyTextStyle: GlobalTextStyles.subTitle1)),
//               PageViewModel(
//                   title: "It’s gamified!",
//                   body:
//                       "Level up your English with our immersive games, designed to strengthen your language skills and make learning a rewarding adventure.",
//                   image: Image.asset("assets/onboarding/onboarding2.png",
//                       height: MediaQuery.of(context).size.width - 40,
//                       width: MediaQuery.of(context).size.width - 40),
//                   decoration: PageDecoration(
//                       titleTextStyle: GlobalTextStyles.secondTittle,
//                       bodyTextStyle: GlobalTextStyles.subTitle1)),
//               PageViewModel(
//                   title: "Take learning beyond the classroom walls",
//                   body:
//                       "Extend your learning journey with us beyond traditional classroom boundaries.",
//                   image: Image.asset("assets/onboarding/onboarding3.png",
//                       height: MediaQuery.of(context).size.width - 40,
//                       width: MediaQuery.of(context).size.width - 40),
//                   decoration: PageDecoration(
//                       titleTextStyle: GlobalTextStyles.secondTittle,
//                       bodyTextStyle: GlobalTextStyles.subTitle1)),
//             ],
//             next: Text(
//               "",
//               style: TextStyle(
//                   color: ColorTheme.maincolor,
//                   fontSize: size * 18,
//                   fontWeight: FontWeight.bold),
//             ),
//             showSkipButton: true,
//             skip: Text(
//               "Skip",
//               style: GlobalTextStyles.subTitle1,
//             ),
//             done: Text(
//               "Start",
//               style: GlobalTextStyles.subTitle1,
//             ),
//             onDone: () => Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => RegistrationScreen())),
//             onSkip: () => Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => RegistrationScreen())),
//             dotsDecorator: DotsDecorator(
//               size: Size(0, 0),
//               spacing: EdgeInsets.all(size * 10),
//               activeSize: Size(size * 30, size * 10),
//               color: ColorTheme.secondarycolor,
//               activeColor: ColorTheme.maincolor,
//               activeShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(size * 60)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//}