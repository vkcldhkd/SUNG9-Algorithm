//
//  Day17.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/31/25.
//

enum Day17 { }

extension Day17 {
    /*
     ✅ 문제: 모든 숫자가 서로 다르게 등장하는 부분 배열 개수 세기
     정수 배열 nums가 주어졌을 때,
     연속된 부분 배열(subarray) 중 모든 숫자가 각각 한 번씩만 등장하는 구간의 개수를 구하시오.

     ✳️ 입력 예시 1
     let nums = [1, 2, 1, 3]
     
     ✳️ 출력 예시 1
     6
     가능한 부분 배열:

     [1], [2], [1], [3] (각 원소)

     [1,2], [2,1], [1,3] (서로 다른 2개)

     ✳️ 입력 예시 2
     let nums = [1, 2, 3, 4]
     
     ✳️ 출력 예시 2
     10
     가능한 부분 배열:

     [1], [2], [3], [4]

     [1,2], [2,3], [3,4]

     [1,2,3], [2,3,4]

     [1,2,3,4]

     ✳️ 입력 예시 3
     let nums = [2, 2, 2]
     
     ✳️ 출력 예시 3
     3
     가능한 부분 배열: [2], [2], [2] (길이 1짜리만)

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
     */
    
    static func countUniqueSubarrays(_ nums: [Int]) -> Int {
        var result = 0
        
        for start in 0 ..< nums.count {
            var seen = Set<Int>()
            
            for end in start ..< nums.count {
                if seen.contains(nums[end]) {
                    break
                }
                seen.insert(nums[end])
                result += 1
            }
        }
        
        return result
    }
}
