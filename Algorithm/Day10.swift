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

extension Day10 {
    /*
     # ✅ 문제: 최대 연속 구간 합 구하기

     정수 배열이 주어졌을 때, 연속된 구간의 합 중 **가장 큰 값**을 구하시오.
     단, 구간은 비어있지 않아야 하며, 원소는 음수도 포함될 수 있다.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
     ```

     ### ✳️ 출력 예시
     ```swift
     6
     ```

     (설명: [4, -1, 2, 1] 구간의 합이 최대)

     ---

     ### ❗️조건
     - 배열 길이는 1 이상 100,000 이하
     - 원소는 -10,000 이상 10,000 이하
     */
    static func maxSubarraySum(_ numbers: [Int]) -> Int {
        var maxSum = numbers[0]
        var currentSum = numbers[0]
        
        for i in 1..<numbers.count {
            currentSum = max(numbers[i], currentSum + numbers[i])
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}


extension Day10 {
    /*
     # ✅ 문제: k개 구간의 최대 합

     정수 배열과 정수 k가 주어졌을 때,
     **서로 겹치지 않는 k개의 연속 구간**을 골라, 그 합의 최대값을 구하시오.
     각 구간은 최소 하나 이상의 원소를 포함해야 한다.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [1, 2, -1, 2, -3, 2, -5, 4]
     let k = 2
     ```

     ### ✳️ 출력 예시
     ```swift
     8
     ```

     (설명: [1, 2, -1, 2] + [4] → 4 + 4 = 8)

     ---

     ### ❗️조건
     - 배열 길이는 1 이상 100,000 이하
     - 각 원소는 -10,000 이상 10,000 이하
     - k는 1 이상 numbers.count 이하
     */
    static func maxKSubarraySum(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        let n = nums.count
        if n == 0 || k == 0 { return 0 }

        // local[i][j]: j개의 구간을 사용해서 i번째 요소에서 끝나는 최대합
        var local = Array(repeating: Array(repeating: Int.min, count: k + 1), count: n + 1)
        // global[i][j]: j개의 구간을 사용해서 0~i 구간 전체에서의 최대합
        var global = Array(repeating: Array(repeating: Int.min, count: k + 1), count: n + 1)

        // 초기값
        for i in 0...n {
            global[i][0] = 0
            local[i][0] = 0
        }

        for i in 1...n {
            for j in 1...min(i, k) {
                // local: 이전에 j번째 구간을 이어서 오거나, 새로 시작하거나
                local[i][j] = max(global[i - 1][j - 1], local[i - 1][j]) + nums[i - 1]
                // global: 이전까지의 최대값 또는 지금 local로 만든 값 중 최대
                global[i][j] = max(global[i - 1][j], local[i][j])
            }
        }

        return global[n][k]
    }
}


extension Day10 {
    /*
     
     # ✅ 문제: 가장 많이 등장한 문자

     영어 소문자로만 이루어진 문자열이 주어졌을 때,
     가장 많이 등장한 문자를 찾아 반환하시오.
     만약 여러 개라면, 사전 순으로 가장 앞선 문자를 반환하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let input = "abacabad"
     ```

     ### ✳️ 출력 예시
     ```swift
     a
     ```

     ---

     ### ❗️조건
     - 입력 문자열 길이는 1 이상 100,000 이하
     - 문자열은 영어 소문자 (a~z)로만 구성됨
     - 동일 횟수 문자가 여러 개라면 **사전 순으로 앞선 문자** 반환
     */
    
    static func mostFrequentCharacter(
        _ input: String
    ) -> Character {
        let chars = input.map { $0 }
        var dict: [Character: Int] = [:]
        for char in chars { dict[char, default: 0] += 1 }
        return dict
            .sorted(by: { $0.key < $1.key })
            .max(by: { $0.value < $1.value })!.key
    }
}

extension Day10 {
    /*
     # ✅ 문제: 숫자 정렬 후 문자열 만들기

     양의 정수 배열이 주어졌을 때,
     각 숫자를 문자열처럼 이어붙여서 만들 수 있는 **가장 큰 수**를 문자열로 반환하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [3, 30, 34, 5, 9]
     ```

     ### ✳️ 출력 예시
     ```swift
     "9534330"
     ```

     ---

     ### ❗️조건
     - 배열 길이는 1 이상 100,000 이하
     - 각 숫자는 0 이상 1,000 이하
     - 결과가 `"000"`처럼 0으로만 구성되면 `"0"`을 반환해야 함
     */
    static func largestNumber(
        _ numbers: [Int]
    ) -> String {
        let result = numbers
            .map { String($0) }
            .sorted { $0 + $1 > $1 + $0 }
            .joined()
        
        guard let resultToInt = Int(result) else {
            print("parse error : \(result)")
            return result
        }
        return resultToInt == 0 ? "0" : result
    }
}

extension Day10 {
    /*
     # ✅ 문제: 최소 동전 개수 구하기

     정수 N이 주어졌을 때,
     동전 500원, 100원, 50원, 10원을 이용하여 N원을 거슬러 줄 때
     **필요한 동전 개수의 최솟값**을 구하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let amount = 1260
     ```

     ### ✳️ 출력 예시
     ```swift
     6
     ```

     (500원 2개 + 100원 2개 + 50원 1개 + 10원 1개)

     ---

     ### ❗️조건
     - N은 1 이상 10,000 이하의 정수
     - 동전 종류는 500, 100, 50, 10원만 사용 가능 (무한히 있음)
     - 항상 거슬러 줄 수 있는 금액만 입력됨
     */
    
    static func minimumCoins(_ amount: Int) -> Int {
        func balance(amount: Int, type: Coins) -> (amount: Int, coinCount: Int) {
            let coinCount = amount / type.rawValue
            return (amount - coinCount * type.rawValue, coinCount)
        }
        
        enum Coins: Int, CaseIterable {
            case won500 = 500
            case won100 = 100
            case won50 = 50
            case won10 = 10
        }
        
        var amount = amount
        var dict: [Coins: Int] = [:]
        
        for coin in Coins.allCases {
            let result = balance(amount: amount, type: coin)
            amount = result.amount
            dict[coin] = result.coinCount
        }

        return dict.values.reduce(0, +)
    }
}

extension Day10 {
    /*
     # ✅ 문제: 숫자 찾기 (이분 탐색)

     정렬된 정수 배열과 정수 target이 주어졌을 때,
     배열 내에서 target이 존재하는 인덱스를 반환하시오.
     존재하지 않는다면 -1을 반환하시오.
     이때 반드시 **이분 탐색(O(log n))** 알고리즘을 사용해야 함.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [1, 3, 5, 7, 9, 11]
     let target = 7
     ```

     ### ✳️ 출력 예시
     ```swift
     3
     ```

     ---

     ### ❗️조건
     - 배열은 오름차순으로 정렬되어 있음
     - 배열의 길이는 1 이상 100,000 이하
     - target은 -1,000,000 이상 1,000,000 이하의 정수
     - 시간복잡도는 반드시 O(log n) 이하여야 함
     */
    
    static func binarySearch(
        _ numbers: [Int],
        _ target: Int
    ) -> Int {
        var start = 0
        var end = numbers.count - 1
        while start <= end {
            let mid = (start + end) / 2

            if numbers[mid] == target {
                return mid
            } else if numbers[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return -1
    }
    
}
