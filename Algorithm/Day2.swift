//
//  Day2.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/10/25.
//

import Foundation

enum Day2 { }

extension Day2 {
    /*
     📅 오늘의 문제 (Day 2-1)
     🧩 문제 이름: 평균
     문제 링크: 백준 1546번 - 평균

     난이도: 🟢 초급

     주제: 배열, 수학, 정규화(Normalization)

     📘 문제 설명
     세준이는 기말고사를 망쳤다. 세준이는 점수를 조작해서 집에 가져가기로 했다. 일단 세준이는 자기 점수 중에 최댓값을 골랐다. 이 값을 M이라고 한다. 그리고 나서 모든 점수를 점수/M*100으로 고쳤다.
     예를 들어, 세준이의 최고점이 70이고, 수학점수가 50이었으면 수학점수는 50/70*100이 되어 71.43점이 된다.
     세준이의 성적을 위의 방법대로 새로 계산했을 때, 새로운 평균을 구하는 프로그램을 작성하시오.
     
     입력
     - 첫째 줄에 시험 본 과목의 개수 N이 주어진다. 이 값은 1000보다 작거나 같다.
     - 둘째 줄에 세준이의 현재 성적이 주어진다. 이 값은 100보다 작거나 같은 음이 아닌 정수이고, 적어도 하나의 값은 0보다 크다.
     */
    
    static func normalizedAverageScore() -> Double {
        let subjects: Double = Double(readLine()!)!
        let currentScores: [Double] = readLine()!
            .split(separator: " ")
            .compactMap { Double($0) }
        
        guard let maxScore = currentScores.max() else { return 0 }
        guard maxScore > 0 else { return 0 }
        
        let newScores: [Double] = currentScores.map { $0 / maxScore * 100 }
        
        let result: Double = newScores.reduce(0, +) / Double(subjects)
        return result
    }
}

extension Day2 {
    /*
     📅 오늘의 문제 (Day 2-2)
     🧩 문제 이름: 단어 공부
     문제 링크: 백준 1157번 - 단어 공부

     난이도: 🟡 보통 (입력 파싱 & 대소문자 처리 연습)

     📘 문제 설명
     알파벳 대소문자로 이루어진 단어가 주어졌을 때,
     가장 많이 사용된 알파벳을 대문자로 출력하는 문제.
     단, 가장 많이 사용된 알파벳이 여러 개인 경우에는 ? 출력필요
     
     ✅ 요구 사항
     입력은 알파벳 문자열 (길이 1 이상 1,000,000 이하)
     대소문자 구분 없이 비교
     결과는 대문자 1글자 또는 ?
     */
    static func mostFrequentAlphabet() -> String {
        let input = readLine()!.uppercased()
        var countDict: [Character: Int] = [:]
        
        input.forEach { countDict[$0, default: 0] += 1 }
        guard let maxValue = countDict.values.max() else { return "" }
        guard maxValue > 0 else { return "" }
        let max = countDict.filter { $0.value == maxValue }
        let sameCount = max.count
        guard sameCount == 1 else { return "?" }
        return String(max.keys.first!).uppercased()
    }
}

extension Day2 {
    /*
     📅 오늘의 문제 (Day 2-3)
     🧩 문제 이름: 상수
     문제 링크: 백준 2908번 - 상수

     난이도: 🟡 보통

     주제: 문자열 뒤집기, 숫자 비교, 조건문

     📘 문제 설명
     두 수가 주어졌을 때, 각 수를 뒤집어서 더 큰 수를 출력하는 문제
     ✅ 입력 형식
     한 줄에 공백으로 구분된 두 수 (세 자리 수, 100~999)
     ✅ 출력 형식
     뒤집은 두 수 중 더 큰 수 출력
     */
    
    static func compareReversedNumbers() -> Int {
        let input: [Int] = readLine()!
            .split(separator: " ")
            .map { String($0.reversed()) }
            .compactMap { Int($0) }
        
        guard let maxValue = input.max() else { return 0 }
        return maxValue
    }
}

extension Day2 {
    /*
     📅 오늘의 문제 (Day 2-4)
     🧩 문제 이름: 단어의 개수
     문제 링크: 백준 1152번 - 단어의 개수

     난이도: 🟡 보통

     주제: 문자열, 공백 처리, 조건문

     📘 문제 설명
     문장이 주어졌을 때, 단어의 개수를 출력하는 문제
     단어는 공백 하나로 구분되고,
     문장의 시작이나 끝에 공백이 있을 수도 있음. (이게 함정!)

     ✅ 조건 요약
     입력은 공백 포함한 한 줄 문자열
     단어는 공백 하나 이상으로 구분
     단어는 빈 문자열이 아니어야 함
     시작이나 끝에 공백이 있어도 개수로 세지 않음
     */
    
    static func wordCount() -> Int {
        return readLine()!
            .split(separator: " ")
            .count
    }
}

