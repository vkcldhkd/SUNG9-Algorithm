//
//  main.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/9/25.
//

/*
 Day1
 print(Day1.sumOfDigits())
 print(Day1.maxValue())
 print(Day1.oxQuizScore())
 */


/*
 Day2
 print(Day2.normalizedAverageScore())
 print(Day2.mostFrequentAlphabet())
 print(Day2.compareReversedNumbers())
 print(Day2.wordCount())
 print(Day2.calculateArea())
 print(Day2.findMaxInMatrix())
 print(Day2.sortMembersByAge())
 */

/*
 Day3
 print(Day3.countCroatianAlphabets())
 print(Day3.sortUniqueWords())
 print(Day3.findBestBlackjack())
 print(Day3.movePositionInGrid())
 print(Day3.sortDigitsDescending())
 */

/*
 Day4
 print(Day4.convertToDigit())
 print(Day4.recommendID())
 print(Day4.mostFrequentCharacter())
 print(Day4.extractAndSortNumbers())
 print(Day4.removeDuplicatesAndSort())
 print(Day4.isPalindrome())
 print(Day4.isMultipleOfThree())
 */

/*
 Day5
 print(Day5.canFormPalindrome())
 print(Day5.longestPalindromeSubstring())
 print(Day5.longestCommonPrefix(strings: ["interstellar", "internet", "interval"]))
 print(Day5.longestCommonPrefix(strings: ["dog", "racecar", "car"]))
 print(Day5.longestCommonPrefix(strings: ["flower", "flow", "flight"]))
 print(Day5.groupAnagrams(strings: ["eat", "tea", "tan", "ate", "nat", "bat"]))
 print(Day5.lengthOfLongestSubstring())
 print(Day5.minWindow())
 */


/*
 Day 6
 print(Day6.fibonacci())
 print(Day6.createMaxNumber(array: [3, 30, 34, 5, 9]))
 */


/*
 Day 7
 let log1: [String] = [
     "dig1 8 1 5 1",
     "let1 art can",
     "dig2 3 6",
     "let2 own kit dig",
     "let3 art zero"
 ]

 let log2: [String] = [
     "let1 art can",
     "let2 art zero",
     "let3 art apple"
    ]

 print(Day7.sortLogsByRule(logs: log1))
 print(Day7.sortLogsByRule(logs: log2))
 print(Day7.validPalindrome())
 print(Day7.mostCommonWord(
     paragraph: "Bob hit a ball, the hit BALL flew far after it was hit.",
     banned: ["hit"]
 ))

 print(Day7.mostCommonWord(
     paragraph: "Jack and Jill went up the hill to fetch a pail of water.",
     banned: ["jack", "hill", "pail"]
 ))
 
 print(Day7.isValidParentheses())
 print(Day7.evaluatePostfixExpression(["2", "1", "+", "3", "*"])) // 9
 print(Day7.evaluatePostfixExpression(["4", "13", "5", "/", "+"])) // 6
 print(Day7.evaluatePostfixExpression(["3", "4", "+", "2", "*", "7", "/"])) // 2
 print(Day7.evaluatePostfixExpression(["5", "1", "2", "+", "4", "*", "+", "3", "-"])) // 14
 print(Day7.evaluatePostfixExpression(["10", "6", "9", "3", "/", "-", "*"])) // 30
 */

/*
 Day8
 print(Day8.bridgeTruckCrossingTime(bridgeLength: 2, weight: 10, truckWeights: [7, 4, 5, 6])) // 8
 print(Day8.bridgeTruckCrossingTime(bridgeLength: 100, weight: 100, truckWeights: [10])) // 101
 print(Day8.bridgeTruckCrossingTime(bridgeLength: 100, weight: 100, truckWeights: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10])) // 110
 print(Day8.findIncompleteRunner(participant: ["leo", "kiki", "eden"], completion: ["eden", "kiki"])) // "leo"
 print(Day8.findIncompleteRunner(participant: ["marina", "josipa", "nikola", "vinko", "filipa"], completion: ["josipa", "filipa", "marina", "nikola"])) // "vinko"
 print(Day8.findIncompleteRunner(participant: ["mislav", "stanko", "mislav", "ana"], completion: ["stanko", "ana", "mislav"])) // "mislav"
 print(Day8.makeLargestNumber([6, 10, 2])) // "6210"
 print(Day8.makeLargestNumber([3, 30, 34, 5, 9])) // "9534330"
 print(Day8.makeLargestNumber([0, 0, 0])) // "0"
 */

