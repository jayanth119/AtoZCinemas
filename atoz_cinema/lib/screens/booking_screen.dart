import 'package:atoz_cinema/models/cinema.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:atoz_cinema/screens/paying_screen.dart';
import 'package:atoz_cinema/widgets/cast_container.dart';
import 'package:atoz_cinema/widgets/comment_container.dart';

class BookingScreen extends StatelessWidget {
  final Model mongo;
  final int mode;

  const BookingScreen({
    super.key,
    required this.mode,
    required this.mongo,
    required String image_caption,
    required String image_location,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 445,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(mongo.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color(0xFF211921).withOpacity(1),
                          const Color(0xFF211921).withOpacity(0),
                          const Color(0xFF211921).withOpacity(0),
                          const Color(0xFF211921).withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///================== text ======================
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 435),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                mongo.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                mongo.rating,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.star,
                                color: Colors.orange.shade200,
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            mongo.release + mongo.director,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),

                          ///==================== 3 buttons in container ================
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mongo.genres.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      mongo.genres[index],
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          ///=========== PARAGRAPH CODE ======================
                          const SizedBox(height: 20),
                          RichText(
                            maxLines: 3,
                            text: TextSpan(
                              text: mongo.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' More',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // navigate to desired screen
                                    },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),
                        ],
                      ),
                    ),

                    ///=============== cast ===================
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Cast",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    ///================== CAST CONTAINER CALL ===============
                    CastContainer(
                      cast: mongo.cast,
                    ),
                    const SizedBox(height: 20),

                    ///===================== video =================
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Trailer",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 176,
                        width: 375,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/carole_and_tuesday.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_filled_outlined,
                            color: Colors.white70,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    ///==================  comments ==============
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Comments",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    ///=================================================
                    CommentContainer(
                      comments: mongo.reviews,
                    ),
                    const SizedBox(height: 80),

                    ///======================= elevated button ==================================
                  ],
                ),
                Positioned(
                  top: 50,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 18,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: 55,
              width: 330,
              child: mode == 1
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PayingScreen(
                              movieName: mongo.title,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Book  Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
