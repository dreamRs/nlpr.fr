module.exports = {
  guess: function(text) {
    const language = new nlpjs.Language();
    const guess = language.guess(text);
    return guess;
  },
  guessMap: function(text, value) {
    const language = new nlpjs.Language();
    return text.map(function(x) {
      if (x === null) {
        return null;
      } else {
        var result = language.guessBest(x);
        return result[value];
      }
    });
  }
};

