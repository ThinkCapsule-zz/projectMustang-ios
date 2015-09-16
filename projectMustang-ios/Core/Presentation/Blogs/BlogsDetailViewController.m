//
//  BlogsDetailViewController.m
//  projectMustang-ios
//
//  Created by selin acar on 2015-07-18.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "BlogsDetailViewController.h"
#import "BlogSectionViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BlogsDetailViewController ()
@end

@implementation BlogsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.scr_view = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview: self.scr_view];
    
    [self setupTextViews];
    [self setupImageViews];
    [self adjustAttributes];
    [self adjustContentSizes];
}

-(id)initWithData:(BlogDataModel *)data{
    self = [super init];
    if(self){
        self.dataModel = data;
    }
    return self;
}

- (void)setupTextViews
{
    self.blogPostName                   = [[UITextView alloc]initWithFrame:CGRectMake(10.0, 5.0, self.view.frame.size.width-20.0, 36.0)];
    NSMutableParagraphStyle *titleattr  = [[NSMutableParagraphStyle alloc] init];
    titleattr.lineHeightMultiple        = 0.75f;
    NSDictionary *titledic              = @{ NSParagraphStyleAttributeName:titleattr,};
    self.blogPostName.attributedText    = [[NSAttributedString alloc] initWithString:self.dataModel.series attributes:titledic];
    
    
    NSString *auth;
    if (!self.dataModel.author) {
        auth = @"Anonymous";
    }
    else{
        auth = self.dataModel.author;
    }
    
    NSString *attr_str  = [NSString stringWithFormat:@"By %@", [NSString stringWithFormat:@"%@", auth]];
    self.by             = [[NSMutableAttributedString alloc] initWithString:attr_str];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:UIColorFromRGB(0xFF3E0C)
                    range:[attr_str rangeOfString:auth]];
    [self.by addAttribute:NSForegroundColorAttributeName
                    value:[UIColor grayColor]
                    range:NSMakeRange(0,2)];
    
    self.authorName                 = [[UILabel alloc] initWithFrame:CGRectMake(15.0,
                                                                                self.blogPostName.frame.origin.y+self.blogPostName.frame.size.height-36.0,
                                                                                self.view.frame.size.width-30.0,
                                                                                36.0)];
    self.authorName.attributedText  = self.by;
    
    self.blogDesc        = [[UITextView alloc] initWithFrame:CGRectMake(15.0,
                                                                                   self.blogPostImage.frame.origin.y+self.blogPostImage.frame.size.height,
                                                                                   self.view.frame.size.width-30.0,
                                                                                   36.0)];
    self.blogDesc.text   = [NSString stringWithFormat:@"%@", self.dataModel.blogDescription];
    
    self.blogPost                    = [[UITextView alloc] initWithFrame:CGRectMake(15.0,
                                                                                   self.blogDesc.frame.origin.y+self.blogDesc.frame.size.height,
                                                                                   self.view.frame.size.width-30.0,
                                                                                   100)];
    self.blogPost.text               = [NSString stringWithFormat:@"%@", self.dataModel.body];
    
    [self.scr_view addSubview:self.blogPostName];
    [self.scr_view addSubview:self.authorName];
    [self.scr_view addSubview:self.blogDesc];
    [self.scr_view addSubview:self.blogPost];
}

-(void) setupImageViews
{
    
    CDAAsset *asset = self.dataModel.thumbnails[0];
    UIImage *pic    = [UIImage imageWithData:[NSData dataWithContentsOfURL:asset.URL]];
    
    
    self.blogPostImage   = [[UIImageView alloc] initWithImage:pic];
    if (pic)
    {
        [self.blogPostImage setFrame:CGRectMake(0.0, self.authorName.frame.origin.y+self.authorName.frame.size.height+5, self.view.frame.size.width, 180.0)];
        [self.scr_view addSubview:self.blogPostImage];
    }
}

