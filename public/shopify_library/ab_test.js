console.log('Hello from ab test!!!');

// Make the api call to the right token for the AB TEST
const abTestToken = "8ZHfnHSKXUquD15VaEfV7282";

const url = `https://06ba1ad27a48.ngrok.io/api/v1/ab_test_data?token=${abTestToken}`


const banner = document.querySelector('.hero--large');

fetch(url).then(response => response.json()).then((data) => {
  banner.style.backgroundImage = `url('${data.segment_url}')`
})



// Get the url for the banner, and display it





// banner.style.width = "80%";
// banner.style.margin = "20px 0px";


const title = document.querySelector('h2.h3')
title.style.color = 'red';
console.log(banner);
