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
   // self.upview = [[UIView alloc] initWithFrame:self.scr_view.frame];
    
    [self.view addSubview: self.scr_view];

    [self setupViews];
    [self setupLabels];
    [self setupImage];
    
    [self.scr_view setContentSize:CGSizeMake(self.view.frame.size.width, self.articleName.frame.size.height+self.authorName.frame.size.height+self.artImage.frame.size.height+self.photoSource.frame.size.height+self.article.frame.size.height)];
    //TCArticleDataModel *article = [[TCArticleDataModel alloc]init];
}

-(id)initWithData:(ArticleDataModel *)data{
    self = [super init];
    if(self){
        self.dataModel = data;
    }
    return self;
}

#pragma AutoLayout Positioning Methods

- (void)setupViews
{
    self.articleName                = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 36.0)];
    self.articleName.text           = [NSString stringWithFormat:@"%@", self.dataModel.headline];
    
    NSString *attr_str  = [NSString stringWithFormat:@"By %@", [NSString stringWithFormat:@"%@", self.dataModel.author]];
    self.by         = [[NSMutableAttributedString alloc] initWithString:attr_str];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0xFF5722)
                    range:[attr_str rangeOfString:self.dataModel.author]];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0x7f8c8d)
                    range:NSMakeRange(0,2)];
    
    self.authorName                 = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.articleName.frame.origin.y+36.0, self.view.frame.size.width, 36.0)];
    self.authorName.attributedText  = self.by;
    
    CDAAsset *asset = self.dataModel.thumbnails[0];
    UIImage *pic = [UIImage imageWithData:[NSData dataWithContentsOfURL:asset.URL]];
    
    self.artImage = [[UIImageView alloc] initWithImage:pic];
    [self.artImage setFrame:CGRectMake(0.0, self.authorName.frame.origin.y+36.0, self.view.frame.size.width, 190.0)];

    self.photoSource                = [[UILabel alloc] initWithFrame:CGRectMake(0.0, self.artImage.frame.origin.y+190.0, self.view.frame.size.width, 36.0)];
    self.photoSource.text           = [NSString stringWithFormat:@"%@", self.dataModel.subtitle];
    
    self.article                    = [[UITextView alloc] initWithFrame:CGRectMake(0.0, self.photoSource.frame.origin.y+36, self.view.frame.size.width, 1000)];
    self.article.text               = [NSString stringWithFormat:@"%@", self.dataModel.body];
    
    /*
    [self.articleName   setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.authorName    setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.photoSource   setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.article       setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.artImage      setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    [self.upview addSubview:self.articleName];
    [self.upview addSubview:self.authorName];
    [self.upview addSubview:self.photoSource];
    [self.upview addSubview:self.article];
    [self.upview addSubview:self.artImage];
    */
    [self.scr_view addSubview:self.articleName];
    [self.scr_view addSubview:self.authorName];
    [self.scr_view addSubview:self.photoSource];
    [self.scr_view addSubview:self.article];
    [self.scr_view addSubview:self.artImage];
    
}


#pragma populating and appearance methods

-(void) setupLabels
{
    self.articleName.textAlignment      = NSTextAlignmentLeft;
    self.articleName.font               = [UIFont fontWithName:@"AvenirNext-Medium" size:24 ];
    self.articleName.textColor          = UIColorFromRGB(0x3f3f3f);
    self.articleName.backgroundColor    = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.1];

    self.authorName.textAlignment       = NSTextAlignmentLeft;
    self.authorName.font                = [UIFont fontWithName:@"Avenir-Roman" size:13];
    self.authorName.backgroundColor     = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:0.1];

    self.photoSource.textAlignment      = NSTextAlignmentLeft;
    self.photoSource.font               = [UIFont fontWithName:@"Avenir-Roman" size:11.5 ];
    self.photoSource.textColor          = UIColorFromRGB(0x7f8c8d);
    self.photoSource.backgroundColor    = [UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:0.1];

    self.article.textAlignment      = NSTextAlignmentLeft;
    self.article.font               = [UIFont fontWithName:@"Avenir-Roman" size:13 ];
    self.article.textColor          = [UIColor blackColor];
    self.article.backgroundColor    = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1];
    self.article.editable           = NO;
    self.article.scrollEnabled      = NO;
}

-(void) setupImage
{
    self.artImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.artImage.clipsToBounds   = YES;
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
