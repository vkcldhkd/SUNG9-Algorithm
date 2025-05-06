//
//  Day5.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/23/25.
//

enum Day5 { }

extension Day5 {
    /*
     🧩 문제: 두 개의 문자열로 만든 팰린드롬 확인하기
     ✅ 설명
     두 개의 문자열 a, b가 주어질 때,
     a의 앞부분 + b의 뒷부분
     또는
     b의 앞부분 + a의 뒷부분을 이어붙인 문자열 중에
     팰린드롬이 존재하는지 확인하는 함수를 작성하세요.
     
     ✅ 조건
     - 두 문자열은 길이가 같고, 1 이상 1000 이하
     - 대소문자 구분 없음 (전부 소문자로 처리해도 됨)
     - 부분 문자열을 선택해 조합 (중간에 자를 수 있음)
     - 단, 각 문자열의 앞부분 / 뒷부분만을 조합 가능함

     ✅ 예시
     예시 1
     a = "abc"
     b = "cba"
     → a[0] + b[2] → "aba" → ✅ 팰린드롬
     → 결과: `true`
     
     예시 2
     a = "abc"
     b = "def"
     → 어떤 조합도 팰린드롬 아님
     → 결과: `false`
     */
    static func canFormPalindrome() -> Bool {
        let a: String = readLine()!.lowercased()
        let b: String = readLine()!.lowercased()
        
        for i in 0 ..< a.count {
            for j in 0 ..< b.count {
                let aa: String = String(a.prefix(i) + b.suffix(b.count - i))
                let bb: String = String(b.prefix(j) + a.suffix(a.count - j))
                
                if isPalindrome(aa) || isPalindrome(bb) {
                    return true
                }
            }
        }
                
        return false
    }
}

extension Day5 {
    /*
     🧩 문제: 가장 긴 팰린드롬 부분 문자열 찾기
     ✅ 설명
     주어진 문자열 안에서
     가장 긴 팰린드롬 부분 문자열을 찾아서 반환하세요.
     
     ✅ 예시
     입력 1
     "babad"
     → 출력: "bab" 또는 "aba" (둘 다 정답)

     입력 2
     "cbbd"
     → 출력: "bb"

     입력 3
     "abcd"
     → 출력: "a" (길이 1짜리 중 아무거나)
     */
    
    static func longestPalindromeSubstring() -> String {
        
        let input: String = readLine()!
        let inputToArray: [String] = input.map { String($0) }
        var resultPalindrome: String = ""
        
        for i in 0 ..< inputToArray.count {
            for j in i ..< inputToArray.count {
                let temp = inputToArray[i...j]
                let joinedString = temp.joined()
                if isPalindrome(joinedString) && resultPalindrome.count < joinedString.count {
                    resultPalindrome = joinedString
                }
            }
        }
        
        
        return resultPalindrome
    }
    
    static func isPalindrome(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
}

extension Day5 {
    /*
     🧩 문제: 가장 긴 공통 접두사 찾기 (Longest Common Prefix)
     ✅ 설명
     여러 개의 문자열이 주어질 때,
     모든 문자열이 공통으로 가지고 있는 가장 긴 접두사를 찾아 반환하세요.
     
     ✅ 예시
     입력 1
     ["flower", "flow", "flight"]
     → 출력: "fl"

     입력 2
     ["dog", "racecar", "car"]
     → 출력: "" (공통 접두사 없음)

     입력 3
     ["interstellar", "internet", "interval"]
     → 출력: "inte"
     */
    
