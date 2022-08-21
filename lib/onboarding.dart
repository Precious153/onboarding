
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>{
  late PageController _pageController;

  int selectedIndex = 0;

  @override
  void initState(){
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right:34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    _pageController.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.linear);
                  },
                      child:  Text('SKIP',
                        style: TextStyle(
                            color: Colors.black
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardingContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description:demo_data[index].description ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedIndex == 0 ? '1/3' : selectedIndex == 1 ? '2/3' : '3/3 ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                GestureDetector(
                  onTap: (){
                    _pageController.nextPage( duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_circle_right_outlined,size: 50,
                    ),
                  ),
                ),
                ],
              ),
            )
          ],
        ),

      ),

    );
  }
}
class OnBoard{
  final String image, title,description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description});
}
final  List<OnBoard> demo_data =[
  OnBoard(
      image: "assets/time.json",
      title: "Choose A Tasty",
      description: "When you order Eat Street , \nwe\'ll hook you up with exclusive \ncoupons." ),
  OnBoard(
      image: "assets/food.json",
      title: "Discover Places",
      description: "We make it simple to find the \nfood you crave. Enter your \naddress and let"),
  OnBoard(
      image: "assets/interaction.json",
      title: "Pick Up Or",
      description: 'We make food ordering fast ,\n simple and free - no matter if you \norder' ),
];

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String  image, title,description ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Lottie.asset(
          image,
          // height:279,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign:TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign:TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }
}