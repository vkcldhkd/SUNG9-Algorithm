//
//  Day9.swift
//  Algorithm
//
//  Created by HYUN SUNG on 6/22/25.
//

enum Day9 { }

extension Day9 {
    /*
     ✅ 문제: 최빈값 구하기1 (단일 최빈값만 존재)
     🧾 설명
     정수 배열이 주어졌을 때, 가장 많이 등장한 수(=최빈값)를 구하시오.
     최빈값이 여러 개일 경우, 그 중 가장 작은 수를 반환하세요.

     🧠 예시
     Input: [1, 3, 1, 3, 2, 1]
     Output: 1

     Input: [4, 5, 4, 6, 5, 6]
     Output: 4   // 모든 수가 2번씩 등장 → 가장 작은 수 선택
     */
    
    static func mode1(of: [Int]) -> Int {
        var modeDict: [Int: Int] = [:]
        of.forEach { modeDict[$0, default: 0] += 1 }
        
        let maxValue = modeDict.values.max() ?? 0
        
        return modeDict
            .filter { $0.value == maxValue }
            .sorted { $0.key < $1.key }
            .first?.key ?? 0
    }
    
    /*
     ✅ 문제: 최빈값 구하기2
     🧾 설명
     최빈값은 주어진 값 중에서 가장 자주 나오는 값을 의미합니다.
     정수배열 array가 매개변수로 주어질 때, 최빈값을 구하시오.
     
     🧠 예시
     Input: [1, 2, 3, 3, 3, 4]
     Output: 3

     Input: [1, 1, 2, 2]
     Output: -1
     
     Input: [1]
     Output: 1
     */
    
    static func mode2(of: [Int]) -> Int {
        var modeDict: [Int: Int] = [:]
        of.forEach { modeDict[$0, default: 0] += 1 }
        
        let maxValue = modeDict.values.max() ?? 0
        
        let sortedModeDict = modeDict
            .filter { $0.value == maxValue }
            .sorted { $0.key < $1.key }
        
        if sortedModeDict.count == 1 {
            return sortedModeDict.first?.value ?? 0
        } else {
            return -1
        }
    }
    
    /*
     ✅ 문제: 최빈값 구하기 3 — 구간 내 최빈값
     🧾 설명
     정수 배열 nums와 쿼리 배열 ranges가 주어집니다.
     각 쿼리는 [start, end] 형태이며, 이는 nums[start...end] 구간 내에서의 최빈값을 구하는 것입니다.
     최빈값이 여러 개일 경우 가장 작은 값을 리턴하고,
     모든 수의 빈도가 동일하다면 -1을 리턴하세요.

     🧠 입력 예시
     nums = [1, 2, 2, 3, 3, 3]
     ranges = [[0, 2], [0, 5], [3, 5]]
     
     🧠 출력 예시
     [2, 3, 3]
     [0, 2] → [1, 2, 2] → 2가 최빈값

     [0, 5] → [1, 2, 2, 3, 3, 3] → 3이 최빈값

     [3, 5] → [3, 3, 3] → 3
     */
    static func mode3(nums: [Int], ranges: [[Int]]) -> [Int] {
        func findModeValue(of: [Int]) -> Int {
            var modeDict: [Int: Int] = [:]
            of.forEach { modeDict[$0, default: 0] += 1 }
            
            let maxValue = modeDict.values.max() ?? 0
            let filteredModeDict = modeDict.filter { $0.value == maxValue }
            if filteredModeDict.count == 1 {
                return filteredModeDict.first?.key ?? 0
            } else {
                return filteredModeDict.keys.min() ?? 0
            }
        }
        
        var modeArray: [Int] = []
        
        ranges.forEach {
            let min = $0.min() ?? 0
            let max = $0.max() ?? 0
            let findModeValue = findModeValue(of: Array(nums[min...max]))
            modeArray.append(findModeValue)
        }
        
        return modeArray
    }
    
    /*
     ✅ 문제: 가장 긴 연속 문자 찾기
     🧾 설명
     영어 소문자로 이루어진 문자열 s가 주어질 때,
     같은 문자가 연속으로 가장 많이 등장한 횟수를 구하시오.

     🧠 입력 예시
     Input: "aaabbccccddeee"
     Output: 4
     // 'c'가 연속으로 4번 등장함
     
     Input: "abcde"
     Output: 1
     // 모든 문자가 한 번씩만 등장

     Input: "a"
     Output: 1
     
     📌 제약 조건
     문자열 길이: 1 <= s.count <= 100_000
     문자열은 오직 소문자(a~z)로만 구성됨
     */
    
