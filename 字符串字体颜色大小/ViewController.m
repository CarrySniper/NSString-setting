//
//  ViewController.m
//  字符串字体颜色大小
//
//  Created by CK_chan on 15/5/7.
//  Copyright (c) 2015年 CK_chan. All rights reserved.
//


/*
 alignment //对齐方式
 firstLineHeadIndent //首行缩进
 headIndent //缩进
 tailIndent //尾部缩进
 lineBreakMode //断行方式
 maximumLineHeight //最大行高
 minimumLineHeight //最低行高
 lineSpacing //行距
 paragraphSpacing //段距
 paragraphSpacingBefore //段首空间
 baseWritingDirection //句子方向
 lineHeightMultiple //可变行高,乘因数。
 hyphenationFactor //连字符属性
 
 NSString *const NSForegroundColorAttributeName;//值为UIColor，字体颜色，默认为黑色。
 NSString *const NSBackgroundColorAttributeName;//值为UIColor，字体背景色，默认没有。
 NSString *const NSLigatureAttributeName;//值为整型NSNumber，连字属性，一般中文用不到，在英文中可能出现相邻字母连笔的情况。0为不连笔；1为默认连笔，也是默认值；2在ios 上不支持。
 NSString *const NSKernAttributeName;//值为浮点数NSNumber，字距属性，默认值为0。
 
 NSString *const NSStrikethroughStyleAttributeName;//值为整型NSNumber，可取值为
 enum {
 NSUnderlineStyleNone = 0×00,
 NSUnderlineStyleSingle = 0×01,
 };设置删除线。
 
 NSString *const NSUnderlineStyleAttributeName;//同上。设置下划线。
 NSString *const NSStrokeColorAttributeName;//值为UIColor，默认值为nil，设置的属性同ForegroundColor。
 NSString *const NSStrokeWidthAttributeName;//值为浮点数NSNumber。设置比画的粗细。
 NSString *const NSShadowAttributeName;//值为NSShadow，设置比画的阴影，默认值为nil。
 NSString *const NSVerticalGlyphFormAttributeName;//值为整型NSNumber，0为水平排版的字，1为垂直排版的字。
 */
#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    //1.定义全局tableView
    
    //2.初始化_tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    //3.设置代理，头文件也要包含 UITableViewDelegate,UITableViewDataSource
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //4.添加_tableView
    [self.view addSubview:self.tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"这个自己命名"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"这个自己命名"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset=UIEdgeInsetsZero;
        cell.clipsToBounds = YES;
    }
    
    NSString *text = [NSString stringWithFormat:@"%ld *字符串字体颜色大小等样式显示",indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.attributedText = [self stype_0:text];
            break;
        case 1:
            cell.textLabel.attributedText = [self stype_1:text];
            break;
        case 2:
            cell.textLabel.attributedText = [self stype_2:text];
            break;
        case 3:
            cell.textLabel.attributedText = [self stype_3:text];
            break;
        case 4:
            cell.textLabel.attributedText = [self stype_4:text];
            break;
        case 5:
            cell.textLabel.attributedText = [self stype_5:text];
            break;
        case 6:
            cell.textLabel.attributedText = [self stype_6:text];
            break;
        case 7:
            cell.textLabel.attributedText = [self stype_7:text];
            break;
        case 8:
            cell.textLabel.attributedText = [self stype_8:text];
            break;
        case 9:
            cell.textLabel.attributedText = [self stype_9:text];
            break;
            
        default:
            cell.textLabel.text = [NSString stringWithFormat:@"asdf %ld",indexPath.row];
            break;
    }
    
    
    
    
    
    return cell;
}

// NSMakeRange(index,length); index从0开始

- (NSMutableAttributedString *)stype_0:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;//模糊度
    shadow.shadowColor = [UIColor cyanColor];
    shadow.shadowOffset = CGSizeMake(1, 3);
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:20],//字体大小
                           NSForegroundColorAttributeName:[UIColor redColor],//字体前景颜色（字体颜色）
                           NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleThick],//设置下划线样式，iOS8为NSNumber类型
                           
                           NSStrokeColorAttributeName:[UIColor blueColor],//设置文字描边颜色(设置描边宽度)
                           NSStrokeWidthAttributeName:@3,//设置描边宽度，NSNumber类型
                           
                           NSShadowAttributeName:shadow,
                           NSVerticalGlyphFormAttributeName:[NSNumber numberWithInt:NSValidationErrorMinimum],//0为水平排版的字，1为垂直排版的字。
                           }
                   range:NSMakeRange(0, [atStr length])];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_1:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];

    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:20],//字体大小
                           }
                   range:NSMakeRange(0, [atStr length])];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_2:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];

    [atStr addAttributes:@{
                           NSForegroundColorAttributeName:[UIColor redColor],//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(0, [atStr length])];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_3:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [atStr addAttributes:@{
                           NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleThick],//设置下划线样式，iOS8为NSNumber类型
                           }
                   range:NSMakeRange(0, [atStr length])];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_4:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [atStr addAttributes:@{
                           NSStrokeColorAttributeName:[UIColor blueColor],//设置文字描边颜色(设置描边宽度)
                           NSStrokeWidthAttributeName:@3,//设置描边宽度，NSNumber类型
                           }
                   range:NSMakeRange(0, [atStr length])];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_5:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;//模糊度
    shadow.shadowColor = [UIColor cyanColor];
    shadow.shadowOffset = CGSizeMake(1, 3);
    [atStr addAttributes:@{
                           NSShadowAttributeName:shadow,
                           NSVerticalGlyphFormAttributeName:[NSNumber numberWithInt:NSValidationErrorMinimum],//0为水平排版的字，1为垂直排版的字。
                           }
                   range:NSMakeRange(0, [atStr length])];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_6:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:25],//字体大小
                           NSForegroundColorAttributeName:[UIColor redColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(0, 5)];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_7:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:25],//字体大小
                           NSForegroundColorAttributeName:[UIColor redColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(0, 3)];
    
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:12],//字体大小
                           NSForegroundColorAttributeName:[UIColor purpleColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(7, [atStr length]-7)];
    
    return atStr;
}
- (NSMutableAttributedString *)stype_8:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:25],//字体大小
                           NSForegroundColorAttributeName:[UIColor redColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(0, 3)];
    
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:15],//字体大小
                           NSForegroundColorAttributeName:[UIColor purpleColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(3, [atStr length]-3)];
    
    [atStr addAttributes:@{
                           NSBackgroundColorAttributeName:[UIColor greenColor]//字体背景颜色
                           }
                   range:NSMakeRange(1, 5)];
    [atStr addAttributes:@{
                           NSBackgroundColorAttributeName:[UIColor yellowColor]//字体背景颜色
                           }
                   range:NSMakeRange(8, [atStr length]-8)];
    
    
    return atStr;
}
- (NSMutableAttributedString *)stype_9:(NSString *)string{
    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc]initWithString:string];
    
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:15],//字体大小
                           NSForegroundColorAttributeName:[UIColor blueColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(0, 4)];
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:25],//字体大小
                           NSForegroundColorAttributeName:[UIColor greenColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(4, 8)];
    [atStr addAttributes:@{
                           NSFontAttributeName:[UIFont boldSystemFontOfSize:35],//字体大小
                           NSForegroundColorAttributeName:[UIColor redColor]//字体前景颜色（字体颜色）
                           }
                   range:NSMakeRange(8, [atStr length]-8)];
    
    return atStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
