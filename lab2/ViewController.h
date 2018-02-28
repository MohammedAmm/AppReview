//
//  ViewController.h
//  lab2
//
//  Created by Sara Ashraf on 2/14/18.
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h> 
#import "ILMovieDBClient.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myimage;

//@property (weak, nonatomic) IBOutlet UIImageView *imgeView;


-(void)getData;

@end

