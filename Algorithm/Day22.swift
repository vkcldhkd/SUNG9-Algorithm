//
//  Day22.swift
//  Algorithm
//
//  Created by HYUN SUNG on 8/5/25.
//

enum Day22 { }

extension Day22 {
    /*
     
     # ✅ 문제: 최대 K번까지 반복 가능한 가장 긴 부분 문자열

     문자열 `s`와 정수 `k`가 주어질 때,
     **각 문자가 최대 `k`번까지만 등장할 수 있는 가장 긴 연속 부분 문자열의 길이**를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "aabbcc"
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     6
     ```
     - 모든 문자가 각각 최대 2번 → 전체 문자열 사용 가능

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "aaabbcc"
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     6
     ```
     - "aabbc" 또는 "abbcc" → a 또는 c 중 하나는 2번까지만 허용됨

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "abcabcabc"
     let k = 1
     ```

     ## ✳️ 출력 예시 3
     ```swift
     3
     ```
     - "abc" → 각 문자가 1번씩만 등장

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `1 <= k <= s.count`
     - `s`는 영어 소문자 알파벳으로만 구성됨
     */
    static func longestSubstringWithMaxKRepeatsPerChar(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        let chars = Array(s)
        var freqDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            freqDict[char, default: 0] += 1
            
            while freqDict.values.contains(where: { $0 > k }) {
                let leftChar = chars[left]
                freqDict[leftChar, default: 0] -= 1
                
                if freqDict[leftChar] == 0 {
                    freqDict.removeValue(forKey: leftChar)
                }
                left += 1
            }
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

extension Day22 {
    /*
     
     # ✅ 문제: 같은 문자 간 간격 유지하기

     문자열 `s`와 정수 `k`가 주어질 때,
     **같은 문자가 다시 등장하려면 적어도 `k`개의 다른 문자가 사이에 있어야** 한다.
     이 조건을 만족하는 가장 긴 연속 부분 문자열의 길이를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "abcabc"
     let k = 3
     ```

     ## ✳️ 출력 예시 1
     ```swift
     6
     ```
     - 전체 문자열이 조건 만족: 각 문자가 다시 등장하기 전에 3개의 문자가 사이에 있음

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "aaabc"
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```
     - "aab"에서 a가 2번 등장하지만 그 사이에 1개밖에 없음 → 탈락
     - "abc"는 조건 만족 → 길이 3

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "abaccc"
     let k = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```
     - "abac" → a가 다시 등장할 때 b가 1개만 있어서 실패
     - "bacc" → c는 2번 등장하지만 사이에 1개뿐 → 탈락
     - 최적은 "abac" 또는 "bacc" 둘 다 길이 4까지 가능

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `0 <= k <= s.count - 1`
     - `s`는 영어 소문자
     */
    static func longestSubstringWithDistanceBetweenSameChars(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        let chars = Array(s)
        var freqDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            if let lastIndex = freqDict[char],
               right - lastIndex < k {
                left = max(left, lastIndex + 1)
            }
            
            freqDict[char] = right
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }
}
