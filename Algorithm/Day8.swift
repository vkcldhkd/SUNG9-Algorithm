//
//  Day8.swift
//  Algorithm
//
//  Created by HYUN SUNG on 5/10/25.
//

enum Day8 { }

extension Day8 {
    /*
     📦 문제: 다리를 지나는 트럭
     설명:
     트럭 여러 대가 일렬로 도로 위에 서 있고, 하나씩 다리를 지나가야 해.
     다리는 일정한 길이와 최대 하중 제한이 있고, 동시에 올라갈 수 있는 트럭의 무게 총합은 이 하중을 넘을 수 없어.
     각 트럭이 순서대로 다리를 모두 지나기까지 걸리는 시간을 구하자.

     🎯 출력 형식
     모든 트럭이 다리를 건너는 데 걸리는 총 시간(int)을 반환합니다.

     📘 입출력 예시
     let bridgeLength = 2
     let weight = 10
     let truckWeights = [7, 4, 5, 6]
     // 출력: 8

     let bridgeLength = 100
     let weight = 100
     let truckWeights = [10]
     // 출력: 101
     let bridgeLength = 100
     let weight = 100
     let truckWeights = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
     // 출력: 110
     */
    
    static func bridgeTruckCrossingTime(
        bridgeLength: Int,
        weight: Int,
        truckWeights: [Int]
    ) -> Int {
        var time = 0
        var bridgeQueue: [Int] = Array(repeating: 0, count: bridgeLength) // 다리 위 상태
        var waitingTrucks = truckWeights
        var currentWeight = 0

        while !bridgeQueue.isEmpty {
            time += 1
            
            // 다리에서 트럭 나감
            let passedTruck = bridgeQueue.removeFirst()
            currentWeight -= passedTruck

            // 대기 중인 트럭이 있고, 다리에 올릴 수 있으면 올림
            if let nextTruck = waitingTrucks.first,
               currentWeight + nextTruck <= weight {
                bridgeQueue.append(nextTruck)
                currentWeight += nextTruck
                waitingTrucks.removeFirst()
            } else {
                bridgeQueue.append(0)
            }
            
            // 다리에 트럭이 한대도 없고, 기다리는 트럭이 없으면 시간 리턴
            if currentWeight == 0 && waitingTrucks.isEmpty {
                return time
            }
        }

        return time
    }
}

extension Day8 {
    /*
     🧩 문제: 완주하지 못한 선수
     설명:
     마라톤에 참여한 선수들의 명단과 완주한 선수들의 명단이 주어질 때, 완주하지 못한 선수의 이름을 구하라.
     동명이인이 있을 수 있다.
     
     🎯 출력 형식
     완주하지 못한 선수의 이름을 String으로 반환

     📘 입출력 예시
     let participant = ["leo", "kiki", "eden"]
     let completion = ["eden", "kiki"]
     // 출력: "leo"
     
     let participant = ["marina", "josipa", "nikola", "vinko", "filipa"]
     let completion = ["josipa", "filipa", "marina", "nikola"]
     // 출력: "vinko"
     
     let participant = ["mislav", "stanko", "mislav", "ana"]
     let completion = ["stanko", "ana", "mislav"]
     // 출력: "mislav"
     */
    
    static func findIncompleteRunner(
        participant: [String],
        completion: [String]
    ) -> String {
        var countDict: [String: Int] = [:]
        participant.forEach { countDict[$0, default: 0] += 1 }
        completion.forEach { countDict[$0, default: 0] -= 1 }
        return countDict.filter { $0.value >= 1 }.first?.key ?? ""
    }
}

extension Day8 {
    /*
     🧩 문제: 가장 큰 수 만들기
     설명:
     0 또는 양의 정수가 담긴 배열이 주어졌을 때, 이 수들을 조합하여 만들 수 있는 가장 큰 수를 문자열로 반환하시오.
     단, 결과가 "000" 같이 될 수 있으므로 문자열 형태로 반환해야 해.
     각 숫자는 0 이상 1,000 이하
     
     🎯 출력 형식
     만들 수 있는 가장 큰 수를 String으로 반환

     📘 입출력 예시
     let numbers = [6, 10, 2]
     // 출력: "6210"
     
     let numbers = [3, 30, 34, 5, 9]
     // 출력: "9534330"

     let numbers = [0, 0, 0]
     // 출력: "0"
     */
    
    static func makeLargestNumber(_ numbers: [Int]) -> String {
        let result = numbers
            .map { String($0) }
            .sorted { $0 + $1 > $1 + $0 }
            .joined()
        
        return result.first == "0" ? "0" : result
    }
}


