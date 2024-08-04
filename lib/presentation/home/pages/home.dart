import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotidupe/common/helpers/is_dark_mode.dart';
import 'package:spotidupe/common/widgets/appbar/app_bar.dart';
import 'package:spotidupe/core/configs/assets/app_images.dart';
import 'package:spotidupe/core/configs/assets/app_vectors.dart';
import 'package:spotidupe/core/configs/theme/app_colors.dart';
import 'package:spotidupe/presentation/home/widgets/news_songs.dart';
import 'package:spotidupe/presentation/profile/pages/profile.dart';

import '../widgets/play_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage()));
            },
            icon: const Icon(Icons.person)),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 10,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _homeTopCard(),
                // _tabs(),
                const SizedBox(
                  height: 50,
                ),

                // _tabs(),
                SizedBox(
                  height: 260,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      const NewsSongs(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
            const PlayList()
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeTopCard),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(AppImages.homeArtist),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context)
          .size
          .width, // Ensure the TabBar takes up the full width
      child: TabBar(
        controller: _tabController,
        isScrollable: false, // Set to false to center tabs evenly
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        tabs: const [
          Tab(
            child: Center(
              child: Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                'Videos',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                'Artists',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
          Tab(
            child: Center(
              child: Text(
                'Podcasts',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