    static func maxRepeatCount(input: String) -> Int {
        var maxCount = 0
        var currentCount = 1
        var previousChar: Character? = nil

        input.forEach { char in
            if char == previousChar {
                currentCount += 1
            } else {
                maxCount = max(maxCount, currentCount)
                currentCount = 1
            }
            previousChar = char
        }
        maxCount = max(maxCount, currentCount) // 마지막 문자까지 고려
        return maxCount
    }
    
    /*
     ✅ 문제: 가장 긴 부분 팰린드롬 찾기
     🧾 설명
     문자열 s가 주어질 때,
     그 안에서 가장 긴 팰린드롬 부분 문자열을 찾아 반환하시오.

     🧠 입력 예시
     Input: "babad"
     Output: "bab"  // 또는 "aba"도 정답

     Input: "cbbd"
     Output: "bb"
     📌 조건
     1 <= s.count <= 1,000

     반환값은 원래 문자열 내의 부분 문자열이어야 함

     복수의 해가 있을 경우 아무거나 반환 가능
     */
    
    static func longestPalindrome(input: String) -> String {
        func findPalindrome(str: String) -> Bool {
            return str == String(str.reversed())
        }
        
        var result = ""
        
        for i in 0 ..< input.count {
            for j in i ..< input.count {
                let start = input.index(input.startIndex, offsetBy: i)
                let end = input.index(input.startIndex, offsetBy: j)
                let substr = String(input[start...end])
                
                if findPalindrome(str: substr), substr.count > result.count {
                    result = substr
                }
            }
        }
        return result
    }
    
    /*
     ✅ 문제: 애너그램 그룹 묶기
     🧾 설명
     문자열 배열 words가 주어질 때,
     서로 애너그램인 단어끼리 묶어서 반환하시오.
     단, 각 그룹 내 단어 순서는 상관없지만, 전체 그룹은 순서대로 정렬하지 않아도 됨.

     🧠 예시
     Input: ["bat", "tab", "cat", "act", "tac", "rat"]

     Output:
     [
       ["bat", "tab"],
       ["cat", "act", "tac"],
       ["rat"]
     ]
     "bat"와 "tab"은 애너그램

     "cat", "act", "tac"도 애너그램

     "rat"은 독립

     📌 제약 조건
     words.count <= 10,000

     words[i].count <= 100

     모든 문자열은 소문자 알파벳으로 구성됨
     */
    static func groupAnagrams(_ words: [String]) -> [[String]] {
        var result: [String: [String]] = [:]
        
        for word in words {
            let sortedWord = String(word.sorted())
            result[sortedWord, default: []].append(word)
        }
        return result.map { $0.value }
    }
    
    /*
     ✅ 문제: 문자열 압축 (Run-Length Encoding)
     🧾 설명
     문자열 s가 주어졌을 때,
     연속된 같은 문자를 하나로 압축하면서 그 횟수를 붙인 문자열을 리턴하시오.
     단, 한 번만 등장한 문자는 숫자를 생략합니다.

     🧠 예시
     Input: "aaabbccccd"
     Output: "a3b2c4d"
    
     Input: "abcd"
     Output: "abcd"
     
     Input: "aabbcc"
     Output: "a2b2c2"

     Input: "aaa"
     Output: "a3"
     */
    
    static func compress(_ input: String) -> String {
        func createString(
            previousChar: Character,
            count: Int
        ) -> String {
            let count: String = count > 1 ? "\(count)" : ""
            return "\(previousChar)\(count)"
        }
        
        guard !input.isEmpty else { return "" }

        var result: [String] = []
        var count = 0
        var previousChar: Character = input.first!

        for char in input {
            if char == previousChar {
                count += 1
            } else {
                result.append(createString(previousChar: previousChar, count: count))
                previousChar = char
                count = 1
            }
        }

        // 마지막 문자 처리
        result.append(createString(previousChar: previousChar, count: count))

        return result.joined()
    }
}

