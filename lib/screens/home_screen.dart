import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/model/game_model.dart';
import 'package:flutter_game_shop/screens/detail_screen.dart';

enum Category { racing, stragy, baby, other }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Enum enumStatus = Category.racing;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopSectionFunction(),
            const SizedBox(height: 10),
            SearchBarFunction(),
            const SizedBox(height: 15),
            CategorySectionFunction(),
            const SizedBox(height: 15),
            TrendingSection(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Games',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'see all',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: GameModel.gameModelList.length,
              itemBuilder: (context, index) {
                final helper = GameModel.gameModelList[index];
                return NewGamesItemWidget(helper: helper);
              },
            ),
          ],
        ),
      ),
    );
  }

  Column TrendingSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'see all',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        //for(int index=0; index<=GameModel.gameModelList.length;index++)
        Container(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: GameModel.gameModelList.length,
            itemBuilder: (context, index) {
              return TrendingItemWidget(index: index);
            },
          ),
        ),
      ],
    );
  }

  Container CategorySectionFunction() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryFunction(
                  title: 'Racing',
                  icon: Icons.car_crash,
                  primaryColor: enumStatus == Category.racing
                      ? primaryColor
                      : Colors.grey.shade800,
                  background: enumStatus == Category.racing
                      ? Colors.red.shade100
                      : Colors.grey.shade200,
                  function: () {
                    setState(() {
                      enumStatus = Category.racing;
                    });
                  },
                ),
                CategoryFunction(
                  title: 'Stratgy',
                  icon: Icons.castle,
                  primaryColor: enumStatus == Category.stragy
                      ? primaryColor
                      : Colors.grey.shade800,
                  background: enumStatus == Category.stragy
                      ? Colors.red.shade100
                      : Colors.grey.shade200,
                  function: () {
                    setState(() {
                      enumStatus = Category.stragy;
                    });
                  },
                ),
                CategoryFunction(
                  title: 'baby',
                  icon: Icons.child_care,
                  primaryColor: enumStatus == Category.baby
                      ? primaryColor
                      : Colors.grey.shade800,
                  background: enumStatus == Category.baby
                      ? Colors.red.shade100
                      : Colors.grey.shade200,
                  function: () {
                    setState(() {
                      enumStatus = Category.baby;
                    });
                  },
                ),
                CategoryFunction(
                  title: 'others',
                  icon: Icons.more_horiz,
                  primaryColor: enumStatus == Category.other
                      ? primaryColor
                      : Colors.grey.shade800,
                  background: enumStatus == Category.other
                      ? Colors.red.shade100
                      : Colors.grey.shade200,
                  function: () {
                    setState(() {
                      enumStatus = Category.other;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell CategoryFunction({
    required String title,
    required IconData icon,
    required Function function,
    required Color primaryColor,
    required Color background,
  }) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 26,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container SearchBarFunction() {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey.shade800,
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(
                'Search Games',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.grey.shade800,
          )
        ],
      ),
    );
  }

  Row TopSectionFunction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          // width: 50,
          // height: 50,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(250),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(250),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '2365',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NewGamesItemWidget extends StatelessWidget {
  const NewGamesItemWidget({
    super.key,
    required this.helper,
  });

  final GameModel helper;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  helper.coverImage,
                  width: 175,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      helper.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      helper.category,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.5, vertical: 2.5),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orange),
                              const SizedBox(width: 5),
                              Text(
                                helper.score,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CustomElevetedButton(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingItemWidget extends StatelessWidget {
  const TrendingItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              gameModel: GameModel.gameModelList[index],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                GameModel.gameModelList[index].coverImage,
                width: 180,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 180,
                    height: 130,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GameModel.gameModelList[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          GameModel.gameModelList[index].category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 28,
                                ),
                                Text(
                                  GameModel.gameModelList[index].score,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const CustomElevetedButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: const Text(
        'Install',
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
