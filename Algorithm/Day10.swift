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
    static func minimumSumProduct(
        _ A: [Int],
        _ B: [Int]
    ) -> Int {
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

extension Day10 {
    /*
     # ✅ 문제: 포켓몬 도감 역순 조회

     포켓몬 도감에는 1번부터 N번까지의 포켓몬이 등록되어 있다.
     이 포켓몬 도감은 이름으로 검색하면 번호를, 번호로 검색하면 이름을 반환하는 구조이다.
     검색 요청이 들어올 때마다 알맞은 결과를 출력하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let pokemons = ["Pikachu", "Bulbasaur", "Charmander", "Squirtle"]
     let queries = ["2", "Charmander", "Pikachu"]
     ```

     ### ✳️ 출력 예시
     ```swift
     Bulbasaur
     3
     1
     ```

     ---

     ### ❗️조건
     - 포켓몬 개수 N은 1 이상 100,000 이하
     - 포켓몬 이름은 영어로 최대 20자 이하, 중복 없음
     - 검색 요청은 N개 이하이며, 이름 또는 번호(문자열)로 주어짐
     - 입력으로 주어진 번호는 1번부터 시작하며, 출력도 그에 맞춰야 함
     */
    
    static func pokemonLookup(
        _ pokemons: [String],
        _ queries: [String]
    ) -> [String] {
        var result: [String: Int] = [:]
        for (index, name) in pokemons.enumerated() {
            result[name] = index + 1
        }
        
        var output: [String] = []
        for query in queries {
            if let index = Int(query) {
                output.append(pokemons[index - 1])
            } else if let index = result[query] {
                output.append(String(index))
            }
        }
        
        return output
    }
}

extension Day10 {
    /*
     # ✅ 문제: 구간 합 구하기

     정수 배열과 여러 개의 구간 [i, j]가 주어졌을 때,
     각 구간마다 i번째 원소부터 j번째 원소까지의 합을 구하시오.
     모든 합은 0-based 인덱스를 기준으로 계산한다.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [5, 4, 3, 2, 1]
     let queries = [(0, 2), (1, 3), (0, 4)]
     ```

     ### ✳️ 출력 예시
     ```swift
     12
     9
     15
     ```

     ---

     ### ❗️조건
     - numbers의 길이는 1 이상 100,000 이하
     - 각 원소는 -1,000 이상 1,000 이하의 정수
     - 구간 쿼리는 최대 100,000개
     - 각 쿼리는 (i, j) 형태로, 0 ≤ i ≤ j < numbers.count
     */
    
    static func rangeSums(
        _ numbers: [Int],
        _ queries: [(Int, Int)]
    ) -> [Int] {
        var prefix = [0]
        for num in numbers {
            prefix.append(prefix.last! + num)
        }
        
        var result: [Int] = []
        for (start, end) in queries {
            result.append(prefix[end+1] - prefix[start])
        }
        return result
    }
}
