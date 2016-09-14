//
//  FacebookFeedViewController.swift
//  FacebookFeed
//
//  Created by sanjeet on 9/12/16.
//  Copyright © 2016 sanjeet. All rights reserved.
//

import UIKit

class Post {
    
    var name:String?
    var statusText:String?
    var profileImageName :String?
    var statusImageName :String?
    var numLikes : Int?
    var numComments : Int?
}
class FacebookFeedViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var posts = [Post]()
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let postMark = Post()
        postMark.name = "Mark zuckerberg"
        postMark.statusText = "Meanwhile,Best turned to the dark side."
        postMark.profileImageName = "zuckerberg_profile"
        postMark.statusImageName = "zuckerberg"
        postMark.numLikes = 400
        postMark.numComments = 123
        
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.statusText = "Design is not just what it looks and feel like. Design is how it works.\n\n" +
            "Being the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful,that's what matter to me.\n\n" +
            "Sometimes when you innovate,you make mistakes.It is best to admit thme quickly,and get on with improving your other innovations."
        postSteve.profileImageName = "steave_profile"
        postSteve.statusImageName = "SteaveJobs"
        postSteve.numLikes = 500
        postSteve.numComments = 432
        
        let postGandhi = Post()
        postGandhi.name = "Mahatma Gandhi"
        postGandhi.statusText = "Live as if you were to die tomorrow; learn as if you were to live forever.\n" +
            "The weak can never forgive. Forgiveness is the attribute of the strong.\n" +
            "Happiness is when what you think,what you say,and what you do are in harmony."
        postGandhi.profileImageName = "gandhi_profile"
        postGandhi.statusImageName = "Gandhi"
        postGandhi.numLikes = 1000
        postGandhi.numComments = 345
        
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postGandhi)
        
        
        myCollectionView.backgroundColor = UIColor(white: 0.95, alpha: 1);
        myCollectionView.alwaysBounceVertical = true
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = "";
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : CustomCollectionViewCell = myCollectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        cell.post = posts[indexPath.item]
        
        /*if let name = posts[indexPath.item].name{
            
            cell.nameLabel.text = name
        }*/
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText{
        
            let rect = NSString(string: statusText).boundingRectWithSize(CGSizeMake(view.frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil)
            
            let knowHeight:CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            
            return CGSizeMake(view.frame.width, rect.height + knowHeight + 24)
        }
        return CGSizeMake(self.view.frame.width, 500)
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
}
