//
// BubbleSort.swift
//
// Created by Noah Smith
// Created on 2025-04-08
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The BubbleSort program will read  a set of 10 integers between 0 and 100.
// It will populate the set of integers into an array.
// It will then sort the array using the bubble sort algorithm.
// It will write the sorted array to the output file.

// Import foundation library
import Foundation

// Declare constants
let arrayLength = 10
let minValue = 0
let maxValue = 100

// Function to generate an array of random numbers
func populatingArrays() -> [Int] {

    // Initialize the array
    // Source: https://www.tutorialspoint.com/swift/swift_arrays.htm
    var arrayNum: [Int] = Array(repeating: 0, count: arrayLength)

    // Generate random numbers between 0 and 100
    // Until the counter reaches the end of the array
    for counter in 0..<arrayLength {
        // This line generates a random integer between 0 and 100
        // There are 3 dots instead of 2 because it includes the last number
        arrayNum[counter] = Int.random(in: minValue...maxValue)
    }

    // Return the array
    return arrayNum
}

// Function to sort the array using bubble sort
func bubbleSort(arrayInt: [Int]) -> [Int] {
    
    // this line is to create a copy of the array
    // so that the original array is not modified
    var array = arrayInt

    // Bubble sort algorithm
    for pass in 0..<arrayLength - 1 {
        // Compare the two numbers
        for counter in 0..<arrayLength - pass - 1 {
            // If the first number is greater than the second number
            if array[counter] > array[counter + 1] {
                // Swap the numbers
                let temp = array[counter]
                array[counter] = array[counter + 1]
                array[counter + 1] = temp
            }
        }
    }

    // return sorted array
    return array
}

// Greeting
print("Welcome to the bubble sort program!")

// Get the unsorted array by calling the populatingArrays function
var arrayNum = populatingArrays()

// Get the sorted array by calling the bubbleSort function
arrayNum = bubbleSort(arrayInt: arrayNum)

// Prepare the output string
var outputStr = ""
for num in arrayNum {
    outputStr += "\(num) "
}

// Add a new line for spacing
outputStr += "\n"

// Define the output file path
let filePath = "./output.txt"

// Write to the output file
do {
    try outputStr.write(toFile: filePath, atomically: true, encoding: .utf8)
    print("\nSuccessfully wrote to 'output.txt'")
} catch {
    print("Error writing to file: \(error)")
}