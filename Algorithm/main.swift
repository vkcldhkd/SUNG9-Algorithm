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

 print(Day10.minimumCoins(1260)) // 6
 print(Day10.minimumCoins(770)) // 6
 print(Day10.minimumCoins(30)) // 3
 print(Day10.minimumCoins(500)) // 1
 print(Day10.minimumCoins(380)) // 7
 
 print(Day10.binarySearch([1, 3, 5, 7, 9, 11], 7)) // 3
 print(Day10.binarySearch([1, 2, 4, 6, 8, 10, 12], 5)) // -1
 print(Day10.binarySearch([10, 20, 30, 40, 50], 10)) // 0
 print(Day10.binarySearch([100, 200, 300, 400, 500], 500)) // 0
 print(Day10.lowerBound([1, 2, 2, 2, 3, 4, 5], 2)) // 2
 
 print(Day10.upperBound([1, 2, 2, 2, 3, 4, 5], 2)) // 3
 print(Day10.upperBound([1, 1, 1, 1], 1)) // 3
 print(Day10.upperBound([1, 3, 5, 7, 9], 4)) // -1
 */




/*
 Day11
 print(Day11.maxProductSubarray([2, 3, -2, 4])) // 6
 print(Day11.maxProductSubarray([-2, 0, -1])) // 0
 print(Day11.maxProductSubarray([-2, 3, -4])) // 24
 print(Day11.maxProductSubarray([2, -5, -2, -4, 3])) // 240

 
 print(Day11.canAttendAllMeetings([[0, 30], [5, 10], [15, 20]])) // false
 print(Day11.canAttendAllMeetings([[7, 10], [2, 4]])) // true
 print(Day11.canAttendAllMeetings([[1, 2], [2, 3], [3, 4]])) // true
 print(Day11.canAttendAllMeetings([[5, 10], [10, 15], [9, 12]])) // false
 
 print(Day11.removeAdjacentDuplicates("aaabbbccdaa")) // abcda
 print(Day11.removeAdjacentDuplicates("aabbccddeeff")) // abcdef
 print(Day11.removeAdjacentDuplicates("ababa")) // ababa
 print(Day11.removeAdjacentDuplicates("aaaaa")) // a
 
 print(Day11.minimumDifference([4, 9, 1, 32, 13])) // 3
 print(Day11.minimumDifference([10, 8, 1, 4])) // 2
 print(Day11.minimumDifference([-10, -8, -20, -15])) // 2
 print(Day11.minimumDifference([3, 3, 3, 3])) // 0
 
 print(Day11.isValidParentheses("(()(")) // false
 print(Day11.isValidParentheses("()()")) // true
 print(Day11.isValidParentheses("(())()")) // true
 print(Day11.isValidParentheses("(()(")) // false
 print(Day11.isValidParentheses("(((((((((((((((((((((((())))))))))))))))))))))))")) // true

 print(Day11.countZeroSumTriplets([-2, 3, 0, 2, -5])) // 2
 print(Day11.countZeroSumTriplets([-3, -2, -1, 0, 1, 2, 3])) // 5
 print(Day11.countZeroSumTriplets([-1, 1, -1, 1])) // 0
 
 print(Day11.countTripletsThatSumTo([1, 2, 3, 4, 5], 9)) // 2
 print(Day11.countTripletsThatSumTo([0, -1, 2, -3, 1], 0)) // 2
 print(Day11.countTripletsThatSumTo([1, 1, 1, 1], 3)) // 4
 
 print(Day11.minimumDifferenceBetweenTwoNumbers([4, 9, 1, 32, 13])) // 3
 print(Day11.minimumDifferenceBetweenTwoNumbers([-10, -20, -30, -40])) // 10
 print(Day11.minimumDifferenceBetweenTwoNumbers([1, 1000000])) // 999999
 
 print(Day11.countPairsWithProductK([1, 2, 3, 4, 6], 6)) // 2
 print(Day11.countPairsWithProductK([-2, -3, 6, 1, -1], 6)) // 2
 print(Day11.countPairsWithProductK([2, 3, 6, 1], 6)) // 2
 print(Day11.countPairsWithProductK([2, 2, 3, 3], 6)) // 4
 
 print(Day11.rangeSums([1, 2, 3, 4, 5], [(0, 2), (1, 3), (2, 4)])) // 6, 9, 12
 print(Day11.rangeSums([10, -2, 5, 7, -3], [(0, 4), (1, 2), (3, 4)])) // 17, 3, 4

 print(Day11.countEvenInRanges([1, 2, 3, 4, 5, 6], [(0, 3), (1, 5), (2, 2)])) // 2, 3, 0
 print(Day11.countEvenInRanges([2, 4, 6, 8], [(0, 3), (1, 2)])) // 4, 2
 print(Day11.countEvenInRanges([1, 3, 5, 7], [(0, 2), (1, 3)])) // 0, 0
 
 print(Day11.countTargetInRanges(
     [1, 2, 3, 2, 2, 4, 2],
     2,
     [(0, 3), (2, 5), (0, 6)]
 )) // 2, 2, 4

 print(Day11.countTargetInRanges(
     [5, 5, 5, 5, 5],
     5,
     [(0, 4), (1, 3), (2, 2)]
 )) // 5, 3, 1

 print(Day11.countTargetInRanges(
     [1, 3, 1, 3, 1],
     2,
     [(0, 4), (1, 2)]
 )) // 0, 0
 
 print(Day11.isACountMoreThanB(
     [1, 2, 1, 3, 1, 2, 2],
     1,
     2,
     [(0, 3), (1, 5), (0, 6)]
 )) // true, false, false

 print(Day11.isACountMoreThanB(
     [4, 4, 4, 4],
     4,
     5,
     [(0, 3), (1, 2)]
 )) // true, true

 print(Day11.isACountMoreThanB(
     [1, 2, 3, 4, 5],
     6,
     3,
     [(0, 4)]
 )) // false
 
 print(Day11.maxSumOfFixedWindow([1, 2, 3, 4, 5], 2)) // 9
 print(Day11.maxSumOfFixedWindow([5, 4, -1, 7, 8], 3)) // 14
 print(Day11.maxSumOfFixedWindow([-2, -3, -1, -5], 2)) // -4
 
 print(Day11.maxAverageOfFixedWindow(
     [1, 12, -5, -6, 50, 3],
     4
 )) // 12.75

 print(Day11.maxAverageOfFixedWindow(
     [5, 5, 5, 5],
     2
 )) // 5.0

 print(Day11.maxAverageOfFixedWindow(
     [-1, -12, -5, -6, -50, -3],
     3
 )) // -6.0
 
 print(Day11.countMaxSumWindows([1, 2, 3, 2, 1], 2)) // 2
 print(Day11.countMaxSumWindows([1, 1, 1, 1], 2)) // 3
 print(Day11.countMaxSumWindows([2, 1, 2, 1, 2], 2)) // 4
 
 print(Day11.maxOddCountInFixedWindow([1, 2, 3, 4, 5], 3)) // 2
 print(Day11.maxOddCountInFixedWindow([2, 4, 6, 8, 10], 2)) // 0
 print(Day11.maxOddCountInFixedWindow([1, 3, 5, 7, 9], 3)) // 3
 print(Day11.minSumWindowStartIndex([7, 1, 3, 4, 9, 2], 2)) // 1
 print(Day11.minSumWindowStartIndex([5, 4, 3, 2, 1], 3)) // 2
 print(Day11.minSumWindowStartIndex([1, 2, 1, 2, 1], 2)) // 0
 */


