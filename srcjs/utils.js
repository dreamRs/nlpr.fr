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
  },
  analyzeSentiment: async function(text) {
    const container = new nlpjs.Container();
    container.use(nlpjs.LangFr);
    const sentiment = new nlpjs.SentimentAnalyzer({ container });
    const result = sentiment.process({locale: "fr", text: text});
    return result;
  },
  analyzeSentimentMap: async function(text, value) {
    const container = new nlpjs.Container();
    container.use(nlpjs.LangFr);
    const sentiment = new nlpjs.SentimentAnalyzer({ container });
    var results = text.map(function(x) {
      if (x === null) return null;
      return sentiment.process({locale: "fr", text: x}).then(function(results) {
         if (value == "all") {
           return results.sentiment;
         } else {
           return results.sentiment[value];
         }
      });
    });
    return Promise.all(results);
  },
  normalize: function(text) {
    const normalizer = new nlpjs.NormalizerFr();
    return text.map(function(x) {
      if (x === null) {
        return null;
      } else {
        return normalizer.normalize(x);
      }
    });
  },
  tokenize: function(text, normalize) {
    const tokenizer = new nlpjs.TokenizerFr();
    return text.map(function(x) {
      if (x === null) {
        return null;
      } else {
        return tokenizer.tokenize(x, normalize);
      }
    });
  }
};

