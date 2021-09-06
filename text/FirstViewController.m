//
//  FirstViewController.m
//  text
//
//  Created by 差不多先生 on 2021/9/6.
//
// 定义这个常量，就可以不用在开发过程中使用mas_前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
#import "FirstViewController.h"
#import "Masonry.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"选择照片";
    self.view.backgroundColor = [UIColor whiteColor];
    _ansArray = [[NSMutableArray alloc] init];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cancel的副本.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressReturn)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    NSArray* nameArray = [NSArray arrayWithObjects:@"WechatIMG8.jpeg", @"WechatIMG9.jpeg", @"WechatIMG9.jpeg", @"WechatIMG10.jpeg", @"WechatIMG11.jpeg", @"WechatIMG12.jpeg", nil];
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 2; i++) {
            UIButton* imageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            imageButton.tag = 101 + i + j * 2;
            UIImage* zpImage = [UIImage imageNamed:nameArray[i + j * 2]];
            [imageButton setImage:[zpImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//            imageButton.frame = CGRectMake(10 + 190 * i, 150 + 100 * j, 180, 100);
            UIImageView* xzImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xuanzhong的副本.png"]];
//            xzImageView.frame = CGRectMake(160 + 190 * i, 160 + 100 * j, 30, 30);
            xzImageView.hidden = YES;
            xzImageView.tag = 601 + i + j * 2;
            [imageButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:imageButton];
            [self.view addSubview:xzImageView];
            [imageButton makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view).offset(100 + 170 * j);
                if (i == 0) {
                    make.left.equalTo(self.view).offset(30);
                } else {
                    make.right.equalTo(self.view).offset(-30);
                }
            }];
            [xzImageView makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view).offset(100 + 170 * j);
                if (i == 0) {
                    make.left.equalTo(self.view).offset(150);
                } else {
                    make.right.equalTo(self.view).offset(-30);
                }
            }];
            
        }
    }
}
- (void) pressChange:(UIButton*) cButton {
    if (cButton.tag < 110) {
        for (UIView *deleteView in self.view.subviews) {
                if (deleteView.tag == 601 + cButton.tag - 101) {
                    deleteView.hidden = NO;
                }
         }
        NSString* str = [NSString stringWithFormat:@"WechatIMG%ld.jpeg", cButton.tag - 93];
        NSLog(@"%@", str);
        [_ansArray addObject:str];
        cButton.tag += 10;
    } else {
        cButton.tag -= 10;
        for (UIView *deleteView in self.view.subviews) {
                if (deleteView.tag == 601 + cButton.tag - 101) {
                    deleteView.hidden = YES;
                }
        }
        NSString* str = [NSString stringWithFormat:@"WechatIMG%ld.jpeg", cButton.tag - 93];
        [_ansArray removeObject:str];
    }
}
- (void) pressReturn {
    if (_ansArray.count == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [_delegate pictureChange:_ansArray];
    NSLog(@"%lu", _ansArray.count);
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
