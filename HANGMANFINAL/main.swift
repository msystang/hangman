//
//  main.swift
//  HANGMANFINAL
//
//  Created by Sunni Tang on 7/12/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import Foundation


// === Option 1 ===
let word = "type"

var wordArray:[Character] = Array(word)
var boardArray = [String]()
var wordLength = wordArray.count

var lives = 6



// Makes emtpy board
for _ in 1...wordLength {
    boardArray.append("_")
}


func inputGuess() -> String? {
    print("Guess: ", terminator: "")
    let input = readLine()
    return input
}


if var guess = inputGuess() {
    // function
    func gameLoop () {
        if let guess = inputGuess() {
            if lives > 0 {
                // updates board
                func updateBoard() -> String {
                    // Updates current guess in board array
                    if let i = wordArray.firstIndex(of:Character(guess)) {
                        boardArray[i] = String(guess)
                    }
                    // makes board as a string
                    let board = boardArray.joined(separator: " ")
                    
                    return board
                }
                let currentBoard = updateBoard()

                
                if wordArray.contains(Character(guess)) {
                    print(currentBoard)
                } else {
                    lives -= 1
                    // put in body parts
                }
            }
        }
    }
    gameLoop()
}




// === Option 2 ===

/*
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

// === Hangman Images ===
let chains = "⛓"
let head = "😵"
let leftArm = "💪🏼"
let rightArm = "👎🏼"
let body = "👕"
let leftLeg = "👞"
let rightLeg = "👞"
let bone = "🦴"

// = 0 tries =
func drawsHangman0() {
    print("    \(chains)")
    print("    \(chains)")
    print()
    print()
    print()
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}

// = 1 tries =
func drawsHangman1() {
    print("    \(chains)")
    print("    \(chains)")
    print("    \(head)")
    print()
    print()
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}

// = 2 tries =
func drawsHangman2() {
    print("    \(chains)")
    print("    \(chains)")
    print("    \(head)")
    print("    \(body)")
    print()
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}

// = 3 tries =
func drawsHangman3() {
    print("    \(chains)")
    print("    \(chains)")
    print("    \(head)")
    print("  \(leftArm)\(body)")
    print()
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}

// = 4 tries =
func drawsHangman4() {
    print("    \(chains)")
    print("    \(chains)")
    print("    \(head)")
    print("  \(leftArm)\(body)\(rightArm)")
    print()
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}

// = 5 tries =
func drawsHangman5() {
    print("    \(chains)")
    print("    \(chains)")
    print("    \(head)")
    print("  \(leftArm)\(body)\(rightArm)")
    print("    \(leftLeg)")
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}

// = 6 tries =
func drawsHangman6() {
    print("    \(chains)")
    print("    \(chains)")
    print("    \(head)")
    print("  \(leftArm)\(body)\(rightArm)")
    print("   \(leftLeg)\(rightLeg)")
    for _ in 1...5 {
        print(bone, terminator: "")
    }
    print()
}



// === Select Random Word ===
func selectsRandomWord (arrayOfWords: [String]) -> String {
    let randomWord = arrayOfWords.randomElement()!
    return randomWord
}
let word = selectsRandomWord(arrayOfWords: allTheWords)



// === Initial Blank Word ===
var currentState = String()

func displaysInitialBlanks() -> String {
    for _ in word {
        currentState = currentState + " _ "
    }
    return currentState
}



// === Get Input ===
var usedLetters:Set = Set<String>()

func inputGuess() -> String? {
    print("Guess a letter... or else! Guess:", terminator: "")
    let input = readLine()
    return input
}



// === Display Current Status of Word ===
var guess: String = ""

func displaysCurrentState() -> String {
    for char in word {
        if guess == String(char) {
            currentState = currentState + guess
        } else {
            currentState = currentState + " _ "
        }
    }
    return currentState
}
currentState = displaysCurrentState()







// === Welcome Screen ===


// === Game Loop ===
func gameLoop() {
    var counter = 0
    var gameIsNotOver = true
    
    while gameIsNotOver {
        
        // Hangman image based on counter
        if counter == 0 {
            drawsHangman0()
        } else if counter == 1 {
            drawsHangman1()
        } else if counter == 2 {
            drawsHangman2()
        } else if counter == 3 {
            drawsHangman3()
        } else if counter == 4 {
            drawsHangman4()
        } else if counter == 5 {
            drawsHangman5()
        }
        
        //current state of words
        print(currentState)
        
        // insert letters used
        print("Letters used: \(usedLetters)")
        
        // Tries left
        let triesLeft = 6 - counter
        print("You have \(triesLeft) tries left.")
        
        // Inputs guess
        if let input = inputGuess() {
            if input == "" {
                print("You must guess a letter! Guess:")
                // T
                continue
            } else {
                if counter > 4 {
                    gameIsNotOver = false
                    continue
                }
                counter += 1
                usedLetters.insert(input)
            }
        }
    }
    drawsHangman6()
    print("You lost! The word was \(word).")
}

gameLoop()



*/
