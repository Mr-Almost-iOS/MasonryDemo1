//
//  FirstViewController.h
//  text
//
//  Created by 差不多先生 on 2021/9/6.
//
// 定义这个常量，就可以不用在开发过程中使用mas_前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import <UIKit/UIKit.h>
@protocol FirstViewControllerDelegate <NSObject>
- (void) pictureChange:(NSMutableArray*) array;
@end
NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController
@property (nonatomic, strong) NSMutableArray* ansArray;
@property (nonatomic, assign) id<FirstViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
