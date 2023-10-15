class Survey {
  final String question;
  final List<Choice> choices;

  Survey(this.question, this.choices);
}

List<Survey> userExperiences = [
  Survey(
    'How would you rate the overall user interface design of our app?',
    [
      Choice('A) Excellent'),
      Choice('B) Good'),
      Choice('C) Fair'),
      Choice('D) Poor'),
    ],
  ),
  Survey(
    'How easy was it to navigate and find the features you were looking for in the app?',
    [
      Choice('A) Very Easy'),
      Choice('B) Somewhat Easy'),
      Choice('C) Neutral'),
      Choice('D) Difficult'),
    ],
  ),
  Survey(
    'Did you encounter any performance issues or delays while using the app? If yes, please specify.',
    [
      Choice('A) No'),
      Choice('B) Yes, occasional slowdowns'),
      Choice('C) Yes, frequent delays'),
      Choice('D) Yes, app crashes'),
    ],
  ),
  Survey(
    ' How satisfied are you with the responsiveness of the app to your actions (e.g., button taps, swipes)?',
    [
      Choice('A) Very Satisfied'),
      Choice('B) Satisfied'),
      Choice('C) Neutral'),
      Choice('D) Unsatisfied')
    ],
  ),
  Survey(
    'How would you rate the overall user interface design of our app?',
    [
      Choice('A) Excellent'),
      Choice('B) Good'),
      Choice('C) Fair'),
      Choice('D) Poor'),
    ],
  ),
  Survey(
    'How easy was it to navigate and find the features you were looking for in the app?',
    [
      Choice('A) Very Easy'),
      Choice('B) Somewhat Easy'),
      Choice('C) Neutral'),
      Choice('D) Difficult'),
    ],
  ),
  Survey(
    'Did you encounter any performance issues or delays while using the app? If yes, please specify.',
    [
      Choice('A) No'),
      Choice('B) Yes, occasional slowdowns'),
      Choice('C) Yes, frequent delays'),
      Choice('D) Yes, app crashes'),
    ],
  ),
  Survey(
    ' How satisfied are you with the responsiveness of the app to your actions (e.g., button taps, swipes)?',
    [
      Choice('A) Very Satisfied'),
      Choice('B) Satisfied'),
      Choice('C) Neutral'),
      Choice('D) Unsatisfied')
    ],
  ),
];

class Choice {
  final String answer;

  Choice(this.answer);
}
