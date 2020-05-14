const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const database = admin.firestore();

// exports.timerUpdate = functions.pubsub.schedule('* * * * *').onRun((context) => {
//     database.doc("timers/timer1").update({ "time": admin.firestore.Timestamp.now() });
//     return console.log('successful timer update');
// });

exports.sendNotification = functions.pubsub.schedule('* * * * *').onRun(async (context) => {
    //check whether notification should be sent
    //send it if yes

    const query = await database.collection("notifications")
        .where("whenToNotify", '<=', admin.firestore.Timestamp.now())
        .where("notificationSent", "==", false).get();

    query.forEach(async snapshot => {
        sendNotification(snapshot.data().token);
        await database.doc('notifications/' + snapshot.data().token).update({
            "notificationSent": true,
        });
    });

    function sendNotification(androidNotificationToken) {
        let title = "Timed Notification";
        let body = "Comes at the right time";

        const message = {
            notification: { title: title, body: body },
            token: androidNotificationToken,
            data: { click_action: 'FLUTTER_NOTIFICATION_CLICK' }
        };

        admin.messaging().send(message).then(response => {
            return console.log("Successful Message Sent");
        }).catch(error => {
            return console.log("Error Sending Message");
        });
    }
    return console.log('End Of Function');
});