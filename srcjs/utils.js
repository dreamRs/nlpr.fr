
module.exports = {
  guess: function(text) {
      const language = new nlpjs.Language();
      const guess = language.guess(text);
      return guess;
    }
};
