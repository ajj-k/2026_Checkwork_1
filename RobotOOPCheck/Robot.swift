import Combine

// このファイルの TODO 1〜5 を完成させよう。
// プロパティ・メソッドの名前や引数は変更しないでください。
class Robot: ObservableObject {
    let name: String
    @Published private(set) var energy: Int = 50

    init(name: String) {
        // TODO 1: 引数で受け取った名前をプロパティに保存する。
        self.name = "ななし"
    }

    func charge() {
        // TODO 2: energy を 20 増やす。ただし最大値は 100。
    }

    func work() -> Bool {
        // TODO 3: energy が 30 以上なら 30 減らして true を返す。
        // 足りなければ energy を変えずに false を返す。
        return false
    }

    func greeting() -> String {
        return "こんにちは、\(name)です。"
    }
}

class GuideRobot: Robot {
    override func greeting() -> String {
        // TODO 4: 「こんにちは、ミライです。案内はまかせて！」のように、
        // 親クラスのあいさつの末尾に「案内はまかせて！」を加える。
        // super を使い、名前を直接書き込まないこと。
        return super.greeting()
    }
}

// このクラスは完成済み。継承と override の参考にしよう。
class CleaningRobot: Robot {
    override func greeting() -> String {
        return super.greeting() + "そうじはまかせて！"
    }
}

func makeTeam() -> [Robot] {
    // TODO 5: GuideRobot（名前: ミライ）と CleaningRobot（名前: ピカ）を
    // この順に入れた配列を返す。戻り値の型 [Robot] は変えないこと。
    return []
}
