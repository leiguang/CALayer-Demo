//
//  ScrollLyrics.swift
//  LayerTest
//
//  Created by 雷广 on 2017/7/6.
//  Copyright © 2017年 leiguang. All rights reserved.
//

import UIKit

class ScrollLyrics: UIViewController {
    
    var tableView: UITableView!
    var row: Int = 0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        // tableView 的 superView 加上渐变的遮罩，这样，只要是放在 tableViewSuperView 上的视图，都是上层渐隐的效果。
        let tableSuperView = UIView(frame: CGRect(x: 40, y: 200, width: 330, height: 350))
        view.addSubview(tableSuperView)
        
        let gradient = CAGradientLayer()
        gradient.frame = tableSuperView.bounds
        gradient.colors = [UIColor.white.withAlphaComponent(0.3).cgColor, UIColor.white.cgColor, UIColor.white.withAlphaComponent(0.2).cgColor]
        gradient.locations = [0, 0.5, 1]
        tableSuperView.layer.mask = gradient
        
        tableView = UITableView(frame: tableSuperView.bounds, style: .plain)
        tableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(LyricsCell.self, forCellReuseIdentifier: "LyricsCell")
        tableView.dataSource = self
        tableSuperView.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        autoScrollTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
        timer = nil
    }
        
    func autoScrollTableView() {
        row = 0
        
        // timer 加入默认runloop，手指滑动时计时器会暂停
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if self.row+1 <= Lyrics.texts.count-1 {
                self.row += 1
            } else {    // 已滚动到最后一行
                self.row = 0
            }
            let indexPath = IndexPath(row: self.row, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
            print(self.row)
        }
    }
    
    deinit {
        print(self.description, "dealloc")
    }
}

extension ScrollLyrics: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lyrics.texts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LyricsCell", for: indexPath) as! LyricsCell
        cell.label.text = Lyrics.texts[indexPath.row]
        return cell
    }
}

class LyricsCell: UITableViewCell {
    
    let label = UILabel(frame: CGRect(x: 0, y: 5, width: 330, height: 34))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        label.textColor = .white
        label.textAlignment = .center
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct Lyrics {
    static let texts = ["",
                        "《清风莞月浮舟令》",
                        "清风兮，莞月兮，泛舟兮，赠清莞美人。",
                        "",
                        "A1",
                        "拢了一杯明月光 饮了一曲断肠",
                        "再搁下手中的桨 为你泊在渡口听香",
                        "A2",
                        "稚柳旧岸的雕梁 还掩着小岚窗",
                        "此时我伫立岸上 眺望着每一个远方 ",
                        "B1",
                        "你穿的一针一线刺痛过往",
                        "你写的一笔一划勾勒锋芒",
                        "纸上情长 泛了黄",
                        "嘲笑着我伤情的模样",
                        "B2",
                        "与你一朝一夕留在了浔阳",
                        "我在想那年那夜书的那章",
                        "徽墨兰香 轻舟上",
                        "吹皱了干涸的月光",
                        "A3",
                        "谁能共我醉一场 醉在此夜未央",
                        "谁又能知这月光 将你照得太渺茫",
                        "A4",
                        "若我是一缕痴狂 写着地老天荒",
                        "染在一片霓裳 愿你将我别在襟上",
                        "B3",
                        "你可知相思相见会有多长",
                        "在故乡朝露朝霜的小荷塘",
                        "风送花香 曲水廊",
                        "都成了我故梦的温床",
                        "B4",
                        "到如今此生此夜最是彷徨",
                        "空叹明年明月明明不能忘",
                        "若你在这 轻舟上",
                        "方能吹醒干涸的月光",
                        "",
                        ]
}
