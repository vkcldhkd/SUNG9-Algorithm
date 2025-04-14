//
//  Day3.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/14/25.
//

import Foundation

enum Day3 { }

extension Day3 {
    /*
     ✅ 오늘의 문제 (Day 3-1)
     🧩 문제 이름: 크로아티아 알파벳
     🔗 백준 2941번 문제 링크

     ✨ 문제 설명
     예전 크로아티아 알파벳은 알파벳 하나 대신 몇 개의 문자로 표현되기도 한다.
     아래 목록이 하나의 알파벳으로 취급됨:
     c=   c-   dz=   d-   lj   nj   s=   z=
     예를 들어 "ljes=njak"은 총 6개의 크로아티아 알파벳으로 구성되어 있음.

     주어진 문자열에서 크로아티아 알파벳의 수를 세어라.

     📥 입력 형식
     한 줄, 길이 ≤ 100의 문자열
     알파벳 소문자, -, =

     📤 출력 형식
     크로아티아 알파벳 개수 출력

     📌 예시 입력
     ljes=njak
     📌 예시 출력
     6
     */
    
    static func countCroatianAlphabets() -> Int {
        var input = readLine()!
        let croatianArray: [String] = ["dz=", "c=", "c-","d-", "lj", "nj", "s=", "z="]
        
        croatianArray.forEach {
            input = input.replacingOccurrences(of: $0, with: "*")
        }
        return input.count
    }
}


extension Day3 {
    /*
     ✅ 오늘의 문제 (Day 3-2)
     🧩 문제 이름: 단어 정렬
     🔗 백준 1181번 문제 링크

     ✨ 문제 설명
     알파벳 소문자로 이루어진 단어 N개가 주어진다.
     중복된 단어는 제거한 후,

     길이가 짧은 것부터

     길이가 같으면 사전 순으로 정렬해서
     모든 단어를 한 줄에 하나씩 출력하라.

     📥 입력 형식
     첫 줄: 단어 개수 N (1 ≤ N ≤ 20,000)

     이후 N줄: 단어 입력 (소문자, 길이 ≤ 50)

     📤 출력 형식
     중복을 제거한 단어들을

     길이순 오름차순

     길이 같으면 사전순
     으로 정렬하여 한 줄에 하나씩 출력

     📌 예시 입력
     13
     but
     i
     wont
     hesitate
     no
     more
     no
     more
     it
     cannot
     wait
     im
     yours
     📌 예시 출력
     i
     im
     it
     no
     but
     more
     wait
     wont
     yours
     cannot
     hesitate
     */
    
    static func sortUniqueWords() -> [String] {
        let inputCount = Int(readLine()!)!
        var inputs: Set<String> = []
        for _ in 0 ..< inputCount {
            inputs.insert(readLine()!)
        }
        
        return inputs.sorted { lhs, rhs in
            if lhs.count == rhs.count {
                return lhs < rhs
            } else {
                return lhs.count < rhs.count
            }
        }
    }
}


extension Day3 {
    /*
     ✅ 오늘의 문제 (Day 3-3)
     🧩 문제 이름: 블랙잭
     🔗 백준 2798번 문제 링크

     ✨ 문제 설명
     N장의 카드 중에서 3장을 골라 합을 구한다.
     합이 M을 넘지 않으면서, M에 최대한 가까운 합을 출력하라.

     📥 입력 형식
     첫 줄: 카드 개수 N (3 ≤ N ≤ 100), 목표값 M (10 ≤ M ≤ 300,000)

     둘째 줄: 카드에 적힌 수 N개 (1 ≤ 각 수 ≤ 100,000)

     📤 출력 형식
     M을 넘지 않는 3장 조합의 최대 합

     📌 예시 입력
     5 21
     5 6 7 8 9
     📌 예시 출력
     21
     가능한 조합들 중, 5 + 7 + 9 = 21이 가장 M에 가까움
     */
    
    static func findBestBlackjack() -> Int {
        let input = readLine()!.split(separator: " ")
        let cardCount = Int(input.first!)!
        let target = Int(input.last!)!
        
        let cards = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }

        var bestSum = 0

        for i in 0 ..< cardCount {
            for j in i+1 ..< cardCount {
                for k in j+1 ..< cardCount {
                    let total = cards[i] + cards[j] + cards[k]
                    if total <= target {
                        bestSum = max(bestSum, total)
                    }
                }
            }
        }

        return bestSum
    }

}
