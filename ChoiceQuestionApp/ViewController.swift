//
//  ViewController.swift
//  ChoiceQuestionApp
//
//  Created by mac on 2018/8/8.
//  Copyright © 2018年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var question_count = 0
    var score = 0

    
    var questions = [
        QandA(question: "請問現在問你問題的是誰?",choice: ["Papyrus","Sans","W.D.Gaster"],answer: "Sans"),
        QandA(question: "請問第一個掉進地下世界的人是誰?",choice: ["Toriel","Chara","Frisk"],answer: "Chara"),
        QandA(question: "Undyne在垃圾場相識並喜歡上的是誰?",choice: ["Papyrus","玩家操控的角色","Alphys"],answer: "Alphys"),
        QandA(question: "當遭遇怪物時，怪物對你的想法?",choice: ["想要殺死你","想與你玩耍","不想理你"],answer: "想要殺死你"),
        QandA(question: "請問這個遊戲作者是誰?",choice: ["一隻白色的狗","Toby Fox","Temmie"],answer: "Toby Fox"),
        QandA(question: "請問Temmie想要幹嘛?",choice: ["Temmie想要上大鞋(學)","Temmie想要肌肉","Temmie想要畫畫"],answer: "Temmie想要上大鞋(學)"),
        QandA(question: "請問遊戲中的白色博美犬是?",choice: ["Lesser Dog","Toby Fox","Temmie"],answer: "Toby Fox"),
        QandA(question: "如何刺激小狗狗(Lesser Dog)得到靈感?",choice: ["玩卡牌遊戲","一直摸摸它","使用棒子"],answer: "一直摸摸它"),
        QandA(question: "請問這個遊戲需要殺死怪物嗎?",choice: ["需要","不需要","看情況"],answer: "不需要"),
        QandA(question: "請問玩家操控的角色的能力?",choice: ["決心(Determination)","耐心(Patient)","勇氣(Bravery)"],answer: "決心(Determination)")]
    
    
    @IBOutlet weak var choiceNumberLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var sansImageView: UIImageView!
    @IBOutlet weak var sansAnswerLabel: UILabel!
    
    @IBOutlet weak var choiceView: UIView!
    @IBOutlet weak var nextIsHidden: UIButton!
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if question_count == questions.count {
            question_count = 0
            score = 0
            
            resultView.isHidden = true
            choiceView.isHidden = false
            nextIsHidden.setImage(UIImage(named: "FIGHT"), for: .normal)
            nextIsHidden.isHidden = true
            sansImageView.image = UIImage(named: "sans")
            sansAnswerLabel.text = ""
            questions.shuffle()
            showQuestion()
        }else{
            nextIsHidden.isHidden = true
            choiceView.isHidden = false
            sansImageView.image = UIImage(named: "sans")
            sansAnswerLabel.text = ""
            showQuestion()
        }
    }
    
    @IBOutlet var choiceBtnOutlet: [UIButton]!
    
    @IBAction func choiceButton(_ sender: UIButton) {
        if sender.currentTitle == questions[question_count-1].answer{
            print("正確答案")
            questionNumberLabel.text = ""
            questionLabel.text = ""
            sansAnswerLabel.text = "我想你該不會早就..."
            score += 10
            sansImageView.image = UIImage(named: "san_youtrue")
        } else {
            print("錯誤")
            questionNumberLabel.text = ""
            questionLabel.text = ""
            sansAnswerLabel.text = "我想沒那麼難\n有認真玩過的話"
            sansImageView.image = UIImage(named: "sans_youfalse")
        }
        if question_count == questions.count {
            print("結束")
            choiceView.isHidden = true
            resultView.isHidden = false
            nextIsHidden.isHidden = false
            nextIsHidden.setImage(UIImage(named: "SAVE"), for: .normal)
            scoreLabel.text = "分數：\(score)分"
            if score<60{
                playerImageView.image = UIImage(named: "Chara")
                talkLabel.text = "是否抹消並重塑這個世界?"
            }else{
                playerImageView.image = UIImage(named: "Frisk")
                talkLabel.text = "你感覺充滿了決心"
            }
        }else{
            nextIsHidden.isHidden = false
            choiceView.isHidden = true
        }
    }
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var talkLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sansAnswerLabel.text = ""
        questions.shuffle()
        showQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func showQuestion(){
        questionLabel.text = questions[question_count].question
        for choice in choiceBtnOutlet{
            choice.setTitle(questions[question_count].choice[choice.tag], for: .normal)
        }
        
        question_count += 1
        choiceNumberLabel.text = "第\(question_count)題"
        questionNumberLabel.text = "Q\(question_count):"
    }

}

