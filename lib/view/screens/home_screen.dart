import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:flowers/view/widgets/app_style.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../model/Filters_model.dart';
import '../../model/cart_model.dart';
import '../../model/rive_asset.dart';
import '../../model/rive_utila.dart';
import '../../view_model/flower_item_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userChoice = "";
  final controller = GroupButtonController();
  int status = 0;
  List<RiveAsset> bottomNavs = [
    RiveAsset("assets/RiveAssets/icon.riv",
        title: "HOME", artboard: "HOME", stateMachinName: "HOME_interactivity"),
    RiveAsset("assets/RiveAssets/icon.riv",
        title: "STAR",
        artboard: "LIKE/STAR",
        stateMachinName: "STAR_Interactivity"),
    RiveAsset("assets/RiveAssets/icon.riv",
        title: "BELL", artboard: "BELL", stateMachinName: "BELL_Interactivity"),
    RiveAsset("assets/RiveAssets/icon.riv",
        title: "USER", artboard: "USER", stateMachinName: "USER_Interactivity"),
  ];
  @override
  Widget build(BuildContext context) {
    final _inputController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        // scale: 50,
                        width: 80,
                        height: 80,
                      ),
                      Expanded(
                          child: Text(
                        "Bloomina",
                        style: mOswaldBold.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      )),
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/Muqtada.jpg"),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ])
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 5,
          ),
          decoration: const BoxDecoration(
              color: Color(0xff181f39),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                        onTap: (() {
                          bottomNavs[index].input!.change(true);
                        }),
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            bottomNavs.first.src,
                            artboard: bottomNavs[index].artboard,
                            onInit: (artboard) {
                              StateMachineController controller =
                                  RiveUtils.getRiveController(artboard,
                                      StateMachine:
                                          bottomNavs[index].stateMachinName);
                              bottomNavs[index].input =
                                  controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ))
            ],
          ),
        ),
      ),

      // body
      body: SafeArea(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Flowers",
                      style: mOswaldBold.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Choose the best bouquet for your beloved",
                      style: mOswaldBold.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        icon: const FaIcon(FontAwesomeIcons.search),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle:
                            mOswaldBold.copyWith(color: Colors.grey[400]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: BuildFilters().filtersItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            child: TextButton(
                              child: Text(
                                BuildFilters().filtersItems[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: status == index
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: status == index
                                    ? const Color(0xff181f39)
                                    : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  status = index;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FlowerItemTitle(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
