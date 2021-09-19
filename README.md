### Youtube Link: https://youtu.be/SbXvPBVddBY

## Inspiration
There is a need for a vaccine passport utility (whether it be an app or physical) to verify those individuals who have received a Covid-19 vaccine. Although this concept of vaccine verification has become somewhat controversial, many governments around the world are discussing their use and most have already begun to produce some sort of vaccine verification system. This is my take on the problem.

## What it does
The VaxPass is an app where you can create an account using your email, name, and your health card number. This app is connected to a database that contains vaccine records, which are identified by a unique health card number, and this database contains information about doses, agent type, date, etc... This information is pulled to the app to be displayed in a rather simple form. The app also generates a qr code where a qr scanner can be used to quickly verify against the database to verify whether a person is double dosed, single dosed, or unvaccinated. 

## How we built it
The application was designed using my favorite design tool - Figma. This software is so freakin' underrated, and I use it almost with every project I'm a part of.
 
The application was built using the Flutter framework developed by Google, using dart as the programming language. Firebase Authentication was used to authenticate and register users, and Firestore was used as the database - using mock data (this data would contain public health records so in production this would be far more secure). 

## Challenges we ran into
So I went on this project solo, which was my first big mistake. There was a lot of work and learning to be done and it would have been easier to have split the work amongst a team of people.  This means that while the app is partially functional there are some missing components, like the QR scanner for quick verification, and there are some quality issues. 

## Accomplishments that we're proud of
I am proud that I was able to get an idea and produce it and finish what I could in the amount of time I had. I am proud that I learned more about Flutter and Dart, and Firebase, which I've had no prior experience with and will be using more in the future. 

## What we learned
I learned that authentication is a difficult problem no matter what the tech stack is, but Firebase makes it a little bit better. I've also learned that making mobile apps has become much more easier and efficient, a bit different than when I first got into Android dev. 

## What's next for MobileVaxPass
This app can be extended in many ways, one of the first things I would look into would be the security of the app and the data that is passed through it. 

Currently, the app is designed exclusively for covid vaccines, but physical immunization records have been out of date for quite some time. So extending this to include your entire immunization record could be useful to many. 
