//
//  ViewController.swift
//  Search_1
//
//  Created by EMGRAM on 2020/11/23.
//

import UIKit

class ViewController: UIViewController{
    
    var wordList = ["all", "blue", "sky", "hello", "number", "marvel", "super", "milk", "fruit",
                    "banana", "start", "end", "red", "yellow", "black", "mint", "orange", "best", "dog",
                    "cat", "queen", "gray", "친구", "사람", "사랑", "써울", "거리", "바나나", "라면", "경기도", "바다",
                    "하늘", "홍삼"]

    
    var filteredWordList: [String] = []
    var isFiltered = false
    @IBOutlet weak var searchResultTableView: UITableView!
    
    // 셀 구성
    // 필터된 결과
    // 전체결과
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        searchResultTableView.register(UINib(nibName: "WordCell", bundle: nil), forCellReuseIdentifier: "wordCell" )
        //storyboard에서 cell을 추가하면 register과정이 필요없지만, 외부에서 만든 셀은 반드시 등록을 해주어야 한다.
        let searchC = UISearchController(searchResultsController: nil)
        searchC.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchC
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }


}

//작동하는 방법은 똑같지만 코드를 구분하기 위해 이러한 구현방식을 사용한다.
//이렇게 하면 하나의 클래스 내용이 커지는 것을 방지할 수 있다.

extension ViewController:UITableViewDelegate{
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isFiltered {
        case true:
            return filteredWordList.count
        case false:
            return wordList.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    //셀의 높이를 수치로 변경
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordCell
        //celltype으로 캐스팅을 해줘야한다.
        switch isFiltered {
        case true:
            cell.wordLabel.text = filteredWordList[indexPath.row]
        case false:
            cell.wordLabel.text = wordList[indexPath.row]
            
        }
        return cell
    }
}

extension ViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let hasText = searchController.searchBar.text?.lowercased(){
            if hasText.isEmpty{
                isFiltered = false
            }else{
                isFiltered = true
//                filteredWordList = textList.filter({ (element) -> Bool in
//                    element.contains(hasText)

//                })
                //위랑 똑같은 코드인데 많이 생략된 코드
                filteredWordList = wordList.filter({ $0.contains(hasText)})
                
            }
        }
        searchResultTableView.reloadData()
    }
    
}

