//
//  CustomCollectionViewCell.swift
//  FacebookFeed
//
//  Created by sanjeet on 9/13/16.
//  Copyright © 2016 sanjeet. All rights reserved.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var post : Post?{
        didSet{
        
            if let name = post?.name{
                
                let attributeText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName:UIFont.boldSystemFontOfSize(14)])
                attributeText.appendAttributedString(NSAttributedString(string: "\nDecember 18 .San Francisco .", attributes: [NSFontAttributeName:UIFont.systemFontOfSize(12),NSForegroundColorAttributeName:UIColor.rgb(155, green: 161, blue: 171)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                attributeText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributeText.string.characters.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe")
                attachment.bounds = CGRectMake(0, -2, 12, 12)
                attributeText.appendAttributedString(NSAttributedString(attachment: attachment))
                nameLabel.attributedText = attributeText
            }
            if let statusText = post?.statusText{
                statusTextView.text = statusText
            }
            if let profileImageName = post?.profileImageName{
                profileImageView.image = UIImage(named: profileImageName)
            }
            if let statusImageName = post?.statusImageName{
                statusImageView.image = UIImage(named:statusImageName)
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.SetupViews()
    }
    
    let statusTextView : UITextView = {
        
        let textView = UITextView()
        textView.text = "Meanwhile,Beast turned to the dark side."
        textView.font = UIFont.systemFontOfSize(14)
        textView.scrollEnabled = false
        return textView
    }()
    let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
        
    }()
    
    let profileImageView : UIImageView = {
    
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sanjeet")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    let statusImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Dog")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentsLabel : UILabel = {
    
        let label = UILabel()
        label.text = "488 Likes  10.7k Comments"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView : UIView = {
        
        let view =  UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton = CustomCollectionViewCell.buttonForTitle("like", imageName: "Like")
    let commentButton = CustomCollectionViewCell.buttonForTitle("Comment", imageName: "message")
    let shareButton = CustomCollectionViewCell.buttonForTitle("Share", imageName: "Share")
    
    static func buttonForTitle(title:String,imageName:String)->UIButton{
    
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(UIColor.rgb(143, green: 150, blue: 163), forState: .Normal)
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
        return button
    }
    
    func SetupViews(){
        backgroundColor = UIColor.whiteColor()
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView,nameLabel)
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat("H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat("H:|-12-[v0]|", views: likesCommentsLabel)
        addConstraintsWithFormat("H:|-12-[v0]-12-|", views: dividerLineView)
        //Button Constraint
        addConstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", views: likeButton,commentButton,shareButton)
        
        addConstraintsWithFormat("V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(0.8)][v5(44)]|", views: profileImageView,statusTextView,statusImageView,likesCommentsLabel,dividerLineView,likeButton)
        
        addConstraintsWithFormat("V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat("V:[v0(44)]|", views: shareButton)
        //addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView,"v1":nameLabel]))
        
        //addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        // addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[v0(44)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":profileImageView]))
    }
    
}

extension UIView{
    
    func addConstraintsWithFormat(format:String,views: UIView...)  {
        
        var viewsDictionary = [String:UIView]()
        
        for (index,view) in views.enumerate() {
            
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}

extension UIColor{

    static func rgb(red:CGFloat,green:CGFloat,blue:CGFloat)->UIColor{
    
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

