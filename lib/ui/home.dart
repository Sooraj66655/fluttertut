import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:tut/model/movie.dart';
import 'package:tut/model/question.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
      ),
      backgroundColor: Colors.amberAccent.shade700,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.holiday_village), label: "About"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Services"),
        ],
        onTap: (int index) => print("Tapped Item $index"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Video Call");
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.missed_video_call),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello Snack!"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text("Button"),
      ),
    );
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAwtar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(14.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Suraj Yadav"),
          Text("Software Developer"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.person), Text("surajsy66655@gmail.com")],
          )
        ],
      ),
    );
  }

  Container _getAwtar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        border: Border.all(color: Colors.red, width: 1.2),
        image: DecorationImage(
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKteLqmvhKKrEpZzJP5QsAumby0zEwCyP4VgmnwpgtRGcxw4Qm-Xx6aOjNmsSG_JqRcVw&usqp=CAU"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Life is not About getting and Having , It's About giving and being",
    "Never bend your head. Always hold it high. Look the world straight in the eye",
    "What you get by achieving your goals is not as important as what you become by achieving your goals.",
    "Believe you can and you're halfway there.",
    "When you have a dream, you've got to grab it and never let go.",
    "I can't change the direction of the wind, but I can adjust my sails to always reach my destination.",
    "No matter what you're going through, there's a light at the end of the tunnel.",
    "It is our attitude at the beginning of a difficult task which, more than anything else, will affect its successful outcome.",
    "Just don't give up trying to do what you really want to do. Where there is love and inspiration, I don't think you can go wrong.",
    "Limit your \"always\" and your \"nevers.\"",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        quotes[_index % quotes.length],
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontStyle: FontStyle.italic,
                            fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton.icon(
                onPressed: _showQuote,
                icon: Icon(Icons.wb_sunny),
                label: Text(
                  "Inspire me!",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index++;
    });
  }
}

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0.0;
  Color _purple = HexColor("#6908D6");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: _purple),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "\$ ${_billAmount == 0.0 ? "0.0" : calculateTipPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            color: _purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Biil Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split"),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_personCounter >= 1) {
                                setState(() {
                                  _personCounter--;
                                });
                              } else {
                                //do nothing
                              }
                            },
                            child: Container(
                              width: 49.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            _personCounter.toString(),
                            style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 49.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: _purple,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Text(
                        "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage %",
                        style: TextStyle(
                          color: _purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        activeColor: _purple,
                        inactiveColor: Colors.grey,
                        divisions: 10,
                        value: _tipPercentage.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _tipPercentage = value.round();
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  calculateTipPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name(
        "The India Declaration of Independence was adopted in 1776.", true),
    Question.name(
        "The bsgsgsg India Declaration of Independence was adopted in 1776.",
        true),
    Question.name(
        "The India Declaration of Independence was adopted in 1776.", true),
    Question.name(
        "The India Declaration of Independence was adopted in 1776.", true),
    Question.name(
        "The India Declaration of Independence was adopted in 1776.", true),
    Question.name(
        "The India Declaration of Independence was adopted in 1776.", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid,
                      )),
                  height: 120,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        //style: TextStyle(fontSize: 16.9, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _previousAnswer(_currentQuestionIndex),
                    child: Icon(Icons.arrow_back),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(true),
                    child: Text("TRUE"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(false),
                    child: Text("FALSE"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _nextAnswer(),
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade900,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
        duration: Duration(microseconds: 500),
        content: Text("Correct!"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _updateQuestion();
    } else {
      final snackBar = SnackBar(
        duration: Duration(microseconds: 500),
        content: Text("Wrong!"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Wrong Answer");
      _updateQuestion();
    }
  }

  _nextAnswer() {
    _updateQuestion();
  }

  _previousAnswer(index) {
    _updateQuestion();
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final List<Movie> listMovie = Movie.getMovie();
  // final List movies = [
  //   "Titanic",
  //   "Blade Runner",
  //   "Rambo",
  //   "The Avengers",
  //   "Avatar",
  //   "I am Legend",
  //   "300",
  //   "The Wolf of Wall Street",
  //   "InterStreller",
  //   "Game of Thrones",
  //   "Vikings"
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey.shade900,
      ),
      //backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: listMovie.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: [
            movieCard(listMovie[index], context),
            Positioned(
                top: 18,
                child: movieImage(
                  listMovie[index].images![0],
                )),
          ]);
          // return Card(
          //   elevation: 4.5,
          //   color: Colors.white,
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       child: Container(
          //         width: 200,
          //         height: 200,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: NetworkImage("${listMovie[index].images![0]}"),
          //             fit: BoxFit.cover,
          //           ),
          //           color: Colors.blueGrey,
          //           borderRadius: BorderRadius.circular(13.9),
          //         ),
          //       ),
          //     ),
          //     trailing: Text("..."),
          //     title: Text("${listMovie[index].title}"),
          //     subtitle: Text("${listMovie[index].title}"),
          //     // onTap: () => print("Movie Name: ${movies.elementAt(index)}"),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => MovieListViewDetails(
          //             movieName: listMovie[index].title,
          //             movie: listMovie[index],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // );
        },
      ),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          margin: EdgeInsets.only(left: 55),
          width: MediaQuery.of(context).size.width,
          height: 120.0,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${movie.title}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rating : ${movie.imdbRating} / 10",
                        style: mainTextStyle(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        "${movie.runtime}",
                        style: mainTextStyle(),
                      ),
                      Text(
                        "${movie.rated}",
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        print(movie.title);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )));
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: Colors.grey,
    );
  }

  Widget movieImage(String imgUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imgUrl == ""
                ? "https://cdn1.vectorstock.com/i/1000x1000/51/05/male-profile-avatar-with-brown-hair-vector-12055105.jpg"
                : imgUrl),
            fit: BoxFit.cover),
      ),
    );
  }
}