/*
 Day12
 
 print(Day12.maxUniqueCountInFixedWindow([1, 2, 1, 3, 4, 2, 3], 4)) // 4
 print(Day12.maxUniqueCountInFixedWindow([1, 1, 1, 1], 2)) // 1
 print(Day12.maxUniqueCountInFixedWindow([1, 2, 3, 4, 5], 3)) // 3
 
 print(Day12.maxFrequencyInFixedWindow([1, 2, 2, 3, 1, 2], 3)) // 2
 print(Day12.maxFrequencyInFixedWindow([4, 4, 4, 4], 2)) // 2
 print(Day12.maxFrequencyInFixedWindow([1, 2, 3, 4, 5], 2)) // 1
 
 print(Day12.maxEvenOddDiffInFixedWindow([1, 2, 3, 4, 5, 6], 3)) // 1
 print(Day12.maxEvenOddDiffInFixedWindow([2, 4, 6, 1, 3], 2)) // 2
 print(Day12.maxEvenOddDiffInFixedWindow([1, 1, 1, 1], 2)) // -2
 
 print(Day12.maxConsecutiveEvensInFixedWindow([2, 4, 1, 6, 8, 5], 4)) // 2
 print(Day12.maxConsecutiveEvensInFixedWindow([1, 3, 5, 7, 2, 4], 3)) // 2
 print(Day12.maxConsecutiveEvensInFixedWindow([1, 2, 4, 6, 8, 1], 5)) // 4
 
 print(Day12.maxNegativeCountInFixedWindow([-1, 2, -3, 4, -5, -6], 3)) // 2
 print(Day12.maxNegativeCountInFixedWindow([1, 2, 3, -1, -2], 2)) // 2
 print(Day12.maxNegativeCountInFixedWindow([-1, -2, -3, -4, -5], 4)) // 4
 
 print(Day12.minEvenCountInFixedWindow([1, 2, 3, 4, 5], 3)) // 1
 print(Day12.minEvenCountInFixedWindow([2, 4, 6, 8, 10], 2)) // 2
 print(Day12.minEvenCountInFixedWindow([1, 3, 5, 7], 2)) // 0
 
 print(Day12.maxAbsEvenOddDiffInFixedWindow([1, 2, 3, 4, 5], 3)) // 1
 print(Day12.maxAbsEvenOddDiffInFixedWindow([2, 4, 6, 8, 10], 2)) // 2
 print(Day12.maxAbsEvenOddDiffInFixedWindow([1, 3, 5, 7], 2)) // 2
 
 print(Day12.hasPivotIndex([1, 7, 3, 6, 5, 6])) // true
 print(Day12.hasPivotIndex([1, 2, 3])) // false
 print(Day12.hasPivotIndex([2, 1, -1])) // true
 
 print(Day12.missingInteger([1, 3, 6, 4, 1, 2])) // 5
 print(Day12.missingInteger([1, 2, 3])) // 4
 print(Day12.missingInteger([-1, -3])) // 1
 */

