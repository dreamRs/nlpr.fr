const core = require('@nlpjs/core');
const nlp = require('@nlpjs/nlp');
const langenmin = require('@nlpjs/lang-en-min');
const language = require('@nlpjs/language');
const sentimentAnalyzer = require('@nlpjs/sentiment');
const langFr = require('@nlpjs/lang-fr');
const utils = require("./utils");

rutils = { ...utils };
nlpjs = { ...core, ...nlp, ...langenmin, ...language, ...sentimentAnalyzer, ...langFr };
