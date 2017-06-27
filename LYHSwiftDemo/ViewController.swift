//
//  ViewController.swift
//  LYHSwiftDemo
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

var kSize=UIScreen.main.bounds;
var dataTable:UITableView!
var itemStringArr=["基本控件","软件部","咨询部","人事部","后勤部","产品部"]

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello, world!")
        makeTable()

    }
    // MARK: -table
    func makeTable (){
        dataTable=UITableView.init(frame: CGRect(x: 0.0, y: 64, width: kSize.width, height: kSize.height-64), style:.plain)
        dataTable.delegate=self;//实现代理
        dataTable.dataSource=self;//实现数据源
        dataTable.showsVerticalScrollIndicator = false
        dataTable.showsHorizontalScrollIndicator = false
        self.view.addSubview(dataTable)
        //tableFooter
        dataTable.tableFooterView = UIView.init()
    }
    
    // MARK: -table代理
    //段数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStringArr.count
    }
    
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }
    
    /*
     //头部高度
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 0.01
     }
     
     //底部高度
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     return 0.01
     }
     */
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         let indentifier = "CellA"
         var cell:TableViewCellA! = tableView.dequeueReusableCell(withIdentifier: indentifier) as? TableViewCellA
         if cell == nil {
         cell=TableViewCellA(style: .default, reuseIdentifier: indentifier)
         }
         
         
         return cell!
         */
        
        let identifier="identtifier";
        var cell=tableView.dequeueReusableCell(withIdentifier: identifier)
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier);
        }
        
        cell?.textLabel?.text = itemStringArr[indexPath.row];
        cell?.detailTextLabel?.text = "待添加内容";
        cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
        cell?.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
        
        return cell!
    }
    
    //选中cell时触发这个代理
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("indexPath.row = SelectRow第\(indexPath.row)行")
        switch indexPath.row {
        case 0:
            let bk = BaseKit();
            self.navigationController?.pushViewController(bk,animated:true);
        default:
            break
            
        }
    }
    
    //取消选中cell时，触发这个代理
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        print("indexPath.row = DeselectRow第\(indexPath.row)行")
    }
    
    //允许编辑cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //右滑触发删除按钮
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.init(rawValue: 1)!
    }
    
    //点击删除cell时触发
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        print("indexPath.row = editingStyle第\(indexPath.row)行")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