/*
 Day13
 print(Day13.findMissingPositive([1, 3, 6, 4, 1, 2])) // 5
 print(Day13.findMissingPositive([1, 2, 3])) // 4
 print(Day13.findMissingPositive([-1, -3])) // 1

 print(Day13.lengthOfLongestSubstring("abcabcbb")) // 3
 print(Day13.lengthOfLongestSubstring("bbbbb")) // 1
 print(Day13.lengthOfLongestSubstring("pwwkew")) // 3
 
 print(Day13.lengthOfLongestSubstringKDistinct("eceba", 2))

 print(Day13.maxSumSubarrayOfSizeK([2, 1, 5, 1, 3, 2], 3)) // 9
 print(Day13.maxSumSubarrayOfSizeK([1, 9, -1, -2, 7, 3], 2)) // 10
 print(Day13.maxSumSubarrayOfSizeK([5, 2, 1, 8, 3, 2], 3)) // 13
 
 print(Day13.minSubArrayLen(7, [2, 3, 1, 2, 4, 3])) // 2
 print(Day13.minSubArrayLen(15, [1, 2, 3, 4, 5])) // 5
 print(Day13.minSubArrayLen(100, [1, 1, 1, 1])) // 0

 print(Day13.countSubarraysLessThanTarget([1, 2, 3], 5)) // 4
 print(Day13.countSubarraysLessThanTarget([1, 1, 1], 3)) // 5
 print(Day13.countSubarraysLessThanTarget([2, 1, 1, 3], 4)) // 6

 print(Day13.windowSums([1, 2, 3, 4, 5], 3)) // [6, 9, 12]
 print(Day13.windowSums([10, 20, 30, 40], 2)) // [30, 50, 70]
 print(Day13.windowSums([7, 8, 9], 1)) // [7, 8, 9]

 print(Day13.maxSumSubarrayWithIndex([1, 4, 2, 10, 23, 3, 1, 0, 20], 4)) // (39, 1)
 print(Day13.maxSumSubarrayWithIndex([2,3], 2)) // (39, 1)
 print(Day13.maxSumSubarrayWithIndex([5, -1, 2, 6, -2, 4], 3)) // (9, 2)

 print(Day13.longestSubarraySumLEQ([1, 2, 1, 0, 1, 1, 0], 4)) // 4
 print(Day13.longestSubarraySumLEQ([1, 2, 3, 4, 5], 11)) // 4
 print(Day13.longestSubarraySumLEQ([5, 1, 3, 5, 2, 1, 1, 1], 8)) // 4

 print(Day13.longestOnesWithKFlips([1, 1, 0, 0, 1, 1, 1, 0], 2)) // 7
 print(Day13.longestOnesWithKFlips([0, 0, 1, 1, 1, 0, 0], 1)) // 4
 print(Day13.longestOnesWithKFlips([1, 1, 1, 1], 0)) // 4

 print(Day13.findMaxAverage([1, 12, -5, -6, 50, 3], 4)) // 12.75
 print(Day13.findMaxAverage([5], 1)) // 5
 print(Day13.findMaxAverage([0, 4, 0, 3, 2], 2)) // 2.5
 */