extension Day2 {
    /*
     📅 오늘의 문제 (Day2-5)
     🧩 문제 이름: OX 퀴즈 2차원 버전
     문제 링크: 백준 2563번 - 색종이

     난이도: 🟡 중간

     주제: 2차원 배열, 시뮬레이션

     📘 문제 설명
     도화지(100x100 크기)에 10x10짜리 색종이들을 여러 장 붙인다.
     색종이들이 겹치더라도, 실제로 칠해진 면적은 한 번만 계산된다.
     → 도화지에서 색종이가 칠한 총 넓이를 구하라.

     ✅ 입력 형식
     첫 줄: 색종이의 수 N (1 ≤ N ≤ 100)
     다음 N줄: 색종이의 왼쪽 아래 기준 좌표 (x, y) (0 ≤ x, y ≤ 90)
     각 색종이는 좌표를 기준으로 오른쪽으로 10, 위로 10인 정사각형

     ✅ 출력 형식
     색종이가 칠한 전체 넓이 출력
     */
    static func calculateArea() -> Int {
        let paperNum = Int(readLine()!)!
        guard paperNum > 0, paperNum <= 100 else { return 0 }
        var papers: [Int: String] = [:]
        for i in 0 ..< paperNum { papers[i] = readLine()! }
        
        var paperArea = Array(repeating: Array(repeating: false, count: 100), count: 100)
        
        for pager in papers.values {
            let xy = pager.split(separator: " ")
                .compactMap { Int($0) }
            
            guard let x = xy.first else { return 0 }
            guard let y = xy.last else { return 0 }
            
            for i in x ..< x + 10 {
                for j in y ..< y + 10 {
                    paperArea[i][j] = true
                }
            }
        }

        return paperArea
            .map { $0.filter { $0 }.count }
            .reduce(0, +)
    }
}

extension Day2 {
    /*
     📅 오늘의 문제 (Day 2-6)
     🧩 문제 이름: 최댓값
     문제 링크: 백준 2566번 - 최댓값

     난이도: 🟡 보통

     주제: 2차원 배열, 조건문, 위치 추적

     📘 문제 설명
     9x9 크기의 표에 자연수들이 입력으로 주어진다.
     이 중 가장 큰 값을 찾고, 그 값의 **행과 열 위치(1-based index)**를 출력하는 문제

     ✅ 입력 형식
     9줄에 걸쳐 각 줄마다 9개의 정수가 주어짐
     총 81개 숫자 입력됨

     ✅ 출력 형식
     최댓값
     최댓값이 위치한 행 번호와 열 번호 (모두 1부터 시작)
     
     ex)
     3 23 85 34 17 74 25 52 65
     10 7 39 42 88 52 14 72 63
     87 42 18 78 53 45 18 84 53
     34 28 64 85 12 16 75 36 55
     21 77 45 35 28 75 90 76 1
     25 87 65 15 28 11 37 28 74
     65 27 75 41 7 89 78 64 39
     47 47 70 45 23 65 3 41 44
     87 13 82 38 31 12 29 29 80
     */
    
    
    static func findMaxInMatrix() -> (value: Int, (row: Int, col: Int)) {
        let lineNum = 9
        var inputs: [[Int]] = []
        for _ in 0 ..< lineNum {
            let input = readLine()!
                .split(separator: " ")
                .compactMap { Int($0) }
            inputs.append(input)
        }
        guard inputs.count == lineNum else { return (0, (0,0)) }
        
        var row: Int = 0
        var col: Int = 0
        
        guard let maxValue = inputs.compactMap ({ $0.max() }).max() else { return (0, (0,0)) }
        
        for i in 0 ..< inputs.count {
            for j in 0 ..< inputs[i].count {
                if inputs[i][j] == maxValue {
                    row = i + 1
                    col = j + 1
                }
            }
        }
        
        return (maxValue, (row, col))
    }
}


extension Day2 {
    /*
     📅 오늘의 문제 (Day 2-7)
     🧩 문제 이름: 나이순 정렬
     문제 링크: 백준 10814번 - 나이순 정렬

     난이도: 🟡 보통

     주제: 정렬, 안정 정렬(Stable Sort)

     📘 문제 설명
     회원 정보를 나이순으로 정렬하되,
     나이가 같으면 먼저 가입한 사람이 앞에 오도록 정렬하는 문제

     ✅ 입력 형식
     첫 줄: 회원 수 N (1 ≤ N ≤ 100,000)
     다음 N줄: "나이 이름" 형식의 문자열

     ✅ 출력 형식
     나이 이름을 정렬한 순서대로 출력
     (나이는 숫자, 이름은 공백 없는 문자열)
     
     ex)
     3
     21 Junkyu
     21 Dohyun
     20 Sunyoung
     */
    
    static func sortMembersByAge() -> [(age: Int, name: String)] {
        let defaultValue = [(0,"")]
        guard let peopleNumber = Int(readLine()!) else { return defaultValue }
        var inputs: [(age: Int, name: String)] = []
        for _ in 0 ..< peopleNumber {
            let input = readLine()!
            let inputSplit = input.split(separator: " ")
            guard let age = inputSplit.first,
                  let ageToInt = Int(age) else { return defaultValue }
            
            guard let name = inputSplit.last else { return defaultValue }
            
            inputs.append((ageToInt, String(name)))
        }
        inputs = inputs.sorted(by: { $0.age < $1.age })
        return inputs
    }
}