-(void) adjustAttributes
{
    self.blogPostName.textAlignment      = NSTextAlignmentLeft;
    self.blogPostName.font               = [UIFont fontWithName:@"AvenirNext-Medium" size:23 ];
    self.blogPostName.textColor          = UIColorFromRGB(0x3f3f3f);
    self.blogPostName.editable           = NO;
    self.blogPostName.scrollEnabled      = NO;
    
    self.authorName.textAlignment       = NSTextAlignmentLeft;
    self.authorName.font                = [UIFont fontWithName:@"Avenir-Book" size:11.5];
    
    self.blogPostImage.contentMode     = UIViewContentModeScaleAspectFill;
    self.blogPostImage.clipsToBounds   = YES;
    
    self.blogDesc.textAlignment      = NSTextAlignmentLeft;
    self.blogDesc.font               = [UIFont fontWithName:@"Avenir-Roman" size:11.5 ];
    self.blogDesc.textColor          = UIColorFromRGB(0x7f8c8d);
    self.blogDesc.editable           = NO;
    self.blogDesc.scrollEnabled      = NO;
    
    self.blogPost.textAlignment      = NSTextAlignmentLeft;
    self.blogPost.font               = [UIFont fontWithName:@"Avenir-Light" size:12.5 ];
    self.blogPost.textColor          = [UIColor blackColor];
    self.blogPost.editable           = NO;
    self.blogPost.scrollEnabled      = NO;
}

-(void) adjustContentSizes
{
    CGFloat fixedWidth1 = self.blogPostName.frame.size.width;
    CGSize newSize1     = [self.blogPostName sizeThatFits:CGSizeMake(fixedWidth1, INFINITY)];
    CGRect newFrame1    = self.blogPostName.frame;
    newFrame1.size      = CGSizeMake(fmaxf(newSize1.width, fixedWidth1), newSize1.height);
    self.blogPostName.frame = newFrame1;
    
    CGFloat fixedWidth2 = self.authorName.frame.size.width;
    CGSize newSize2     = [self.authorName sizeThatFits:CGSizeMake(fixedWidth2, INFINITY)];
    CGRect newFrame2    = CGRectMake(self.authorName.frame.origin.x,
                                     self.blogPostName.frame.origin.y+self.blogPostName.frame.size.height-(newSize2.height/2),
                                     self.authorName.frame.size.width,
                                     newSize2.height);
    self.authorName.frame = newFrame2;
    
    CGRect newFrame3    = CGRectMake(self.blogPostImage.frame.origin.x,
                                     self.authorName.frame.origin.y+self.authorName.frame.size.height+5.0,
                                     self.blogPostImage.frame.size.width,
                                     self.blogPostImage.frame.size.height);
    self.blogPostImage.frame = newFrame3;
    
    CGFloat fixedWidth4 = self.blogDesc.frame.size.width;
    CGSize newSize4     = [self.blogDesc sizeThatFits:CGSizeMake(fixedWidth4, INFINITY)];
    CGRect newFrame4    = CGRectMake(self.blogDesc.frame.origin.x,
                                     self.blogPostImage.frame.origin.y+self.blogPostImage.frame.size.height,
                                     self.blogDesc.frame.size.width,
                                     self.blogDesc.frame.size.height);
    newFrame4.size      = CGSizeMake(fmaxf(newSize4.width, fixedWidth4), newSize4.height);
    self.blogDesc.frame = newFrame4;
    
    CGFloat fixedWidth  = self.blogPost.frame.size.width;
    CGSize newSize      = [self.blogPost sizeThatFits:CGSizeMake(fixedWidth, INFINITY)];
    CGRect newFrame     = CGRectMake(self.blogPost.frame.origin.x,
                                     self.blogDesc.frame.origin.y+self.blogDesc.frame.size.height,
                                     self.blogPost.frame.size.width,
                                     self.blogPost.frame.size.height);
    newFrame.size       = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.blogPost.frame  = newFrame;
    
    [self.scr_view setContentSize:CGSizeMake(self.view.frame.size.width, self.blogPostName.frame.size.height+self.authorName.frame.size.height+self.blogPostImage.frame.size.height+self.blogDesc.frame.size.height+self.blogPost.frame.size.height)];
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
