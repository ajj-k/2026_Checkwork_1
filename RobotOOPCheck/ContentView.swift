import SwiftUI

// 画面は完成済みです。解答するときは Robot.swift を編集してください。
struct ContentView: View {
    @StateObject private var robot = GuideRobot(name: "ミライ")
    @State private var message = "充電とお仕事を試してみよう。"

    var body: some View {
        NavigationStack {
            List {
                Section("今回のミッション") {
                    Text("Robot.swift の TODO 1〜5 を完成させよう。")
                    Text("最初は名前・充電・お仕事・あいさつ・チームが未完成です。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Section("ロボットの状態") {
                    Label(robot.name, systemImage: "person.crop.square")
                        .font(.title2.bold())
                    Text(robot.greeting())
                    ProgressView(value: Double(robot.energy), total: 100)
                    Text("エネルギー：\(robot.energy) / 100")
                    Button("充電する（＋20、最大100）") {
                        robot.charge()
                        message = "充電後のエネルギーを確認しよう。"
                    }
                    Button("お仕事する（−30）") {
                        message = robot.work()
                            ? "お仕事成功！" : "エネルギーが足りません。"
                    }
                    Text(message)
                        .foregroundStyle(.secondary)
                }

                Section("チームのあいさつ") {
                    let team: [Robot] = makeTeam()
                    if team.isEmpty {
                        Text("まだメンバーがいません。TODO 5 に挑戦！")
                    }
                    ForEach(team.indices, id: \.self) { index in
                        // 同じ greeting() でも、実際のクラスによって動作が変わる。
                        Text(team[index].greeting())
                    }
                }

                Section("考えてみよう") {
                    Text("なぜ画面から energy に直接代入できないのかな？")
                    Text("[Robot] に異なる種類のロボットを入れられるのはなぜ？")
                }
            }
            .navigationTitle("ロボット研究所")
        }
    }
}
