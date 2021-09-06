//
//  ViewController.m
//  text
//
//  Created by 差不多先生 on 2021/8/30.
//
// 定义这个常量，就可以不用在开发过程中使用mas_前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#import "ViewController.h"
#import "FirstViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_startButton setTitle:@"上传头像" forState:UIControlStateNormal];
    _startButton.tintColor = [UIColor blackColor];
    _startButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _startButton.backgroundColor = [UIColor systemGrayColor];
    [_startButton addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
//    self.view.backgroundColor = [UIColor systemBlueColor];
    [self.view addSubview:_startButton];
    [_startButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(150);
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
    }];
}
- (void) pressButton {
    FirstViewController *viewController = [[FirstViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    viewController.delegate = self;
    navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navigationController animated:YES completion:nil];
}
- (void) pictureChange:(NSMutableArray *)array {
    for (UIView *deleteView in self.view.subviews) {
            if (deleteView.tag == 101) {
                [deleteView removeFromSuperview];
            }
     }
    _imageArray = [NSMutableArray arrayWithArray:array];
    UIImage* ansImage = [UIImage imageNamed:_imageArray[0]];
    NSString* number = [NSString stringWithFormat:@"%lu", _imageArray.count];
    NSLog(@"1");
    UILabel* label = [[UILabel alloc] init];
    label.tag = 101;
    label.textColor = [UIColor redColor];
    label.text = number;
    label.frame = CGRectMake(260, 350, 20, 20);
    [_startButton setTitle:nil forState:UIControlStateNormal];
    [_startButton setImage:[ansImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.view addSubview:label];
}
@end