//New route
class MovieListViewDetails extends StatelessWidget {
  final String? movieName;
  final Movie? movie;

  const MovieListViewDetails({Key? key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies "),
        //backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(
            thumnail: movie!.images![0],
          ),
          HorozontalLine(),
          MovieDetailsHeaderWithPoster(
            movie: movie,
          ),
          HorozontalLine(),
          MovieDetailsCast(
            movie: movie,
          ),
          HorozontalLine(),
          MovieExtraPoster(
            poster: movie!.images,
          )
        ],
      ),
      // body: Container(
      //   child: Center(
      //     child: ElevatedButton(
      //       child: Text("Go Back ${movie!.title}"),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String? thumnail;

  const MovieDetailsThumbnail({Key? key, this.thumnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage("$thumnail"),
                fit: BoxFit.cover,
              )),
            ),
            Icon(
              Icons.play_circle_fill_outlined,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white10, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie? movie;

  const MovieDetailsHeaderWithPoster({Key? key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster: movie!.images![0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({
    Key? key,
    required this.poster,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius2 = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius2,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("$poster"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie? movie;
  const MovieDetailsHeader({Key? key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie?.year} . ${movie!.genre}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.indigoAccent),
        ),
        Text(
          "${movie?.title}",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(text: movie?.plot),
              TextSpan(text: "More...", style: TextStyle(color: Colors.cyan)),
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie? movie;

  const MovieDetailsCast({Key? key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie?.actors),
          MovieField(field: "Director", value: movie?.director),
          MovieField(field: "Awards", value: movie?.awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String? field;
  final String? value;

  const MovieField({Key? key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$field :",
          style: TextStyle(
            color: Colors.black38,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        Expanded(
          child: Text(
            "$value :",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class HorozontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPoster extends StatelessWidget {
  final List<String>? poster;

  const MovieExtraPoster({Key? key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "More Movie Posters".toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(poster![index]),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
              itemCount: poster!.length,
            ),
          ),
        ],
      ),
    );
  }
}
