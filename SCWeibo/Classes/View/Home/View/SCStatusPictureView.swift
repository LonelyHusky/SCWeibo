//
//  SCStatusPictureView.swift
//  SCWeibo
//
//  Created by 云卷云舒丶 on 16/7/25.
//
//

import UIKit
// 每一个条目之间的间距
let SCStatusPictureItemMargin : CGFloat = 5
//每一条目的宽高
let SCStatusPictureItemWH : CGFloat = (SCReenW - 2 * SCStatusCellMargin - 2 * SCStatusPictureItemMargin) / 3





class SCStatusPictureView: UICollectionView {
    
    

    private let pictureCellId = "pictureCellId"
    
    var pic_urls: [SCStatusPhontoInfo]?{
        didSet{
            
            reloadData()
        }

    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    private func  setupUI(){
        
        backgroundColor = RandomColor
        // 注册Cell
        registerClass(SCStatusPictureViewCell.self, forCellWithReuseIdentifier: pictureCellId)
        //设置数据源
        self.dataSource = self
        
        //        每个条目之间的大小
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width:SCStatusPictureItemWH , height: SCStatusPictureItemWH)
        
        //        间隙
        layout.minimumLineSpacing = SCStatusPictureItemMargin
        layout.minimumInteritemSpacing = SCStatusPictureItemMargin
        
    }
    
    
}
extension SCStatusPictureView : UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pic_urls?.count ?? 0
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(pictureCellId, forIndexPath: indexPath) as! SCStatusPictureViewCell
        cell.backgroundColor = RandomColor
        cell.photoInfo = pic_urls![indexPath.item]
        return cell
        
    }

}
//自定义配图的cell
class SCStatusPictureViewCell : UICollectionViewCell{
    
    var photoInfo : SCStatusPhontoInfo?{
        didSet{
        
            pictureImage.sd_setImageWithURL(NSURL(string: photoInfo?.thumbnail_pic ?? ""), placeholderImage: UIImage(named: "timeline_card_top_background"))
            
//判断是否为动图
//            if let url = photoInfo?.thumbnail_pic where url.hasSuffix(".gif")   {
//                gifImage.hidden = false
//            }else{
//                gifImage.hidden = true
//            }
            gifImage.hidden = !(photoInfo?.thumbnail_pic ?? "").hasSuffix(".gif")

        }
    
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        contentView.addSubview(pictureImage)
        contentView.addSubview(gifImage)
        
        pictureImage.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        gifImage.snp_makeConstraints { (make) in
            make.trailing.bottom.equalTo(contentView)
        }
        
    }

//    MARK: - 懒加载
    private lazy var pictureImage : UIImageView = {
    
        let imageView = UIImageView(image: UIImage(named: "timeline_card_top_background"))
        imageView.contentMode = .ScaleAspectFill
//        把超出部分去掉
        imageView.clipsToBounds = true
        return imageView
  
    }()
    private lazy var gifImage : UIImageView = UIImageView(image: UIImage(named: "timeline_image_gif"))
}








