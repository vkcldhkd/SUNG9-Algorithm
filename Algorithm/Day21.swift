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

