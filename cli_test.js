// Сктипт для проверки и отладки словаря в интерфейсе командной строки.
// Для каждого введенного сообщения выводит оценку его тональности
var Sentiment = require('sentiment');
var sentiment = new Sentiment();

var readline = require('readline');
var rl = readline.createInterface(process.stdin, process.stdout);
rl.setPrompt('message> ');
rl.prompt();
rl.on('line', function(line) {
    if (line === "right") rl.close();
    console.log(sentiment.analyze(line, { language: 'ru' }))
    rl.prompt();
}).on('close',function(){
    process.exit(0);
});