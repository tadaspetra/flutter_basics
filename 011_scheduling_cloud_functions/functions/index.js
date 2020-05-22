const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const database = admin.firestore();

exports.timerUpdate = functions.pubsub.schedule('* * * * *').onRun((context) => {
    database.doc("timers/timer1").update({ "time": admin.firestore.Timestamp.now() });
    return console.log('successful timer update');
});