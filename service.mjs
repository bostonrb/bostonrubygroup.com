import http from "node:http";
import https from "node:https";

const group = process.env.GROUP || "bostonrb";

const locale = "en-US";
const localeDateOptions = { year: "numeric", month: "long", day: "numeric" };
const localeTimeOptions = { hour: "numeric", minute: "2-digit" };

const headers = {
  "Content-Type": "application/json",
  "Access-Control-Allow-Origin": "*"
};

function getEvent() {
  return new Promise((resolve, reject) => {
    https.get(`https://api.meetup.com/${group}/events?has_ended=false`, (response) => {
      let data = "";
      response.on("data", (chunk) => { data += chunk });
      response.on("end", () => resolve(JSON.parse(data)[0]));
    }).on("error", reject);
  });
}

function getProcessedEvent(event) {
  const processedEvent = {
    name: event.name,
    date: null,
    startTime: "Start Time is TBD",
    endTime: "End Time is TBD",
    venueName: event.venue.name,
    address: event.venue.address_1,
    city: event.venue.city,
    rsvpURL: event.link,
    eventsURL: `https://www.meetup.com/${group}/events/`
  };

  if (event.time) {
    const startTime = new Date(event.time);
    processedEvent.date = startTime.toLocaleDateString(locale, localeDateOptions);
    processedEvent.startTime = startTime.toLocaleTimeString(locale, localeTimeOptions);

    if (event.duration) {
      const endTime = new Date(event.time + event.duration);
      processedEvent.endTime = endTime.toLocaleTimeString(locale, localeTimeOptions);
    }
  }

  return processedEvent;
}

http.createServer(function (request, response) {
  if (request.method === "GET") {
    getEvent()
      .then((event) => {
        response.writeHead(200, headers);
        response.end(JSON.stringify(event ? getProcessedEvent(event) : null));
      })
      .catch(() => {
        response.writeHead(500, headers);
        response.end();
      });
  } else {
    response.writeHead(200, headers);
    response.end();
  }
}).listen(3000);
