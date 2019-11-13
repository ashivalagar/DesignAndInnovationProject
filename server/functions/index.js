const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require('express');
const querystring = require('querystring');
const cors = require('cors')({ origin: true })
const bodyParser = require('body-parser');

admin.initializeApp(functions.config().firebase);

var db = admin.firestore();

const app = express();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

app.use(cors);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/all/", async (req, res) => {
    let kioskId = req.query.kiosk;
    var dataVal = await db.collection("kiosks").doc(kioskId).collection("compartments").get();
    var allData = [];
    var count = 0;
    dataVal.forEach(doc => {
        count++;
        var jsonVariable = {};
        jsonVariable[count] = doc.data()
        allData.push(jsonVariable);
    })
    console.log(allData)
    res.send(allData);
});

app.get("/location", async (req, res) => {
    var locationData = await db.collection("kiosks").get();
    var allLocation = [];
    var count = 0;
    locationData.forEach(doc => {
        count++;
        var jsonVariable = {};
        jsonVariable[count] = doc.data()
        allLocation.push(jsonVariable);
    })
    res.send(allLocation);
})

app.put("/borrow", (req, res) => {
    var body = req.body;
    var comapartmentId = body.compartmentId;
    var kioskId = body.kioskId;
    db.collection("kiosks").doc(kioskId).collection("compartments").doc(comapartmentId).set({ rented: false });
    res.send("Updated");
});

app.put("/return", (req, res) => {
    var body = req.body;
    var comapartmentId = body.compartmentId;
    var kioskId = body.kioskId;
    db.collection("kiosks").doc(kioskId).collection("compartments").doc(comapartmentId).set({ rented: true });
    res.send("Updated");
});

app.post("/location", (req, res) => {
    var body = req.body;
    var kioskId = body.kioskId;
    var latitude = body.latitude;
    var longitude = body.longitude;
    var location = new admin.firestore.GeoPoint(latitude, longitude);
    db.collection("kiosks").doc(kioskId).set({ location: location })
    res.send("Updates")
});

// app.listen(9001, "127.0.0.1", () => {
//     console.log("Server is up");
// });



exports.app = functions.https.onRequest(app);

