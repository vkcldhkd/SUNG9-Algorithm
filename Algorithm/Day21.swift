//
//  Day21.swift
//  Algorithm
//
//  Created by HYUN SUNG on 8/4/25.
//

enum Day21 { }

extension Day21 {
    /*
     
     # ✅ 문제: 두 수의 합

     정수 배열 `nums`와 정수 `target`이 주어졌을 때,
     배열에서 **서로 다른 두 인덱스의 값의 합이 target이 되는** 인덱스 쌍을 반환하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [2, 7, 11, 15]
     let target = 9
     ```

     ## ✳️ 출력 예시 1
     ```swift
     [0, 1]
     ```
     - nums[0] + nums[1] = 2 + 7 = 9

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [3, 2, 4]
     let target = 6
     ```

     ## ✳️ 출력 예시 2
     ```swift
     [1, 2]
     ```
     - nums[1] + nums[2] = 2 + 4 = 6

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 3]
     let target = 6
     ```

     ## ✳️ 출력 예시 3
     ```swift
     [0, 1]
     ```

     ---

     ## ❗️조건
     - 반드시 정답이 존재한다고 가정함
     - 각 입력에 대해 정답은 유일함
     - `2 <= nums.count <= 10^5`
     - `-10^9 <= nums[i], target <= 10^9`
     */
    static func twoSum (
        _ nums: [Int],
        _ target: Int
    ) -> [Int] {
        
        var dict: [Int: Int] = [: ]
        
        for (index, num) in nums.enumerated() {
            let needNum = target - num
            if let needNumIndex = dict[needNum] {
                return [needNumIndex, index]
            }
            dict[num] = index
        }
        return []
    }
}

extension Day21 {
    /*
     
     # ✅ 문제: 아나그램 판별

     두 문자열 `s`와 `t`가 주어졌을 때,
     문자 구성(문자의 종류와 개수)이 동일하면 두 문자열은 아나그램이라고 합니다.
     `s`와 `t`가 아나그램인지 여부를 판단하는 함수를 구현하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "anagram"
     let t = "nagaram"
     ```

     ## ✳️ 출력 예시 1
     ```swift
     true
     ```
     - 문자 개수와 종류가 동일함

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "rat"
     let t = "car"
     ```

     ## ✳️ 출력 예시 2
     ```swift
     false
     ```
     - 문자 구성 다름

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "aacc"
     let t = "ccac"
     ```

     ## ✳️ 출력 예시 3
     ```swift
     false
     ```
     - 문자 개수가 다름

     ---

     ## ❗️조건
     - `1 <= s.count, t.count <= 10^5`
     - `s`와 `t`는 소문자 알파벳으로만 구성됨
     */
    static func isAnagram(
        _ s: String,
        _ t: String
    ) -> Bool {
        var sDict: [Character: Int] = [: ]
        var tDict: [Character: Int] = [: ]
        
        s.forEach { sDict[$0, default: 0] += 1 }
        t.forEach { tDict[$0, default: 0] += 1 }
    
        return sDict == tDict
    }
}

extension Day21 {
    /*
     
     # ✅ 문제: 아나그램 그룹화

     문자열 배열 `strs`가 주어졌을 때,
     문자 구성이 같은 문자열끼리 그룹으로 묶어라.
     즉, 아나그램인 문자열들을 함께 묶어 2차원 배열로 반환하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
     ```

     ## ✳️ 출력 예시 1
     ```swift
     [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let strs = [""]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     [[""]]
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let strs = ["a"]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     [["a"]]
     ```

     ---

     ## ❗️조건
     - `1 <= strs.count <= 10^4`
     - `0 <= strs[i].count <= 100`
     - `strs[i]`는 소문자로만 구성됨
     */
    static func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result: [String: [String]] = [: ]
        for str in strs {
            let sortedStr = String(str.sorted())
            result[sortedStr, default: []].append(str)
        }
        return Array(result.values)
    }
}