/*
 Day14
 
 print(Day14.numSubarrayProductLessThanK([10, 5, 2, 6], 100)) // 8
 print(Day14.numSubarrayProductLessThanK([1, 2, 3], 0)) // 0
 print(Day14.numSubarrayProductLessThanK([1, 1, 1], 2)) // 6

 print(Day14.lengthOfLongestSubstringKDistinct("eceba", 2)) // 3
 print(Day14.lengthOfLongestSubstringKDistinct("aa", 1)) // 2
 print(Day14.lengthOfLongestSubstringKDistinct("aabbcc", 1)) // 2

 print(Day14.lengthOfLongestSubstring("abcabcbb")) // 3
 print(Day14.lengthOfLongestSubstring("bbbbb")) // 1
 print(Day14.lengthOfLongestSubstring("pwwkew")) // 3
 
 print(Day14.characterReplacement("ABAB", 2)) // 4
 print(Day14.characterReplacement("AABABBA", 1)) // 4
 print(Day14.characterReplacement("ABCDE", 1)) // 2
 
 print(Day14.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2)) // 6
 print(Day14.longestOnes([0,0,1,1,1,0,0], 0)) // 3
 print(Day14.longestOnes([1,0,1,0,1], 1)) // 3
 
 print(Day14.longestOnesIII([1,1,0,0,1,1,1,0,1], 2)) // 7
 print(Day14.longestOnesIII([0,0,0,1], 1)) // 2
 print(Day14.longestOnesIII([1,1,1,1], 0)) // 4
 
 print(Day14.numberOfSubarrays([1,1,2,1,1], 3)) // 2
 print(Day14.numberOfSubarrays([2,4,6], 1)) // 0
 print(Day14.numberOfSubarrays([2,2,2,1,2,2,1,2,2,2,1,2], 3)) // 8
 
 print(Day14.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)) // [3,3,5,5,6,7]
 print(Day14.maxSlidingWindow([9, 11], 2)) // [11]
 print(Day14.maxSlidingWindow([4, -2], 2)) // [4]

 print(Day14.minSubArrayLen(7, [2,3,1,2,4,3])) // 2
 print(Day14.minSubArrayLen(11, [1,1,1,1,1,1,1])) // 0
 print(Day14.minSubArrayLen(4, [1,4,4])) // 1
 */

/*
 Day15
 print(Day15.minSubArrayLen(7, [1, 1, 1, 1, 7])) // 1
 print(Day15.minSubArrayLen(8, [2, 3, 1, 2, 4, 3])) // 3
 print(Day15.minSubArrayLen(11, [1, 2, 3, 4, 5])) // 3
 
 print(Day15.subarraySum([1, 1, 1], 2)) // 2
 print(Day15.subarraySum([1, 2, 3], 3)) // 2
 print(Day15.subarraySum([3, 4, 7, -2, 2, 1, 4], 7)) // 4
 
 print(Day15.subarraysWithKOccurrences([1, 2, 1, 2, 1], 1, 2)) // 4
 print(Day15.subarraysWithKOccurrences([1, 1, 1, 1], 1, 3)) // 2
 print(Day15.subarraysWithKOccurrences([2, 3, 4], 3, 1)) // 4
 
 print(Day15.countSubarraysWithKOnes([1, 0, 1, 0, 1], 2)) // 4
 print(Day15.countSubarraysWithKOnes([1, 1, 1, 1], 2)) // 3
 print(Day15.countSubarraysWithKOnes([0, 0, 0, 0], 0)) // 8
 
 print(Day15.countSubarraysWithMaxFrequencyAtMostK([1, 2, 1], 2)) // 6
 print(Day15.countSubarraysWithMaxFrequencyAtMostK([1, 1, 1, 2, 2], 2)) // 8
 */


