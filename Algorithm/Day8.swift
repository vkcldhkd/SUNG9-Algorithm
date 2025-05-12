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
