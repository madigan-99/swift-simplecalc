print("Welcome to the UW Calculator Playground")

// Take an array of strings and calculates
// simple operations like count, avg, factorial
func calculate(_ args: [String]) -> Int {
    let num_expr = args.count
    let operations = args[num_expr - 1]
    var res = 0
    if num_expr > 1 {
        if operations == "count" {
            res = num_expr - 1
        } else if operations == "avg" {
            for x in 0...num_expr-2 {
                res += Int(args[x])!
            }
            res = res / (num_expr-1)
        } else if operations == "fact" {
            let val = Int(args[0])!
            res = 1
            if val != 0 {
                for x in 1...abs(val) {
                    res = res * x
                }
                if val < 0 {
                    res *= -1
                }
            }
        } else {
            if args[1] == "+" {
                res = Int(args[0])! + Int(args[2])!
            } else if args[1] == "-" {
                res = Int(args[0])! - Int(args[2])!
            } else if args[1] == "*" {
                res = Int(args[0])! * Int(args[2])!
            } else if args[1] == "/" {
                res = Int(args[0])! / Int(args[2])!
            } else if args[1] == "%" {
                res = Int(args[0])! % Int(args[2])!
            }
        }
    }
    return res
}

func calculate(_ arg: String) -> Int {
    let arr = arg.split(separator: " ")
    var newArr = [String]()
    for i in 0...arr.count - 1 {
        newArr.append(String(arr[i]))
    }
    
    return calculate(newArr)
}
// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0


calculate(["1", "2", "3", "4", "5", "avg"]) == 3
// 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
// 12 / 4 = 3
calculate(["2", "avg"]) == 2
// 2 / 1 = 2
calculate(["avg"]) == 0
// 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0


calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
calculate("-5 fact") == -120
calculate("-4 -3 3 -20 avg") == -6

// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculateDoubles(_ args: [String]) -> Double {
    let num_expr = args.count
    let operations = args[num_expr - 1]
    var res = 0.0
    if num_expr > 1 {
        if operations == "count" {
            res = Double(num_expr) - 1.0
        } else if operations == "avg" {
            for x in 0...num_expr-2 {
                res += Double(args[x])!
            }
            res = res / (Double(num_expr)-1.0)
        } else if operations == "fact" {
            let val = Double(args[0])!
            res = 1.0
            
            if val != 0.0 {
                for x in 1...Int(abs(val)) {
                    res = res * Double(x)
                }
                if val < 0.0 {
                    res *= -1.0
                }
            }
        } else {
            if args[1] == "+" {
                res = Double(args[0])! + Double(args[2])!
            } else if args[1] == "-" {
                res = Double(args[0])! - Double(args[2])!
            } else if args[1] == "*" {
                res = Double(args[0])! * Double(args[2])!
            } else if args[1] == "/" {
                res = Double(args[0])! / Double(args[2])!
            } else if args[1] == "%" {
                res = Double(args[0])!.truncatingRemainder(dividingBy: Double(args[2])!)
            }
        }
    }
     return res
}
func calculateDoubles(_ arg: String) -> Double {
    let arr = arg.split(separator: " ")
    var newArr = [String]()
    for i in 0...arr.count - 1 {
        newArr.append(String(arr[i]))
    }
    return calculateDoubles(newArr)
    
}

calculateDoubles(["2.0", "+", "2.0"]) == 4.0
calculateDoubles([".5", "+", "1.5"]) == 2.0
calculateDoubles(["12.0", "-", "12.0"]) == 0.0
calculateDoubles(["2.5", "*", "2.5"]) == 6.25
calculateDoubles(["2.0", "/", "2.0"]) == 1.0
calculateDoubles(["2.0", "%", "2.0"]) == 0.0
calculateDoubles("8.75 % .75") == 0.5
calculateDoubles("1.0 2.0 3.0 4.0 5.0 count") == 5

calculateDoubles(["-5.0", "fact"]) == -120.0
calculateDoubles(["-4.0", "fact"]) == -24.0