/*
 Day16
 
 print(Day16.countSubarraysWithSumExactlyK([1, 1, 1], 2)) // 2
 print(Day16.countSubarraysWithSumExactlyK([1, 2, 3], 3)) // 2
 print(Day16.countSubarraysWithSumExactlyK([3, 4, 7, -2, 2, 1, 4], 7)) // 4
 
 print(Day16.countEvenSumSubarrays([1, 2, 3, 4])) // 4
 
 print(Day16.countBalancedEvenOddSubarrays([1, 2, 3, 4])) // 4
 print(Day16.countBalancedEvenOddSubarrays([1, 2, 1, 2])) // 4
 
 print(Day16.countBalancedBinarySubarrays([0, 1, 0, 1])) // 4
 print(Day16.countBalancedBinarySubarrays([0, 0, 1, 1])) // 2
 print(Day16.countBalancedBinarySubarrays([1, 1, 1])) // 0
 
 print(Day16.countBalancedPosNegSubarrays([1, -1, 1, -1])) // 4
 print(Day16.countBalancedPosNegSubarrays([1, 1, -1, -1])) // 2
 print(Day16.countBalancedPosNegSubarrays([-1, -1, -1])) // 0
 
 print(Day16.countBalancedPairSubarrays([1, 2, 1, 2, 1], 1, 2)) // 4
 print(Day16.countBalancedPairSubarrays([1, 2, 3, 1, 2], 1, 2)) // 4
 print(Day16.countBalancedPairSubarrays([3, 3, 3], 1, 2)) // 0
 
 print(Day16.countBalancedTripleSubarrays([1, 2, 3, 1, 2, 3], 1, 2, 3)) // 5
 print(Day16.countBalancedTripleSubarrays([1, 2, 1, 2, 3, 3], 1, 2, 3)) // 2
 print(Day16.countBalancedTripleSubarrays([1, 1, 1, 1], 1, 2, 3)) // 0
 
 print(Day16.maxBalancedPairSubarrayCount([1, 2, 1, 3, 2, 1, 3])) // 5
 print(Day16.maxBalancedPairSubarrayCount([4, 4, 4, 4])) // 0
 print(Day16.maxBalancedPairSubarrayCount([5, 1, 5, 1, 5, 1])) // 6
 
 print(Day16.countSubarraysWithZeroOneRatio([0, 1, 1, 0, 0, 1])) // 4
 print(Day16.countSubarraysWithZeroOneRatio([1, 1, 0, 0, 1, 0])) // 4
 print(Day16.countSubarraysWithZeroOneRatio([1, 0, 1, 0, 1, 0])) // 4
 
 print(Day16.countSubarraysWithOneDuplicate([1, 2, 1, 2, 3])) // 0
 print(Day16.countSubarraysWithOneDuplicate([4, 5, 4, 6, 5])) // 0
 print(Day16.countSubarraysWithOneDuplicate([7, 7, 7])) // 2
 */


