/*

Carlos Noble Curveira
Mr. Gordon
Sun Jan 17 2016

*/

import Cocoa

// Creat an empty string to store input message
var myMessage: String

// Input message to be decoded
myMessage = "Square 3 contains the bottom of a ladder that moves you up to square 11."

// Counts the number of characters in the input text
var characters: Int = myMessage.characters.count

// Create empty array to store the key for each letter in
var key: [Int] = []

// Create empty array to store the ascii value for each letter in
var asciiValue: [Int] = []

// Create empty array to store the encoded text in
var encodedTextArray: [Int] = []

// Create empty String to display the encoded "text"
var encodedTextString: String = ""

// Create empty array to store the decoded text in
var decodedText: String = ""

// Create empty array to store each letter in
var letters: [String] = []

// Creating an empty variable to store a random variable
var randomValue = 0

// Set the upper and lower boundary for the random variable
let upperBoudary = 999877

let lowerBoudary = 99968

//
// This portion of the code encodes the text input.
//

// Runs through the entire message assigning a random value to each character
for character in myMessage.characters
{
    randomValue = Int(arc4random_uniform(1000000))
    
    // The random value must be within a range so that the output has 6 digits
    while randomValue < lowerBoudary || randomValue > upperBoudary
    {
        // Must be an int to add later
        randomValue = Int(arc4random_uniform(1000000))
    }
    
    // Add the random value to the key array
    key += [randomValue]
    
    // Add each character in an array
    letters += [String(character)]
}

// Runs through the entire message finding the ascii value of each character
for ascii in myMessage.unicodeScalars
{
    // Add each value to an array
    asciiValue += [Int(ascii.value)]
}

// Runs the amount of times that there are characters
for (var i = 0; i < characters; i++)
{
    // Add the key and ascii value to get the 6 digit number to represent each character
    encodedTextArray += [key[i] + asciiValue[i]]
    
    // Adds the numbers to a String to be displayed as the encoded text
    encodedTextString += String(key[i] + asciiValue[i])
}

//
// This portion of the code decodes the encoded text
//

// Runs the amount of times that there are characters
for (var i = 0; i < characters; i++)
{
    // decode the text by subtracting the key from the encoded text
    decodedText += String(UnicodeScalar(encodedTextArray[i] - key[i]))
}
