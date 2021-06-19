import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var numSeats = Int()

    init(n: Int) {
        numSeats = n
        seats.reserveCapacity(n)
    }
     
    func seat() -> Int {
        var seat = Int()
        var maxDist = Int()
        if seats.count == 1 {
            seat = seats[0] >= numSeats-1-seats[0] ? 0 : numSeats-1
        }
        if seats.count > 1{
            for i in 0..<seats.count-1 {
                let left = seats[i], right = seats[i+1]
                let dist = (right - left)/2
                if dist > maxDist {
                    maxDist = dist
                    seat = left + maxDist
                }
            }
            if !seats.contains(0) && seats[0] >= maxDist {seat = 0}
            if !seats.contains(numSeats-1) && numSeats-1-seats[seats.count-1] > maxDist {seat = numSeats-1}
        }
        seats.append(seat)
        seats.sort()
        return seat
    }
     
    func leave(_ p: Int) {
        if seats.contains(p) {
            for i in 0..<seats.count {
                if seats[i] == p {
                    seats.remove(at: i)
                    break
                }
            }
        }
    }
}
