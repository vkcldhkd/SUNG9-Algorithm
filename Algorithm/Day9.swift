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
}