    static func longestCommonPrefix(strings: [String]) -> String {
        let firstString = strings.first!
        let firstStringToArray = firstString.map { $0 }
        
        var result: String = ""
        
        for i in 0 ..< firstString.count {
            let prefix = String(firstStringToArray[0...i])
            if strings.filter ({ $0.hasPrefix(prefix) }).count == strings.count && result.count < prefix.count {
                result = prefix
            }
        }
        return result
    }
}


extension Day5 {
    /*
     🧩 문제: 애너그램 그룹 만들기
     ✅ 설명
     문자열 배열이 주어졌을 때,
     서로 애너그램인 문자열들끼리 묶어서 그룹화된 결과를 반환하세요.
     
     ✅ 애너그램이란?
     애너그램은 문자들의 구성은 같지만 순서만 다른 문자열
     예: "eat" / "tea" / "ate" → 전부 애너그램

     ✅ 예시
     Input: ["eat", "tea", "tan", "ate", "nat", "bat"]

     Output: [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
     순서는 상관 없음 (정렬은 안 해도 됨)
     */
    static func groupAnagrams(strings: [String]) -> [[String]] {
        let temp = strings
            .map { [$0: String($0.sorted()) ]}
        
        var result: [String: [String]] = [:]
        
        temp.forEach { kv in
            kv.forEach { (key, value) in
                result[value, default: []].append(key)
            }
        }
        
        return result.map { $0.value }
    }
}


extension Day5 {
    /*
     🧩 문제: 가장 긴 부분 문자열 (Longest Substring Without Repeating Characters)
     ✅ 설명
     문자열 s가 주어졌을 때,
     중복 문자가 없는 가장 긴 부분 문자열의 길이를 반환하세요.

     ✅ 예시
     입력 1
     "abcabcbb"
     → 출력: 3 ("abc")

     입력 2
     "bbbbb"
     → 출력: 1 ("b")

     입력 3
     "pwwkew"
     → 출력: 3 ("wke" 또는 "kew")

     입력 4
     ""
     → 출력: 0
     */
    
    static func lengthOfLongestSubstring() -> Int {
        let input = readLine()!
        
        var seen: [Character: Int] = [:]
        var start = 0
        var maxLength = 0
        
        for (i, c) in input.enumerated() {
            if let lastSeenIndex = seen[c],
               lastSeenIndex >= start {
                start = lastSeenIndex + 1
            }
            seen[c] = i
            
            maxLength = max(maxLength, i - start + 1)
        }
        
        return maxLength
    }
}

extension Day5 {
    /*
     🧩 문제: 중복 문자 없는 가장 짧은 윈도우 (Minimum Window Substring)
     ✅ 설명
     두 문자열 s, t가 주어졌을 때,
     s 안에서 t의 모든 문자를 포함하는 가장 짧은 부분 문자열을 찾아 반환하세요.
     
     ✅ 예시
     입력 1
     s = "ADOBECODEBANC", t = "ABC"
     → 출력: "BANC"
     
     입력 2
     s = "a", t = "a"
     → 출력: "a"
     
     입력 3
     s = "a", t = "aa"
     → 출력: ""
     테스트케이스 통과XXXX!! 수정필요
     */
    
    static func minWindow() -> String {
        func createWord(char: String, count: Int) -> String {
            return String(repeating: char, count: count)
        }
        
        func checkWord(word: String, tItems: [String]) -> Bool {
            var check: [Bool] = []
            tItems.forEach { item in
                if word.contains(item) {
                    check.append(true)
                }
            }
            return check.count == tItems.count
        }
        
        let s: String = readLine()!
        let sArray = Array(s)
        let t: String = readLine()!
        
        guard !t.isEmpty else { return "" }
        guard t.count <= s.count else { return "" }
        var windowArray: [String] = []
        
        var tCount: [String: Int] = [:]
        for tChar in t {
            tCount[String(tChar), default: 0] += 1
        }
        let tItems = tCount.map { createWord(char: $0.key, count: $0.value) }
        
        for i in 0 ..< s.count {
            let window = String(sArray[i...s.count - 1 ])
            if checkWord(word: window, tItems: tItems) {
                windowArray.append(window)
            }
        }
        
        return windowArray
            .sorted { $0.count < $1.count }
            .first ?? ""
    }
}
