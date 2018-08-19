// Присваивает оценку тональности всем сообщениям абонентов в базе

let db = require('./db');
var Sentiment = require('sentiment');
var sentiment = new Sentiment();

(async () => {
    let [{count}] = await db.query('SELECT count(*) as count FROM omnichat WHERE msg_type = 0 AND client_id is not null and score is null and text <> ""')
    console.log(count)
    for (let i = 0; i < count; i++) {
        try {
            let [message] = await db.query('SELECT id, text FROM omnichat WHERE msg_type = 0 AND client_id is not null and score is null and text <> "" LIMIT 1')
            var result = sentiment.analyze(message.text, { language: 'ru' });
            let res_insert = await db.query('UPDATE omnichat SET comparative = ?, score = ? WHERE id = ?', [result.comparative.toFixed(2), result.score, message.id])
            console.log(result.score, message.text, result.positive, result.negative)
        }
        catch (e) {
            console.error(e);
        }
    }
    db.end();
})();