//
//  ViewController.h
//  text
//
//  Created by 差不多先生 on 2021/8/30.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
@interface ViewController : UIViewController<FirstViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray* imageArray;
@property (nonatomic, strong) UIButton* startButton;

@end