/*
 Day9
 print(Day9.mode1(of: [1, 3, 1, 3, 2, 1])) // [1, 3, 1, 3, 2, 1] Output: 1
 print(Day9.mode1(of: [4, 5, 4, 6, 5, 6])) // [4, 5, 4, 6, 5, 6] Output: 4
 print(Day9.mode2(of: [1, 2, 3, 3, 3, 4])) // [1, 2, 3, 3, 3, 4] Output: 3
 print(Day9.mode2(of: [1, 1, 2, 2])) // [4, 5, 4, 6, 5, 6] Output: -1
 print(Day9.mode2(of: [1])) // [4, 5, 4, 6, 5, 6] Output: 1
 let nums = [1, 2, 2, 3, 3, 3, 4, 4]
 let ranges = [
     [0, 2],   // [1, 2, 2]
     [0, 5],   // [1, 2, 2, 3, 3, 3]
     [3, 5],   // [3, 3, 3]
     [6, 7],   // [4, 4]
     [0, 4],   // [1, 2, 2, 3, 3]
     [0, 7],   // 전체
     [0, 0]    // [1]
 ]
 print(Day9.mode3(nums: nums, ranges: ranges)) // [2, 3, 3, 4, 2, 3, 1]
 print(Day9.mode3(nums: [1, 2, 2, 3, 3, 3], ranges: [[0, 2], [0, 5], [3, 5]]))
 print(Day9.maxRepeatCount(input: "aaabbccccddeee")) // 4
 print(Day9.maxRepeatCount(input: "abcde")) // 1
 print(Day9.maxRepeatCount(input: "a")) // 1
 print(Day9.longestPalindrome(input: "babad")) // bab or aba
 print(Day9.longestPalindrome(input: "cbbd")) // bb
 print(Day9.longestPalindrome(input: "a")) // a
 print(Day9.longestPalindrome(input: "abccba")) // abccba
 print(Day9.longestPalindrome(input: "racecarxyz")) // racecar
 print(Day9.longestPalindrome(input: "xyzracecar")) // racecar
 print(Day9.groupAnagrams(["bat", "tab", "cat", "act", "tac", "rat"]))
 /*
  [
    ["bat", "tab"],
    ["cat", "act", "tac"],
    ["rat"]
  ]
  */
 print(Day9.compress("aaabbccccd")) // a3b2c4d
 print(Day9.compress("abcd")) // abcd
 print(Day9.compress("aabbcc")) // a2b2c2
 print(Day9.compress("aaa")) // a3
 print(Day9.reverseWords(in: "Hello World")) // "olleH dlroW"
 print(Day9.reverseWords(in: "Swift is fun")) // "tfiwS si nuf"
 print(Day9.sortWords(["banana", "apple", "dog", "cat", "ant"])) // ["dog", "cat", "ant", "apple", "banana"]
 print(Day9.sortWords(["zebra", "a", "aaa", "abc", "aa"])) // ["a", "aa", "aaa", "abc", "zebra"]
 print(Day9.deduplicateAndSort(["apple", "banana", "apple", "dog", "banana", "cat", "ant"])) // ["ant", "cat", "dog", "apple", "banana"]
 print(Day9.filterPalindromes(["level", "world", "madam", "hello", "noon"])) // ["level", "madam", "noon"]
 print(Day9.filterPalindromes(["apple", "banana", "civic"])) // ["civic"]
 print(Day9.longestPalindromeSubstring("babad")) // "bab" 또는 "aba"
 print(Day9.longestPalindromeSubstring("cbbd")) // "bb"
 */


/*
 Day10
 //print(Day10.minimumSumProduct([1, 1, 1, 6, 0], [2, 7, 8, 3, 1]))
 //print(Day10.minimumSumProduct([1, 1, 3], [10, 30, 20]))
 //print(Day10.minimumSumProduct([1, 2, 3, 4], [5, 5, 5, 5]))
 print(Day10.pokemonLookup(["Pikachu", "Bulbasaur", "Charmander", "Squirtle"], ["2", "Charmander", "Pikachu"]))
 print(Day10.rangeSums([5, 4, 3, 2, 1], [(0, 2), (1, 3), (0, 4)]))
 print(Day10.maxSubarraySum([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
 
 print(Day10.maxKSubarraySum([1, 2, -1, 2, -3, 2, -5, 4], 2)) // 8
 print(Day10.maxKSubarraySum([1, 2, 3, -10, 4, 5, -2, 6], 2)) // 19
 print(Day10.maxKSubarraySum([-1, -2, -3, -4], 1)) // -1
 print(Day10.maxKSubarraySum([2, 1, -1, 3, -2, 2, 1], 3)) // 9
 print(Day10.maxKSubarraySum([5, -1, 5, -1, 5], 2)) // 14

 print(Day10.mostFrequentCharacter("abacabad")) // a
 print(Day10.mostFrequentCharacter("zxyxxzyz")) // x
 print(Day10.mostFrequentCharacter("ccccbbbbaaaa")) // a
 
 print(Day10.largestNumber([3, 30, 34, 5, 9])) // 9534330
 print(Day10.largestNumber([10, 2])) // 210
 print(Day10.largestNumber([0, 0, 0])) // 0
 print(Day10.largestNumber([12, 121])) // 12121
 print(Day10.largestNumber([824, 938, 1399, 5607, 6973, 5703, 9609, 4398, 8247])) // 9609938824824769735703560743981399
 
 */

print(Day10.minimumCoins(1260)) // 6
print(Day10.minimumCoins(770)) // 6
print(Day10.minimumCoins(30)) // 3
print(Day10.minimumCoins(500)) // 1
print(Day10.minimumCoins(380)) // 7


