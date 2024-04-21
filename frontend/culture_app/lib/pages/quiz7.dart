import 'package:culture_app/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizScreen7 extends StatefulWidget {
  @override
  _QuizScreen7State createState() => _QuizScreen7State();
}

class _QuizScreen7State extends State<QuizScreen7> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;
  int _lives = 3;

  List<Map<String, dynamic>> _questions = [
    {
      'question':
          'The Mahabharata revolves around the conflict between two branches of the same family.  Who are these warring cousins?',
      'options': [
        'The Pandavas and the Kauravas',
        'The Yadavas and the Kurus',
        'The Pandavas and the Rakshasas',
        'The Kauravas and the Yadavas'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'A pivotal event in the story is a rigged dice game between Yudhishthira, the eldest Pandava, and his cunning cousin Duryodhana.  What outcome does Duryodhana manipulate through this game?',
      'options': [
        'Exile for the Pandavas for 12 years.',
        'The surrender of Draupadi, the Pandavas\' shared wife.',
        'The loss of all the Pandavas\' wealth and possessions.',
        'A declaration of war between the Pandavas and Kauravas.'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'Following their defeat in the dice game, the Pandavas are forced into exile for twelve years.  Where do they spend this period of hardship?',
      'options': [
        'The kingdom of Matsya, ruled by a loyal friend.',
        'The Dandaka forest, also the location of Rama\'s exile in the Ramayana.',
        'The celestial city of Indra, king of the gods.',
        'A hidden city within the Kuru kingdom, plotting their revenge.'
      ],
      'correctAnswerIndex': 3,
    },
    {
      'question':
          'After their twelve years of exile, the Pandavas must spend an additional year living incognito to avoid further conflict.  Under what disguise do they infiltrate the Matsya kingdom?',
      'options': [
        'As wandering ascetics',
        'As skilled charioteers',
        'As royal advisors to the king',
        'As traveling merchants'
      ],
      'correctAnswerIndex': 2,
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
          title: Text('Mahabharata Quiz'),
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