/*
 Day17
 print(Day17.countUniqueSubarrays([1, 2, 1, 3])) // 8
 print(Day17.countUniqueSubarrays([1, 2, 3, 4])) // 10
 print(Day17.countUniqueSubarrays([2, 2, 2])) // 3

 print(Day17.countAllEvenSubarrays([2, 1, 4, 6])) // 4
 print(Day17.countAllEvenSubarrays([1, 3, 5])) // 0
 print(Day17.countAllEvenSubarrays([2, 4, 1, 6, 8])) // 4

 print(Day17.countAllOddSubarrays([1, 3, 5])) // 6
 print(Day17.countAllOddSubarrays([1, 2, 3, 5])) // 4
 print(Day17.countAllOddSubarrays([2, 4, 6])) // 0
 print(Day17.countAllOddSubarrays([1, 3, 2, 5, 7])) // 6
 
 print(Day17.countSubarraysWithAtLeastThreeOnes([1, 1, 1, 0, 1, 1, 1, 1])) // 12
 print(Day17.countSubarraysWithAtLeastThreeOnes([1, 0, 1, 1, 1, 0, 1, 1])) // 3
 print(Day17.countSubarraysWithAtLeastThreeOnes([1, 1, 0, 1, 1])) // 0
 
 print(Day17.countEvenSumSubarrays([1, 2, 3])) // 2
 print(Day17.countEvenSumSubarrays([2, 4, 6])) // 6
 print(Day17.countEvenSumSubarrays([1, 3, 5])) // 2
 
 print(Day17.countSubarraysWithSumMultipleOfK([1, 2, 3, 4, 5], 3)) // 4
 print(Day17.countSubarraysWithSumMultipleOfK([2, 4, 6, 8], 4)) // 4
 print(Day17.countSubarraysWithSumMultipleOfK([5, 5, 5], 5)) // 6

 print(Day17.countSubarraysWithSumModuloOne([1, 2, 3, 4, 5], 3)) // 4
 print(Day17.countSubarraysWithSumModuloOne([5, 7, 1, 3], 4)) // 3
 print(Day17.countSubarraysWithSumModuloOne([1, 1, 1], 2)) // 4

 print(Day17.lengthOfLongestSubstring("abcabcbb")) // 3
 print(Day17.lengthOfLongestSubstring("bbbbb")) // 1
 print(Day17.lengthOfLongestSubstring("pwwkew")) // 3

 print(Day17.mostFrequent([1, 3, 1, 3, 2, 1])) // 1
 print(Day17.mostFrequent([4, 5, 6, 5, 4, 3])) // 4
 print(Day17.mostFrequent([7, 8, 9, 10])) // 7

 print(Day18.twoSum([2, 7, 11, 15], 9)) // [0, 1]
 print(Day18.twoSum([3, 2, 4], 6)) // [1, 2]
 print(Day18.twoSum([3, 3], 6)) // [0, 1]

 print(Day18.countSubarraysWithSumExactlyK([1, 1, 1], 2)) // 2
 print(Day18.countSubarraysWithSumExactlyK([1, 2, 3], 3)) // 2
 print(Day18.countSubarraysWithSumExactlyK([3, 4, 7, 2, -3, 1, 4, 2], 7)) // 4

 print(Day18.countSubarraysWithSumMultipleOfK([1, 2, 3, 4, 5], 3)) // 4
 print(Day18.countSubarraysWithSumMultipleOfK([5, 7, 1, 3], 4)) // 2
 print(Day18.countSubarraysWithSumMultipleOfK([1, 1, 1], 2)) // 0

 print(Day18.countSubarraysWithSumAtMostK([1, 2, 3], 4)) // 4
 print(Day18.countSubarraysWithSumAtMostK([2, 1, 1, 1], 3)) // 8
 print(Day18.countSubarraysWithSumAtMostK([3, 1, 2, 1], 3)) // 5
 
 print(Day18.countSubarraysWithEvenSum([1, 2, 3, 4])) // 4
 print(Day18.countSubarraysWithEvenSum([2, 2, 2])) // 6
 print(Day18.countSubarraysWithEvenSum([1, 3, 5])) // 2
 print(Day18.countSubarraysWithEvenSum([-1, -1, -1, -1])) // 4
 
 print(Day18.countSubarraysWithMedianK([3, 2, 1, 4, 5], 4)) // 3
 print(Day18.countSubarraysWithMedianK([2, 3, 1], 3)) // 1
 print(Day18.countSubarraysWithMedianK([5, 5, 5, 5], 5)) // 10

 print(Day18.countSubarraysWithSumExactlyK2([1, 1, 1], 2)) // 2
 print(Day18.countSubarraysWithSumExactlyK2([1, 2, 3], 3)) // 2
 print(Day18.countSubarraysWithSumExactlyK2([3, 4, 7, 2, -3, 1, 4, 2], 7)) // 4

 print(Day18.maxLengthSubarrayWithSumK([1, -1, 5, -2, 3], 3)) // 4
 print(Day18.maxLengthSubarrayWithSumK([-2, -1, 2, 1], 1)) // 2
 print(Day18.maxLengthSubarrayWithSumK([1, 2, 3], 3)) // 2

 print(Day18.minLengthSubarrayWithSumExactlyK([1, 2, 3, 4, 5], 9)) // 2
 print(Day18.minLengthSubarrayWithSumExactlyK([1, 1, 1, 1, 1, 1], 3)) // 3
 print(Day18.minLengthSubarrayWithSumExactlyK([2, 4, 6, 10], 100)) // 0
 
 print(Day18.minLengthSubarrayWithSumAtLeastK([2, 3, 1, 2, 4, 3], 7)) // 2
 print(Day18.minLengthSubarrayWithSumAtLeastK([1, 4, 4], 4)) // 1
 print(Day18.minLengthSubarrayWithSumAtLeastK([1, 1, 1, 1, 1, 1, 1, 1], 11)) // 0
 
 print(Day18.shortestSubarrayWithSumAtLeastK([2, 3, 1, 2, 4, 3], 7)) // [4, 3]
 print(Day18.shortestSubarrayWithSumAtLeastK([1, 4, 4], 4)) // [4]
 print(Day18.shortestSubarrayWithSumAtLeastK([1, 1, 1, 1, 1, 1, 1, 1], 11)) // []
 
 print(Day18.findAllSubarraysWithSumExactlyK([1, 2, 3, 2, 1], 5)) // [[2, 3], [3, 2]
 print(Day18.findAllSubarraysWithSumExactlyK([1, 1, 1], 2)) // [[1, 1], [1, 1]]
 print(Day18.findAllSubarraysWithSumExactlyK([2, 4, 6], 8)) // []
 */


