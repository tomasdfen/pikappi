# Pikappi

Pikappi is an application that consists of a Pokémon game where we can capture Pokémons through a Quizz-style game using Flutter, Pokeapi and MongoDB. Depending on the percentage of success in this minigame the user will have more or less opportunities to capture the wild appeared Pokémon. Once captured, it will be registered in our Pokédex, which is like a library where the user archive data of captured pokémons. The user can also personify his profile.

## Home Page
On our home screen we can see all the buttons and routes to the other screens, apart from our favorite pokémon, which will change depending on the pokémon we choose to accompany us. The accesible buttons are: the settings page, the quizz minigame and the Pokédex respectively. At the top right we will find a button with an avatar of our chosen coach that will take us to the user settings.

## Settings Page
It takes care of system settings and some options. This was a sample page for mere training with Flutter so a few have little functionality. The two buttons that we can actually interact with are those for music and notifications.

The first button is simply to choose if we want to listen to background music. The other option is to receive notifications, as soon as you activate this option, a notification will appear alerting us that the option to receive notifications from the game has been activated, and every day a local notification will appear on the phone reminding us to play.

### User Settings Page
In this screen we can see that its function is to personalize our profile and information, which we store in the MongoDB database.
![image](https://user-images.githubusercontent.com/46267014/131707089-4be4763d-fafe-4d5a-b1f7-879334539f9a.png)


## Pokedex Page
We can see a grid of 3 columns in order of the Pokédex of the first generation of Pokémon, this means that we will have up to 151 Pokémon to collect. As we can see, depending on whether we have captured the Pokémon, its information will appear or it will appear as “??" if we have never captured it, as in any pokémon game.

Each container color that stores a pokémon will depend on the type of the pokémon in question, this value is obtained dynamically by consulting the type of pokémon in the API in order to have a colorful library


Once inside we can see its statistics, type and its photo that we also collect from the API. In addition, at the bottom right we will have a button to assign this pokémon as a favorite, and if we click on it an internal notification will appear below warning us that we have chosen this pokémon as our companion.

This pokédex is cached, that is, once we load your information for the first time, we will save it in the cache of the device, increasing the loading speed and its comfort to play.

## Quiz Page
### Questions Page
A wild pokémon will appear that we must capture, which is random and can be any of the 151 pokemons available (whether or not they are captured). Its background color will be of the type of the pokémon in order to give us a little clue of who it may be, apart from showing us its hidden silhouette as it happened in the anime.

The minigame will consist of a small kahoot-style quiz asking us questions within a bank of available questions that we have programmed. The answers to these questions will be generated randomly depending on the pokémon, that is, there will be 1 correct option while the other 3 will be answers about other wrong Pokémons extracted from the API and without repeated data, in order to enrich the minigame and make it entertaining

### Results Page
Once we finish with the quiz, we will get the results of it, with the percentage of correct answers. We can also check where we have failed and what was the correct answer in order to learn every time we play. Finally, if we want to capture the pokémon we must click on this button to enter the capture screen.

### Capture Page
If we click on the capture button we will see an animation to see if we have captured the pokémon or not. The probability of capture will depend on the percentage of success of the quiz. If it is captured, it will be unlocked in the Pokédex.
