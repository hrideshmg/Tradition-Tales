import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _lives = 3;
  int progression = 1;
  List<Map<String, dynamic>> _questions = [
    {
      'question':
          'Vishu is a festival celebrated in Kerala, India, that marks the beginning of their traditional new year. What is the approximate Gregorian calendar month when Vishu usually falls?',
      'options': ['January', 'April', 'July', 'October'],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'Vishu kani is an important Vishu tradition involving arranging auspicious items for the first thing someone sees in the new year.  What might you typically find in a vishu kani?',
      'options': [
        'A brightly lit lamp',
        'A plate of sweets and snacks',
        'A set of new clothes',
        'A gift for a loved one'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'According to some legends, Vishu is associated with Lord Vishnu\'s avatar, Matsya. What form did Matsya take?',
      'options': [
        'A powerful warrior',
        'A wise scholar',
        'A giant fish',
        'A majestic lion'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'During Vishu, kaineettam is a tradition where elders gift something, often money, to younger family members.  What is the significance of this custom?',
      'options': [
        'To ward off evil spirits',
        'To symbolize good luck and prosperity in the new year',
        'To express gratitude',
        'To encourage children to gamble'
      ],
      'correctAnswerIndex': 1,
    },
  ];

  void _checkAnswer(int selectedIndex) {
    int correctAnswerIndex = _questions[_currentIndex]['correctAnswerIndex'];
    bool isCorrect = selectedIndex == correctAnswerIndex;
    if (isCorrect) {
      setState(() {
        _correctAnswers++;
        progression = progression + 30;
        if (progression >= 100) {
          progression = 100;
        }
      });
    } else {
      setState(() {
        _wrongAnswers++;
        _lives--;
      });
    }
    _showNextQuestion();
  }

  void _showNextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // End of quiz, you can show a result screen or any other action here
      print('Quiz Ended!');
      print('Correct Answers: $_correctAnswers');
      print('Wrong Answers: $_wrongAnswers');
      // Navigate back to previous page when the game is over
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        if (_lives == 0) {
          // Navigate back to previous page if lives reach 0
          Navigator.pop(context);
          return true; // Allow back navigation
        } else {
          return false; // Prevent back navigation
        }
      },
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Vishu Quiz'),
          title: LinearProgressIndicator(
              value: progression.toDouble() / 100,
              minHeight: 11,
              borderRadius: BorderRadius.circular(7),
              color: Colors.green),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Navigate back to previous page
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lives: $_lives',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Timer: --:--', // Placeholder for timer
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),

              if (_lives == 0)
                Text(
                  'Game Over!',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              const SizedBox(
                height: 15,
              ),
              Image.network(
                _questions[_currentIndex]['image'],
                width: double.infinity, // Adjust the width as needed
                height: 300, // Adjust the height as needed
                fit: BoxFit.cover, // Adjust the BoxFit as needed
              ),
              const SizedBox(
                height: 20,
              ),

              Column(
                children: List.generate(
                  (_questions[_currentIndex]['options'].length / 2.0).toInt(),
                  (index) => GestureDetector(
                    onTap: () {
                      _checkAnswer(index);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // width: MediaQuery.of(context).size.width/2,
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.height / 10,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 4.0),
                                // color: Colors.indigo, // Changed color to indigo
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  _questions[_currentIndex]['options'][index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: "inter"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width/2,
                              width: MediaQuery.of(context).size.width / 2.3,
                              height: MediaQuery.of(context).size.height / 10,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                                // color: Colors.indigo, // Changed color to indigo
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 4.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  _questions[_currentIndex + 1]['options']
                                      [index + 1],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontFamily: "inter"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lives: $_lives',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),

              if (_lives == 0)
                Text(
                  'Game Over!',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),

              const SizedBox(
                height: 7,
              ),
              // Add a button to go to the next question
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Changed button color to indigo
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    _showNextQuestion();
                  },
                  child: Text(
                    'Next Question',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
