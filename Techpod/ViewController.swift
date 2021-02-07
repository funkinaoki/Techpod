//
//  ViewController.swift
//  Techpod
//
//  Created by 八幡尚希 on 2021/02/06.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    //storyBoardで扱うtableviewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    
    //音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはviewcontrollerクラスに書くよという設定
        table.dataSource = self
        
        //テーブルビューのデリゲートメソッドはViewConrollerメソッドに書くよ、という設定
        table.delegate = self
        
        //songNameArrayに曲名を入れてくよ
        songNameArray = ["カノン", "エリー瀬のために", "G戦場のアリア"]
        
        //fileNameArrayのファイル名を入れてく
        fileNameArray = ["cannon", "elise", "aria"]
        
        //imageNameArrayの曲の画像を入れていく
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg","Bach.jpg"]
        
        
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セルの付属のtextLabelにテストと表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルに音楽家の画像を表示する
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    
    //セルが押された時に呼ばれるデリゲートメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        
        //音楽ファイルの設定（パスを取得）
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    }
    


}

