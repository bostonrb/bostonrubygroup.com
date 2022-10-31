(function() {
  var container = document.querySelector("[data-role='upcoming-event']");
  var message = container.querySelector("p");
  var request = new XMLHttpRequest();

  request.addEventListener("load", function () {
    var event = JSON.parse(request.responseText);

    if (event) {
      container.innerHTML = `
        <h2>Our next event</h2>
        <p class="events__item-title" data-role="event-name">${event.name}</p>
        <p data-role="event-date-info"><time>${event.date}</time></p>
        <p><time>${event.startTime}</time> to <time>${event.endTime}</time></p>
        <address data-role="event-venue-info">${event.venueName}<br>${event.address}<br>${event.city}</address>
        <p><a href="${event.rsvpURL}" class="cta--primary">RSVP</a></p>
        <p><a href="${event.eventsURL}">See all events</a></p>
      `;
    } else {
      message.innerHTML = "No Upcoming Event";
    }
  });

  request.addEventListener("error", function () {
    message.innerHTML = "Error Fetching Events";
  });

  request.addEventListener("timeout", function () {
    message.innerHTML = "Timeout Fetching Events";
  });

  request.timeout = 3000;
  request.open("GET", "https://bostonrb.onrender.com/");
  request.send();
})();
