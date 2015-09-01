//
//  ArticlesDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "ArticlesDetailViewController.h"
#import "ArticleSectionViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ArticlesDetailViewController ()
@end

@implementation ArticlesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scr_view = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview: self.scr_view];

    [self setupTextViews];
    [self setupImageViews];
    [self adjustAttributes];
    [self adjustContentSizes];
}

-(id)initWithData:(ArticleDataModel *)data{
    self = [super init];
    if(self){
        self.dataModel = data;
    }
    return self;
}

- (void)setupTextViews
{
    self.articleName                = [[UITextView alloc]initWithFrame:CGRectMake(10.0, 5.0, self.view.frame.size.width-20.0, 36.0)];
    NSMutableParagraphStyle *titleattr  = [[NSMutableParagraphStyle alloc] init];
    titleattr.lineHeightMultiple        = 0.75f;
    NSDictionary *titledic          = @{ NSParagraphStyleAttributeName:titleattr,};
    self.articleName.attributedText = [[NSAttributedString alloc] initWithString:self.dataModel.headline attributes:titledic];
    
    
    
    NSString *attr_str  = [NSString stringWithFormat:@"By %@", [NSString stringWithFormat:@"%@", self.dataModel.author]];
    self.by             = [[NSMutableAttributedString alloc] initWithString:attr_str];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0xFF3E0C)
                    range:[attr_str rangeOfString:self.dataModel.author]];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:[UIColor grayColor]
                    range:NSMakeRange(0,2)];
    
    self.authorName                 = [[UILabel alloc] initWithFrame:CGRectMake(15.0,
                                                                                self.articleName.frame.origin.y+self.articleName.frame.size.height-36.0,
                                                                                self.view.frame.size.width-30.0,
                                                                                36.0)];
    self.authorName.attributedText  = self.by;
    
    self.article_description        = [[UITextView alloc] initWithFrame:CGRectMake(15.0,
                                                                                   self.artImage.frame.origin.y+self.artImage.frame.size.height,
                                                                                   self.view.frame.size.width-30.0,
                                                                                   36.0)];
    self.article_description.text   = [NSString stringWithFormat:@"%@", self.dataModel.subtitle];
    
    self.article                    = [[UITextView alloc] initWithFrame:CGRectMake(15.0,
                                                                                   self.article_description.frame.origin.y+self.article_description.frame.size.height,
                                                                                   self.view.frame.size.width-30.0,
                                                                                   100)];
    self.article.text               = [NSString stringWithFormat:@"%@", self.dataModel.body];
    
    [self.scr_view addSubview:self.articleName];
    [self.scr_view addSubview:self.authorName];
    [self.scr_view addSubview:self.article_description];
    [self.scr_view addSubview:self.article];    
}

-(void) setupImageViews
{
    
    CDAAsset *asset = self.dataModel.thumbnails[0];
    UIImage *pic    = [UIImage imageWithData:[NSData dataWithContentsOfURL:asset.URL]];
    
    
    self.artImage   = [[UIImageView alloc] initWithImage:pic];
    if (pic)
    {
        [self.artImage setFrame:CGRectMake(0.0, self.authorName.frame.origin.y+self.authorName.frame.size.height+5, self.view.frame.size.width, 180.0)];
        [self.scr_view addSubview:self.artImage];
    }
}

-(void) adjustAttributes
{
    self.articleName.textAlignment      = NSTextAlignmentLeft;
    self.articleName.font               = [UIFont fontWithName:@"AvenirNext-Medium" size:23 ];
    self.articleName.textColor          = UIColorFromRGB(0x3f3f3f);
//    self.articleName.backgroundColor    = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.1];
    self.articleName.editable           = NO;
    self.articleName.scrollEnabled      = NO;
    
    self.authorName.textAlignment       = NSTextAlignmentLeft;
    self.authorName.font                = [UIFont fontWithName:@"Avenir-Book" size:11.5];
//    self.authorName.backgroundColor     = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.1];

    self.artImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.artImage.clipsToBounds   = YES;
    
    self.article_description.textAlignment      = NSTextAlignmentLeft;
    self.article_description.font               = [UIFont fontWithName:@"Avenir-Roman" size:11.5 ];
    self.article_description.textColor          = UIColorFromRGB(0x7f8c8d);
//    self.article_description.backgroundColor    = [UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:0.1];
    self.article_description.editable           = NO;
    self.article_description.scrollEnabled      = NO;
    
    self.article.textAlignment      = NSTextAlignmentLeft;
    self.article.font               = [UIFont fontWithName:@"Avenir-Light" size:12.5 ];
    self.article.textColor          = [UIColor blackColor];
//    self.article.backgroundColor    = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1];
    self.article.editable           = NO;
    self.article.scrollEnabled      = NO;
}

-(void) adjustContentSizes
{
    CGFloat fixedWidth1 = self.articleName.frame.size.width;
    CGSize newSize1     = [self.articleName sizeThatFits:CGSizeMake(fixedWidth1, INFINITY)];
    CGRect newFrame1    = self.articleName.frame;
    newFrame1.size      = CGSizeMake(fmaxf(newSize1.width, fixedWidth1), newSize1.height);
    self.articleName.frame = newFrame1;
    
    CGFloat fixedWidth2 = self.authorName.frame.size.width;
    CGSize newSize2     = [self.authorName sizeThatFits:CGSizeMake(fixedWidth2, INFINITY)];
    CGRect newFrame2    = CGRectMake(self.authorName.frame.origin.x,
                                     self.articleName.frame.origin.y+self.articleName.frame.size.height-(newSize2.height/2),
                                     self.authorName.frame.size.width,
                                     newSize2.height);
    self.authorName.frame = newFrame2;
    
    CGRect newFrame3    = CGRectMake(self.artImage.frame.origin.x,
                                     self.authorName.frame.origin.y+self.authorName.frame.size.height+5.0,
                                     self.artImage.frame.size.width,
                                     self.artImage.frame.size.height);
    self.artImage.frame = newFrame3;
    
    CGFloat fixedWidth4 = self.article_description.frame.size.width;
    CGSize newSize4     = [self.article_description sizeThatFits:CGSizeMake(fixedWidth4, INFINITY)];
    CGRect newFrame4    = CGRectMake(self.article_description.frame.origin.x,
                                     self.artImage.frame.origin.y+self.artImage.frame.size.height,
                                     self.article_description.frame.size.width,
                                     self.article_description.frame.size.height);
    newFrame4.size      = CGSizeMake(fmaxf(newSize4.width, fixedWidth4), newSize4.height);
    self.article_description.frame = newFrame4;
    
    CGFloat fixedWidth  = self.article.frame.size.width;
    CGSize newSize      = [self.article sizeThatFits:CGSizeMake(fixedWidth, INFINITY)];
    CGRect newFrame     = CGRectMake(self.article.frame.origin.x,
                                     self.article_description.frame.origin.y+self.article_description.frame.size.height,
                                     self.article.frame.size.width,
                                     self.article.frame.size.height);
    newFrame.size       = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.article.frame  = newFrame;
    
    [self.scr_view setContentSize:CGSizeMake(self.view.frame.size.width, self.articleName.frame.size.height+self.authorName.frame.size.height+self.artImage.frame.size.height+self.article_description.frame.size.height+self.article.frame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
