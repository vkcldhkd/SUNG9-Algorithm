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
