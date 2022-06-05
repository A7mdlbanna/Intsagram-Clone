import 'package:flutter/material.dart';
import 'package:flutterapp/models/users.dart';
import 'package:flutterapp/stories/repository.dart';
import 'package:story_view/story_view.dart';
import 'package:flutterapp/stories/util.dart';
import 'errors.dart';

class InstaStory extends StatelessWidget {

  final int index;
   InstaStory({required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<InstaStories>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StoryViewDelegate(
              stories: snapshot.data,
              index: index,
            );
          }
          if (snapshot.hasError) {
            return ErrorView();
          }
          return const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
        future: Repository.getInstaStories(),
      ),
    );
  }
}

class StoryViewDelegate extends StatefulWidget {
  final List<InstaStories>? stories;
   int index;
   StoryViewDelegate({Key? key, this.stories, required this.index}) : super(key: key);


  @override
  _StoryViewDelegateState createState() => _StoryViewDelegateState();
}

class _StoryViewDelegateState extends State<StoryViewDelegate> {
  late List<UserModel> users = [
    UserModel(
        image: "assets/me.jpg",
        name: "A7mdlbanna"
    ),
    UserModel(
        image: "assets/billie1.jpg",
        name: "billieeilish"
    ),
    UserModel(
        image: "assets/ps.png",
        name: "photoshop_box")
  ];
  final StoryController controller = StoryController();
  List <StoryItem> storyItems = [];
  String? when = "";


  @override
  void initState() {
    super.initState();
    widget.stories!.forEach((story) {
      if (story.mediaType == MediaType.text) {
        storyItems.add(
          StoryItem.text(
            title: story.caption!,
            backgroundColor: HexColor(story.color!),
            duration: Duration(
              milliseconds: (story.duration! * 1000).toInt(),
            ),
          ),
        );
      }

      if (story.mediaType == MediaType.image) {
        storyItems.add(StoryItem.pageImage(
          url: story.media!,
          controller: controller,
          caption: story.caption,
          duration: Duration(
            milliseconds: (story.duration! * 1000).toInt(),
          ),
        ));
      }

      if (story.mediaType == MediaType.video) {
        storyItems.add(
          StoryItem.pageVideo(
            story.media!,
            controller: controller,
            duration: Duration(milliseconds: (story.duration! * 1000).toInt()),
            caption: story.caption,
          ),
        );
      }
    });

    when = widget.stories![0].when;
  }

  Widget _buildProfileView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(users[widget.index].image)
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4, left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  users[widget.index].name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  when!,
                  style: const TextStyle(
                    color: Colors.white38,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StoryView(
          storyItems: storyItems,
          controller: controller,
          onComplete: () {
            ++widget.index;
            widget.index < users.length ?
            {
            Navigator.pop(context),
            Navigator.of(context).push(
            MaterialPageRoute(builder : (context) => InstaStory(index: widget.index))),
            } :
            Navigator.pop(context);
          },
          onVerticalSwipeComplete: (v) {
            if (v == Direction.down) {
              Navigator.pop(context);
            }
          },
          onStoryShow: (storyItem) {
            int pos = storyItems.indexOf(storyItem);

            // the reason for doing setState only after the first
            // position is because by the first iteration, the layout
            // hasn't been laid yet, thus raising some exception
            // (each child need to be laid exactly once)
            if (pos > 0) {
              setState(() {
                when = widget.stories![pos].when;
              });
            }
          },
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 48,
            left: 16,
            right: 16,
          ),
          child: _buildProfileView(),
        )
      ],
    );
  }
}