/*
 Day19
 
 print(Day19.shortestSubarrayWithSumAtLeastK([2, 3, 1, 2, 4, 3], 7)) // 2
 print(Day19.shortestSubarrayWithSumAtLeastK([1, 1, 1, 1, 1, 1, 1], 11)) // 0
 print(Day19.shortestSubarrayWithSumAtLeastK([1, 4, 4], 4)) // 1
 
 print(Day19.countSubarraysWithSumAtMostK([1, 2, 3], 4)) // 4
 print(Day19.countSubarraysWithSumAtMostK([2, 1, 1, 1], 3)) // 8
 print(Day19.countSubarraysWithSumAtMostK([3, 1, 2, 1], 3)) // 6
 
 print(Day19.findAllSubarraysWithSumExactlyK([1, 2, 3, 2, 1], 5)) // [[2, 3], [3, 2]]
 print(Day19.findAllSubarraysWithSumExactlyK([1, 1, 1], 2)) // [[1, 1], [1, 1]]
 print(Day19.findAllSubarraysWithSumExactlyK([2, 4, 6], 8)) // []
 
 print(Day19.countSubarraysWithSumExactlyK([1, 2, 3], 3)) // 2
 print(Day19.countSubarraysWithSumExactlyK([1, 1, 1], 2)) // 2
 print(Day19.countSubarraysWithSumExactlyK([3, 4, 7, -2, 2, 1, 4, 2], 7)) // 6
 
 print(Day19.maxLengthSubarrayWithSumExactlyK([1, -1, 5, -2, 3], 3)) // 4
 print(Day19.maxLengthSubarrayWithSumExactlyK([-2, -1, 2, 1], 1)) // 2
 print(Day19.maxLengthSubarrayWithSumExactlyK([1, 2, 3], 6)) // 3
 
 print(Day19.minLengthSubarrayWithSumExactlyK([1, -1, 5, -2, 3], 3)) // 1
 print(Day19.minLengthSubarrayWithSumExactlyK([-2, -1, 2, 1], 1)) // 1
 print(Day19.minLengthSubarrayWithSumExactlyK([1, 2, 3], 7)) // 0
 */


