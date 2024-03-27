import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days = 0
    var done = 1
    var releasedFunctionInaDay: [Int] = []
    
    days = (100 - progresses[0]) / speeds[0] 
    if (100 - progresses[0]) % speeds[0] > 0 {
        days += 1
    }
    for i in 0..<progresses.count - 1 {
        if progresses[i + 1] + speeds[i + 1] * days >= 100 {
            done += 1
        } else {
            releasedFunctionInaDay.append(done)
            days = (100 - progresses[i + 1]) / speeds[i + 1]
            if (100 - progresses[i + 1]) % speeds[i + 1] > 0 {
                days += 1
            }
            done = 1
        }   
    }
    releasedFunctionInaDay.append(done)
    return releasedFunctionInaDay
    
}