extension Day21 {
    /*
     
     # ✅ 문제: 가장 긴 동일 문자 부분 문자열 (k번 교체 가능)

     문자열 `s`와 정수 `k`가 주어질 때,
     **최대 k개의 문자를 다른 문자로 바꿔서 만들 수 있는, 동일한 문자가 반복된 가장 긴 연속 부분 문자열**의 길이를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "ABAB"
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```
     - 두 개의 B를 A로 바꾸면 `"AAAA"` 가능

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "AABABBA"
     let k = 1
     ```

     ## ✳️ 출력 예시 2
     ```swift
     4
     ```
     - "AABA" 또는 "ABBA" 가능

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "AAAA"
     let k = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `s`는 대문자 알파벳으로만 구성됨
     - `0 <= k <= s.count`
     */
    static func characterReplacement(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        var maxFreq = 0
        
        let chars = Array(s)
        var freqDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            freqDict[char, default: 0] += 1
            maxFreq = max(maxFreq, freqDict[char, default: 0])
            
            while (right - left + 1) - maxFreq > k {
                let leftChar = chars[left]
                freqDict[leftChar, default: 0] -= 1
                left += 1
            }
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

extension Day21 {
    /*
     
     # ✅ 문제: 가장 긴 k개 이하의 고유 문자 부분 문자열

     문자열 `s`와 정수 `k`가 주어질 때,
     **서로 다른 문자가 최대 k개까지 포함된 가장 긴 연속 부분 문자열의 길이**를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "eceba"
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     3
     ```
     - "ece"는 'e'와 'c' 두 종류만 포함 → 조건 만족

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "aaabbcc"
     let k = 1
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```
     - "aaa", "bbb", "ccc" 가능

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "aabbcc"
     let k = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```
     - "aabb" 또는 "bbcc" 가능

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `1 <= k <= 26`
     - `s`는 영어 소문자로만 구성됨
     */
    static func lengthOfLongestSubstringAtMostKDistinct(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        
        let chars = Array(s)
        var freqDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            freqDict[char, default: 0] += 1
            
            while freqDict.count > k {
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

extension Day21 {
    /*
     
     # ✅ 문제: 최대 k개의 서로 다른 문자를 포함하는 가장 긴 부분 문자열

     문자열 `s`와 정수 `k`가 주어질 때,
     **서로 다른 문자가 정확히 k개 포함된 가장 긴 연속 부분 문자열의 길이**를 구하시오.

     이전 문제는 "k 이하"였지만, 이번 문제는 **정확히 k개**여야만 길이를 갱신할 수 있습니다.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "aaabcbbcc"
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```
     - "bbcc" 또는 "aabc" 등 2개의 문자만 포함한 최대 길이

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "aabbccddeeff"
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     6
     ```
     - "ccbbee" 또는 "aabbcc" 등의 부분 문자열 가능

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "a"
     let k = 1
     ```

     ## ✳️ 출력 예시 3
     ```swift
     1
     ```

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `1 <= k <= 26`
     - `s`는 소문자 알파벳으로만 구성됨
     */
    static func lengthOfLongestSubstringExactlyKDistinct(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        
        let chars = Array(s)
        var freqDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            freqDict[char, default: 0] += 1
            
            while freqDict.count > k {
                let leftChar = chars[left]
                freqDict[leftChar, default: 0] -= 1
                if freqDict[leftChar] == 0 {
                    freqDict.removeValue(forKey: leftChar)
                }
                left += 1
            }
            
            if freqDict.count == k {
                maxLength = max(maxLength, right - left + 1)
            }
        }
        
        return maxLength
    }
}


extension Day21 {
    /*
     
     # ✅ 문제: 정수 배열에서 정확히 K개의 고유 숫자를 가진 가장 긴 부분 배열

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **서로 다른 정수 값이 정확히 k개 포함된 가장 긴 연속 부분 배열의 길이**를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 1, 2, 3]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```
     - [1, 2, 1, 2]는 숫자 1과 2로 구성된 길이 4짜리 부분 배열

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 2, 1, 3, 4]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```
     - [1, 3, 4] 또는 [2, 1, 3]이 조건을 만족하며 길이 3

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1, 1]
     let k = 1
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```
     - 전체 배열이 1개 숫자로만 구성됨

     ---

     ## ❗️조건
     - `1 <= nums.count <= 10^5`
     - `0 <= nums[i] <= 10^9`
     - `1 <= k <= nums.count`
     */
    static func longestSubarrayWithExactlyKDistinct(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        var freqDict: [Int: Int] = [: ]
        
        for (right, num) in nums.enumerated() {
            freqDict[num, default: 0] += 1
            
            while freqDict.count > k {
                let leftNum = nums[left]
                freqDict[leftNum, default: 0] -= 1
                if freqDict[leftNum] == 0 {
                    freqDict.removeValue(forKey: leftNum)
                }
                left += 1
            }
            
            if freqDict.count == k {
                maxLength = max(maxLength, right - left + 1)
            }
        }
        return maxLength
    }
}

extension Day21 {
    /*
     
     # ✅ 문제: 동일 숫자가 k번 이하로 등장하도록 만든 가장 긴 부분 배열

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **어떤 숫자든 최대 k번까지만 등장할 수 있도록 만든 가장 긴 연속 부분 배열의 길이**를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 2, 3, 3, 3, 4]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     5
     ```
     - [2, 2, 3, 3, 4] 또는 [1, 2, 2, 3, 3] 가능

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```
     - 최대 2개까지만 허용되므로 "1, 1"

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 2, 3, 4, 5]
     let k = 1
     ```

     ## ✳️ 출력 예시 3
     ```swift
     5
     ```
     - 모든 숫자가 1번만 등장 → 전체 사용 가능

     ---

     ## ❗️조건
     - `1 <= nums.count <= 10^5`
     - `0 <= nums[i] <= 10^9`
     - `1 <= k <= nums.count`
     */
    static func longestSubarrayWithMaxKRepeats(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        var freqDict: [Int: Int] = [: ]
        
        for (right, num) in nums.enumerated() {
            freqDict[num, default: 0] += 1
            
            while freqDict.values.contains(where: { $0 > k }) {
                let leftNum = nums[left]
                freqDict[leftNum, default: 0] -= 1
                if freqDict[leftNum] == 0 {
                    freqDict.removeValue(forKey: leftNum)
                }
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}
