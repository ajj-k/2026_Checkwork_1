import Foundation

var failures = 0
func check(_ condition: Bool, _ label: String) {
    print("\(condition ? "PASS" : "FAIL")  \(label)")
    if !condition { failures += 1 }
}

let robot = Robot(name: "アオ")
check(robot.name == "アオ", "問1：引数の名前を保存")
check(robot.energy == 50, "初期エネルギーは50")
robot.charge()
check(robot.energy == 70, "問2：充電で20増える")
for _ in 0..<10 { robot.charge() }
check(robot.energy == 100, "問2：充電の上限は100")

let worker = Robot(name: "仕事係")
let first = worker.work()
check(first && worker.energy == 20, "問3：成功すると30減る")
let second = worker.work()
check(!second && worker.energy == 20, "問3：不足時は値を変えず失敗")

let boundary = Robot(name: "境界チェック")
boundary.charge() // 70
boundary.charge() // 90
_ = boundary.work() // 60
_ = boundary.work() // 30
check(boundary.energy == 30, "問3：境界チェックの準備（30）")
let exact = boundary.work()
check(exact && boundary.energy == 0, "問3：ちょうど30でも成功")
let empty = boundary.work()
check(!empty && boundary.energy == 0, "問3：0のときは失敗し、負にならない")

let guide: Robot = GuideRobot(name: "ソラ")
check(guide.greeting() == "こんにちは、ソラです。案内はまかせて！", "問4：別の名前でもあいさつが正しい")
let team = makeTeam()
check(team.count == 2, "問5：チームは2体")
if team.count == 2 {
    check(team[0] is GuideRobot && team[1] is CleaningRobot, "問5：種類と順序")
    check(team.map { $0.greeting() } == [
        "こんにちは、ミライです。案内はまかせて！",
        "こんにちは、ピカです。そうじはまかせて！"
    ], "問5：Robot型を通じて種類ごとのあいさつ")
}

let a = Robot(name: "共有")
let b = a
b.charge()
check(a.energy == 70, "発展：classの参照を共有")
let independent = Robot(name: "別個体")
check(independent.energy == 50, "別のインスタンスの状態は独立")
print("\n失敗：\(failures)件")
exit(failures == 0 ? 0 : 1)
