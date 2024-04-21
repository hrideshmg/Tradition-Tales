import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizScreen3 extends StatefulWidget {
  @override
  _QuizScreen3State createState() => _QuizScreen3State();
}

class _QuizScreen3State extends State<QuizScreen3> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _lives = 3;

  List<Map<String, dynamic>> _questions = [
    {
      'question':
          'Onam is a harvest festival celebrated in which Indian state?',
      'options': ['Tamil Nadu', 'Karnataka', 'Kerala ', 'Andhra Pradesh'],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'What is the significance of Pookalam, a popular Onam tradition?',
      'options': [
        'Wearing colorful clothing',
        'Creating elaborate flower decorations ',
        'Participating in boat races',
        'Preparing a grand feast'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'King Mahabali, a legendary figure associated with Onam, is believed to visit Kerala during the festival. What does his return symbolize?',
      'options': [
        'The arrival of spring',
        'A reminder of the importance of humility ',
        'Celebrating the end of the monsoon season',
        'A time for grand displays of wealth'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'During Onam, a traditional vegetarian feast called Sadhya is a central part of the celebration. What is the main focus of this elaborate meal?',
      'options': [
        'Spicy and meat-based dishes',
        'Sharing and enjoying a variety of vegetarian dishes ',
        'Consuming large quantities of food',
        'A competition for the most unique dish'
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
      Navigator.pop(context);
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
          title: Text('Onam Quiz'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Navigate back to previous page
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                _questions[_currentIndex]['question'],
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20),
              Column(
                children: List.generate(
                  _questions[_currentIndex]['options'].length,
                  (index) => GestureDetector(
                    onTap: () {
                      _checkAnswer(index);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo, // Changed color to indigo
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        _questions[_currentIndex]['options'][index],
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lives: $_lives',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_lives == 0)
                Text(
                  'Game Over!',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              // Add a button to go to the next question
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.indigo, // Changed button color to indigo
                ),
                onPressed: () {
                  _showNextQuestion();
                },
                child: Text(
                  'Next Question',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


