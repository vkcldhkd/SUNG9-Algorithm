//
//  Day13.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/25/25.
//

enum Day13 { }

extension Day13 {
    /*
     # ✅ 문제: Missing Integer
     자연수로 이루어진 배열이 주어질 때, 배열에 존재하지 않는 가장 작은 자연수를 찾아 반환하세요.
     배열에는 중복된 수가 있을 수 있습니다.

     ---

     ### ✳️ 입력 예시
     Input: [1, 3, 6, 4, 1, 2]
     Output: 5

     Input: [1, 2, 3]
     Output: 4

     Input: [-1, -3]
     Output: 1

     ---

     ### ❗️조건
     - 배열의 길이: `1 <= A.count <= 100,000`
     - 각 원소의 범위: `-1,000,000 <= A[i] <= 1,000,000`
     - 시간복잡도는 `O(N)` 또는 `O(N * log N)` 이내로 해결해야 합니다.
     */
    
    static func findMissingPositive(_ numbers: [Int]) -> Int {
        let numberToSet = Set(numbers.filter { $0 > 0 })
        
        var current = 1
        while true {
            if !numberToSet.contains(current) {
                return current
            }
            current += 1
        }
    }
}

extension Day13 {
    /*
     # ✅ 문제: Longest Substring Without Repeating Characters
     주어진 문자열에서 **중복 문자가 없는 가장 긴 부분 문자열의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시
     Input: "abcabcbb"
     Output: 3

     Input: "bbbbb"
     Output: 1

     Input: "pwwkew"
     Output: 3

     ---

     ### ❗️조건

     - 문자열의 길이: `1 <= s.count <= 100,000`
     - 문자열은 오직 알파벳 소문자와 숫자로 구성됩니다.
     - 시간복잡도는 **O(N)** 이하로 해결해야 합니다.
     */
    
    static func lengthOfLongestSubstring(_ chars: String) -> Int {
        var charSet = Set<Character>()
        let chars = Array(chars)
        var left = 0
        var maxLength = 0

        for right in 0 ..< chars.count {
            while charSet.contains(chars[right]) {
                charSet.remove(chars[left])
                left += 1
            }
            charSet.insert(chars[right])
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}

extension Day13 {
    /*
     # ✅ 문제 3: Longest Substring with At Most K Distinct Characters
     주어진 문자열과 정수 `k`가 주어질 때, **서로 다른 문자가 최대 `k`개까지 허용되는 가장 긴 부분 문자열의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시
     Input: s = "eceba", k = 2
     Output: 3  // "ece"

     Input: s = "aa", k = 1
     Output: 2  // "aa"

     Input: s = "aabbcc", k = 2
     Output: 4  // "aabb", "bbcc" 가능

     ---

     ### ❗️조건

     - 문자열의 길이: `1 <= s.count <= 100,000`
     - `k`: `1 <= k <= 26`
     - 시간복잡도는 **O(N)** 이내여야 합니다.
     */
    
    static func lengthOfLongestSubstringKDistinct(
        _ s: String,
        _ k: Int
    ) -> Int {
        var charSet = Set<Character>()
        let chars = Array(s)
        var left = 0
        var maxLength = 0

        for right in 0 ..< chars.count {
            while charSet.contains(chars[right]) {
                charSet.remove(chars[left])
                left += 1
            }
            charSet.insert(chars[right])
            maxLength = max(maxLength, right - left + 1)
        }
        
        return 0
    }
}
