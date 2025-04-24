//
//  Day5.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/23/25.
//

enum Day5 { }

extension Day5 {
    /*
     🧩 문제: 두 개의 문자열로 만든 팰린드롬 확인하기
     ✅ 설명
     두 개의 문자열 a, b가 주어질 때,
     a의 앞부분 + b의 뒷부분
     또는
     b의 앞부분 + a의 뒷부분을 이어붙인 문자열 중에
     팰린드롬이 존재하는지 확인하는 함수를 작성하세요.
     
     ✅ 조건
     - 두 문자열은 길이가 같고, 1 이상 1000 이하
     - 대소문자 구분 없음 (전부 소문자로 처리해도 됨)
     - 부분 문자열을 선택해 조합 (중간에 자를 수 있음)
     - 단, 각 문자열의 앞부분 / 뒷부분만을 조합 가능함

     ✅ 예시
     예시 1
     a = "abc"
     b = "cba"
     → a[0] + b[2] → "aba" → ✅ 팰린드롬
     → 결과: `true`
     
     예시 2
     a = "abc"
     b = "def"
     → 어떤 조합도 팰린드롬 아님
     → 결과: `false`
     */
    static func canFormPalindrome() -> Bool {
        func isPalindrome(_ s: String) -> Bool {
            return s == String(s.reversed())
        }
        
        let a: String = readLine()!.lowercased()
        let b: String = readLine()!.lowercased()
        
        for i in 0 ..< a.count {
            for j in 0 ..< b.count {
                let aa: String = String(a.prefix(i) + b.suffix(b.count - i))
                let bb: String = String(b.prefix(j) + a.suffix(a.count - j))
                
                if isPalindrome(aa) || isPalindrome(bb) {
                    return true
                }
            }
        }
                
        return false
    }
    
    
}