/*
 Day20
 
 print(Day20.maxLengthSubarrayWithSumAtMostK([1, 2, 3], 3)) // 2
 print(Day20.maxLengthSubarrayWithSumAtMostK([2, 1, 1, 1], 3)) // 3
 print(Day20.maxLengthSubarrayWithSumAtMostK([3, 1, 2, 1], 3)) // 2
 
 print(Day20.minLengthSubarrayWithElementAtLeastKCount([1, 2, 2, 3, 1], 2)) // 3
 print(Day20.minLengthSubarrayWithElementAtLeastKCount([1, 1, 1, 1], 3)) // 3
 print(Day20.minLengthSubarrayWithElementAtLeastKCount([1, 2, 3], 2)) // 0
 
 print(Day20.minLengthSubarrayWithElementExactlyKCount([1, 2, 2, 3, 1], 2)) // 2
 print(Day20.minLengthSubarrayWithElementExactlyKCount([1, 1, 1, 1], 3)) // 3
 print(Day20.minLengthSubarrayWithElementExactlyKCount([1, 2, 3], 2)) // 0
 
 print(Day20.maxLengthSubarrayWithEachElementAtMostK([1, 2, 2, 3, 1, 4], 2)) // 6
 print(Day20.maxLengthSubarrayWithEachElementAtMostK([1, 1, 1, 2, 2, 3], 2)) // 5
 print(Day20.maxLengthSubarrayWithEachElementAtMostK([4, 4, 4, 4], 1)) // 1
 
 print(Day20.maxLengthSubarrayWithSomeElementExactlyK([1, 2, 2, 3, 1, 4], 2)) // 6
 print(Day20.maxLengthSubarrayWithSomeElementExactlyK([1, 1, 1, 2, 2, 3, 3], 2)) // 7
 print(Day20.maxLengthSubarrayWithSomeElementExactlyK([4, 4, 4, 4], 3)) // 3
 
 print(Day20.characterReplacement("ABAB", 2)) // 4
 print(Day20.characterReplacement("AABABBA", 1)) // 4
 print(Day20.characterReplacement("ABAA", 0)) // 2
 
 print(Day20.lengthOfLongestSubstringTwoDistinct("eceba")) // 3
 print(Day20.lengthOfLongestSubstringTwoDistinct("ccaabbb")) // 5
 print(Day20.lengthOfLongestSubstringTwoDistinct("aaaaa")) // 5
 
 print(Day20.lengthOfLongestSubstringAtMostKDistinct("eceba", 2)) // 3
 print(Day20.lengthOfLongestSubstringAtMostKDistinct("aaabbcc", 1)) // 3
 print(Day20.lengthOfLongestSubstringAtMostKDistinct("aabbcc", 3)) // 6
 
 print(Day20.lengthOfLongestSubstringExactlyKDistinct("eceba", 2)) // 3
 print(Day20.lengthOfLongestSubstringExactlyKDistinct("aaabbcc", 1)) // 3
 print(Day20.lengthOfLongestSubstringExactlyKDistinct("aabbcc", 3)) // 6
 print(Day20.lengthOfLongestSubstringExactlyKDistinct("aabbcc", 2)) // 4
 
 print(Day20.lengthOfLongestSubstringExactlyKUnique("abcabcbb", 2)) // 4
 print(Day20.lengthOfLongestSubstringExactlyKUnique("AaAaBbBb", 2)) // 4
 print(Day20.lengthOfLongestSubstringExactlyKUnique("a1b2c3d4", 4)) // 4
 
 print(Day20.lengthOfLongestSubstringWithoutRepeating("abcabcbb")) // 3
 print(Day20.lengthOfLongestSubstringWithoutRepeating("bbbbb")) // 1
 print(Day20.lengthOfLongestSubstringWithoutRepeating("pwwkew")) // 3
 */


/*
 Day21
 print(Day21.twoSum([2, 7, 11, 15], 9)) // [0, 1]
 print(Day21.twoSum([3, 2, 4], 6)) // [1, 2]
 print(Day21.twoSum([3, 3], 6)) // [0, 1]
 
 print(Day21.isAnagram("anagram", "nagaram")) // true
 print(Day21.isAnagram("rat", "car")) // false
 print(Day21.isAnagram("aacc", "ccac")) // false
 
 print(Day21.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])) // [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
 print(Day21.groupAnagrams([""])) // [[""]]
 print(Day21.groupAnagrams(["a"])) // [["a"]]
 
 print(Day21.characterReplacement("ABAB", 2)) // 4
 print(Day21.characterReplacement("AABABBA", 1)) // 4
 print(Day21.characterReplacement("AAAA", 2)) // 4
 
 print(Day21.lengthOfLongestSubstringAtMostKDistinct("eceba", 2)) // 3
 print(Day21.lengthOfLongestSubstringAtMostKDistinct("aaabbcc", 1)) // 3
 print(Day21.lengthOfLongestSubstringAtMostKDistinct("aabbcc", 2)) // 4
 
 print(Day21.lengthOfLongestSubstringExactlyKDistinct("aaabcbbcc", 2)) // 6
 print(Day21.lengthOfLongestSubstringExactlyKDistinct("aabbccddeeff", 3)) // 6
 print(Day21.lengthOfLongestSubstringExactlyKDistinct("a", 1)) // 1
 
 print(Day21.longestSubarrayWithExactlyKDistinct([1, 2, 1, 2, 3], 2)) // 4
 print(Day21.longestSubarrayWithExactlyKDistinct([1, 2, 1, 3, 4], 3)) // 3
 print(Day21.longestSubarrayWithExactlyKDistinct([1, 1, 1, 1], 1)) // 4
 */

print(Day21.longestSubarrayWithMaxKRepeats([1, 2, 2, 3, 3, 3, 4], 2)) // 5
print(Day21.longestSubarrayWithMaxKRepeats([1, 1, 1, 1], 2)) // 2
print(Day21.longestSubarrayWithMaxKRepeats([1, 2, 3, 4, 5], 1)) // 5

