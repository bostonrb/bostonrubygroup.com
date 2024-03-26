(function() {
  var container = document.querySelector("[data-role='upcoming-event']");
  var message = container.querySelector("p");
  var request = new XMLHttpRequest();

  request.addEventListener("load", function () {
    const event_list = JSON.parse(request.responseText)["events"];
    if (!event_list) {
      message.innerHTML = `<p><a href="https://www.meetup.com/bostonrb">See upcoming events</a></p>`;
      return;
    }
    const future_events = event_list.filter(e => e.status === "upcoming")
      .sort((a, b) => a.start_time_raw - b.start_time_raw);
    const event = future_events[0];

    if (event) {
      container.innerHTML = `
        <h2>Our next event</h2>
        <p class="events__item-title" data-role="event-name">${event.name}</p>
        <p data-role="event-date-info"><time>${new Date(event.start_time_raw).toLocaleDateString(undefined, { year: 'numeric', month: 'long', day: 'numeric' })}</time></p>
        <p><time>${event.start_time}</time> to <time>${event.end_time}</time></p>
        <address data-role="event-venue-info">${event.location}<br></address>
        <div><a href="${event.html_link}" class="cta--primary">RSVP</a></div>
        <div class="events__description">${event.description}</div>
        <p><a href="https://www.meetup.com/bostonrb">See all events</a></p>
      `;
    } else {
      message.innerHTML = "No Upcoming Event";
    }
  });

  request.addEventListener("error", function () {
    message.innerHTML = `<p><a href="https://www.meetup.com/bostonrb">See upcoming events</a></p>`;
  });

  request.addEventListener("timeout", function () {
    message.innerHTML = `<p><a href="https://www.meetup.com/bostonrb">See upcoming events</a></p>`;
  });

  request.timeout = 3000;
  // https://www.sociablekit.com/app/users/widgets/update_embed/25388247
  request.open("GET", `https://data.accentapi.com/feed/25388247.json?no_cache=${new Date().getTime()}`);
  request.send();
})();
