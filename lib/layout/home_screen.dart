import 'package:flutter/material.dart';
import 'package:flutterapp/Icons/custom_icons_icons.dart';
import 'package:flutterapp/Icons/custom_icons_icons2.dart';
import 'package:flutterapp/stories/story.dart';
import 'package:readmore/readmore.dart';
import '../models/users.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  late List<UserModel> users = [
    UserModel(
        image: "assets/home_screen/me.jpg",
        name: "A7mdlbanna"
    ),
    UserModel(
        image: "assets/home_screen/billie1.jpg",
        name: "billieeilish"
    ),
    UserModel(
        image: "assets/home_screen/ps.png",
        name: "photoshop_box")
  ];
  Widget BuildStoryItem(user, index) =>
      InkWell(
        onTap: () =>
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InstaStory(index: index,))
            ),
        child: Container(
          width: 72.8,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage:  AssetImage("assets/home_screen/storyaura.png"),
                    radius: 36.4,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 35,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(user.image),
                    radius: 32,
                  ),
                ],
              ),
              const SizedBox(height: 4,),
              Text(
                user.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
            ],
          ),
        ),
      );

  Widget BuildPostItem() =>
      Align(
        alignment: Alignment.topLeft,
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: Row(
                  children: const [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/home_screen/billie1.jpg"),
                        radius: 16,
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 4),
                      child: Text(
                        'billieeilish',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Icon(
                      Icons.verified,
                      size: 14,
                      color: Colors.blueAccent,
                    ),
                    Padding(padding: EdgeInsets.only(left: 196)),
                    Icon(Icons.more_vert_sharp),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      counter2++;
                    });
                    if (counter2 == 2) {
                      isPressed_heart = false;
                    }
                  },
                  child: Ink.image(
                    fit: BoxFit.cover, // Fixes border issues
                    width: 360,
                    height: 420,
                    image: const AssetImage("assets/home_screen/billie2.jpg"),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 1,
                    ),
                    child: IconButton(
                      icon: isPressed_heart
                          ? const Icon(
                        CustomIcons.heart,
                        color: Colors.white,
                        size: 23,
                      )
                          : const Icon(
                        CustomIcons.filledheart,
                        color: Colors.red,
                        size: 23,
                      ),
                      onPressed: () =>
                      {
                        setState(() {
                          isPressed_heart = !isPressed_heart;
                          counter2 = 0;
                        }),
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      CustomIcons.comment,
                      size: 33,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 13, top: 3),
                    child: Icon(
                      CustomIcons.share,
                      size: 21,
                    ),
                  ),
                  const SizedBox(
                    width: 190,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 1,
                    ),
                    child: IconButton(
                      icon: isPressed_save ? const Icon(
                        CustomIcons.save, size: 30,) : const Icon(
                        CustomIcons.savefilled2, size: 25,),
                      onPressed: () =>
                      {
                        setState(() {
                          isPressed_save = !isPressed_save;
                        }),
                      },
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  '3,163,026 likes',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'billieeilish',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                          text: ' @nike ',
                          style: TextStyle(
                            fontSize: 15, color: Colors.blue.shade100,)
                      ),
                      const TextSpan(
                          text: 'air force 1 and apparel collection',
                          style: TextStyle(fontSize: 15,)
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: ReadMoreText(
                  'are available now on store.billieeilish.com 🦋 so excited to share these pieces with you :)',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  colorClickableText: Colors.white60,
                  trimMode: TrimMode.Line,
                  trimLines: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 3),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'View all 8,923 comments',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12,),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: CircleAvatar(
                      backgroundImage: AssetImage("assets/home_screen/me.jpg"),
                      radius: 14,
                    ),
                    hintText: 'Add a comment...',
                  ),
                  showCursor: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, bottom: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '5 hours ago',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ]
        ),
      );

  int counter = 0;
  int counter2 = 0;

  bool isPressed_save = true;
  bool isPressed_save_post2 = true;

  bool isPressed_heart = true;
  bool isPressed_heart_post2 = true;

  bool isPressed_home = true;
  bool isPressed_search = false;
  bool isPressed_reels = false;
  bool isPressed_shop = false;
  bool isPressed_account = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        flexibleSpace:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const[
            SizedBox(width: 12,),
            Center(
              child: Text(
                "Instagram",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 37,
                  fontFamily: "instagram",),
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            CustomIcons.add,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            CustomIcons.heart,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 23,
          ),
          Icon(
            CustomIcons.dm,
            size: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 12,),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/home_screen/me.jpg"),
                            radius: 32,
                          ),
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 5,
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.blue,
                                  size: 22,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12,),
                      const Text(
                        'Your Story',
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 5, bottom: 5),
                    child: Container(
                      height: 97.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: users.length,
                        itemBuilder: (conrtext, index) =>
                            BuildStoryItem(users[index], index),
                        separatorBuilder: (context, index) =>
                        const SizedBox(width: 12,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //   Padding(
            //        padding: const EdgeInsets.only(left: 12, top: 5, bottom: 5),
            //        child: Container(
            //          width: 500,
            //          child: ListView.separated(
            //            shrinkWrap: true,
            //            scrollDirection: Axis.vertical,
            //            itemCount: 12,
            //            itemBuilder: (conrtext, index) => BuildPostItem(),
            //            separatorBuilder: (context, index) => const SizedBox(width: 12,),
            //          ),
            //        ),
            //      ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12),
              child: Row(
                children: const [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/home_screen/billie1.jpg"),
                      radius: 16,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 4),
                    child: Text(
                      'billieeilish',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Icon(
                    Icons.verified,
                    size: 14,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 198,),
                  Icon(Icons.more_vert_sharp),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    counter2++;
                  });
                  if (counter2 == 2) {
                    isPressed_heart = false;
                  }
                },
                child: Ink.image(
                  fit: BoxFit.cover, // Fixes border issues
                  width: 360,
                  height: 420,
                  image: const AssetImage("assets/home_screen/billie2.jpg"),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: IconButton(
                    icon: isPressed_heart
                        ? const Icon(
                      CustomIcons.heart,
                      color: Colors.white,
                      size: 23,
                    )
                        : const Icon(
                      CustomIcons.filledheart,
                      color: Colors.red,
                      size: 23,
                    ),
                    onPressed: () =>
                    {
                      setState(() {
                        isPressed_heart = !isPressed_heart;
                        counter2 = 0;
                      }),
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    CustomIcons.comment,
                    size: 33,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 13, top: 3),
                  child: Icon(
                    CustomIcons.share,
                    size: 21,
                  ),
                ),
                const SizedBox(
                  width: 190,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: IconButton(
                    icon: isPressed_save ? const Icon(
                      CustomIcons.save, size: 30,) : const Icon(
                      CustomIcons.savefilled2, size: 25,),
                    onPressed: () =>
                    {
                      setState(() {
                        isPressed_save = !isPressed_save;
                      }),
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                '3,163,026 likes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'billieeilish',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                        text: ' @nike ',
                        style: TextStyle(
                          fontSize: 15, color: Colors.blue.shade100,)
                    ),
                    const TextSpan(
                        text: 'air force 1 and apparel collection',
                        style: TextStyle(fontSize: 15,)
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: ReadMoreText(
                'are available now on store.billieeilish.com 🦋 so excited to share these pieces with you :)',
                style: TextStyle(fontSize: 15, color: Colors.white),
                colorClickableText: Colors.white60,
                trimMode: TrimMode.Line,
                trimLines: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 3),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'View all 8,923 comments',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12,),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: CircleAvatar(
                    backgroundImage: AssetImage("assets/home_screen/me.jpg"),
                    radius: 14,
                  ),
                  hintText: 'Add a comment...',
                ),
                showCursor: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '5 hours ago',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            //new post.....
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 12),
              child: Row(
                children: const [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/home_screen/ps.png"),
                      radius: 16,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 4),
                    child: Text(
                      'photoshop_box',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Icon(
                    Icons.verified,
                    size: 14,
                    color: Colors.blueAccent,
                  ),
                  Expanded(
                      child: SizedBox(
                        width: 5,
                      )),
                  Icon(Icons.more_vert_sharp),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                  if (counter == 2) isPressed_heart_post2 = false;
                },
                child: Ink.image(
                  fit: BoxFit.cover, // Fixes border issues
                  width: 350,
                  height: 420,
                  image: const AssetImage("assets/home_screen/pspost.webp"),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: IconButton(
                    icon: isPressed_heart_post2
                        ? const Icon(
                      CustomIcons.heart,
                      color: Colors.white,
                      size: 23,
                    )
                        : const Icon(
                      CustomIcons.filledheart,
                      color: Colors.red,
                      size: 23,
                    ),
                    onPressed: () =>
                    {
                      setState(() {
                        isPressed_heart_post2 = !isPressed_heart_post2;
                        counter = 0;
                      }),
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    CustomIcons.comment,
                    size: 33,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 13, top: 3),
                  child: Icon(
                    CustomIcons.share,
                    size: 21,
                  ),
                ),
                const SizedBox(
                  width: 190,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: IconButton(
                    icon: isPressed_save_post2
                        ? const Icon(
                      CustomIcons.save,
                      size: 30,
                    )
                        : const Icon(
                      CustomIcons.savefilled2,
                      size: 25,
                    ),
                    onPressed: () =>
                    {
                      setState(() {
                        isPressed_save_post2 = !isPressed_save_post2;
                      }),
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '35,614 likes',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 2),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'photoshop_box ',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: 'New ArtWork by ',
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    TextSpan(
                      text: '@slimshady',
                      style: TextStyle(
                        fontSize: 15, color: Colors.blue.shade100,),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'View all 2,654 comments',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 12,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: CircleAvatar(
                    backgroundImage: AssetImage("assets/home_screen/me.jpg"),
                    radius: 14,
                  ),
                  hintText: 'Add a comment...',
                ),
                showCursor: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 3),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2 days ago',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: ImageIcon(isPressed_home
                    ? const AssetImage("assets/home_screen/homefilled.png")
                    : const AssetImage("assets/home_screen/home.png"), size: 25,),
                onPressed: () =>
                {
                  setState(() {
                    isPressed_home = true;
                    isPressed_search = false;
                    isPressed_reels = false;
                    isPressed_shop = false;
                    isPressed_account = false;
                  }),
                },
              ),
              IconButton(
                icon: isPressed_search
                    ? const Icon(CustomIcons.search, size: 30)
                    : const Icon(CustomIcons2.search, size: 20),
                onPressed: () =>
                {
                  setState(() {
                    isPressed_home = false;
                    isPressed_search = true;
                    isPressed_reels = false;
                    isPressed_shop = false;
                    isPressed_account = false;
                  }),
                },
              ),
              IconButton(
                icon: isPressed_reels ? const ImageIcon(
                  AssetImage("assets/home_screen/reelsfilled2.png"),) : const Icon(
                    CustomIcons.reels, size: 21),
                onPressed: () =>
                {
                  setState(() {
                    isPressed_home = false;
                    isPressed_search = false;
                    isPressed_reels = true;
                    isPressed_shop = false;
                    isPressed_account = false;
                  }),
                },
              ),
              IconButton(
                icon: Icon(
                  isPressed_shop ? CustomIcons2.shopfilled : CustomIcons2.shop,
                  size: 24,
                ),
                onPressed: () =>
                {
                  setState(() {
                    isPressed_home = false;
                    isPressed_search = false;
                    isPressed_reels = false;
                    isPressed_shop = true;
                    isPressed_account = false;
                  }),
                },
              ),
              IconButton(
                icon: !isPressed_account ?
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/home_screen/me.jpg"),
                  radius: 14,
                )
                    : Stack(
                  children: const[
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/home_screen/me.jpg"),
                        radius: 14,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isPressed_home = false;
                    isPressed_search = false;
                    isPressed_reels = false;
                    isPressed_shop = false;
                    isPressed_account = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? description;
  final Image? icon;

  NavigationItem({
    this.title,
    this.description,
    this.icon,
    this.onTap,
  });

  Widget _buildTitles() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description!,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);
    return Material(
      borderRadius: borderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 56,
                height: 56,
                child: icon,
              ),
              const SizedBox(
                width: 16,
              ),
              _buildTitles(),
              const SizedBox(
                width: 16,
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
