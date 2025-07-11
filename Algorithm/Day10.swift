//
//  Day10.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/2/25.
//

enum Day10 { }

extension Day10 {
    /*
     # ✅ 문제: 최소 곱의 합 구하기

     길이가 같은 두 개의 정수 배열 A, B가 주어진다.
     A의 원소는 재배열 가능하지만, B는 순서를 바꿀 수 없다.
     A의 각 원소와 B의 각 원소를 각각 곱해 더한 합이 **최소**가 되도록 A를 재배열하시오.
     이때의 **최소 합을 반환**하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let A = [1, 1, 1, 6, 0]
     let B = [2, 7, 8, 3, 1]
     ```

     ### ✳️ 출력 예시
     ```swift
     18
     ```

     ---

     ### ❗️조건
     - 배열 A와 B의 길이는 **1 이상 50 이하**
     - 배열 A, B의 원소는 **0 이상 100 이하**
     - B는 순서를 **변경할 수 없음**
     - A는 **자유롭게 정렬 가능**
     - A[i] × B[i] 를 전부 더한 **합의 최소값을 반환**
     */
    static func minimumSumProduct(_ A: [Int], _ B: [Int]) -> Int {
        let sortedA = A.sorted { $0 < $1 }
        let sortedB = B.sorted { $1 < $0 }
        let bSortedIndices = B.indices.sorted { B[$0] > B[$1] }
        
        var tempB = B
        var indexArrayB: [Int] = []

        var sum = 0
        for i in 0 ..< sortedB.count {
            let maxValue = sortedB[i]
            let index = tempB.firstIndex { $0 == maxValue && $0 >= 0 } ?? 0
            tempB[index] = -1
            indexArrayB.append(index)
        }
        
        for i in 0 ..< indexArrayB.count {
            let index = indexArrayB[i]
            sum += sortedA[i] * B[index]
        }
        return sum
    }
}

