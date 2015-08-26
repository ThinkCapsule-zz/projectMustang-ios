//
//  DataFetcher.m
//  projectMustang-ios
//
//  Created by Alan Hsu on 2015-05-30.
//  Copyright (c) 2015 Alan Hsu. All rights reserved.
//

#import "DataFetcher.h"
#import <ContentfulDeliveryAPI/ContentfulDeliveryAPI.h>

@implementation DataFetcher


- (instancetype)init {
    
    self = [super init];
    
    if (self) {
   
        CDAConfiguration* config = [CDAConfiguration defaultConfiguration];
        config.server = @"preview.contentful.com";
        _fetchClient = [[CDAClient alloc] initWithSpaceKey:@"1oq1lgnwupsh" accessToken:@"ea40f4d68e1983a625ac5330daaaaee3befeda5a26dc4da674ccee3b5dec4037" configuration: config];
    }
    
    return self;
    
}

+(DataFetcher*)singletonInstance{
    
    static dispatch_once_t onceToken;
    static DataFetcher* singleton;
    
    dispatch_once(&onceToken, ^{
        singleton = [[DataFetcher alloc] init];
    });
    
    return singleton;
}

#pragma mark -
#pragma mark Fetch Methods

- (void) fetchWithIdArticle:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ @"content_type": @"1or7CAktokKiIUogkmU8O4"}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             
                             self.articleArray = [[NSMutableArray alloc]init];
                             for (NSInteger i = array.count-1; i >=0; i--){
                                 CDAEntry   *temp   = [array objectAtIndex:i];
                                 
                                 if (temp.fields[@"headline"])
                                 {
                                     NSString   *type   = temp.fields[@"contentType"];
                                     NSString   *art    = temp.fields[@"articleId"];
                                     NSString   *head   = temp.fields[@"headline"];
                                     NSString   *sub    = temp.fields[@"subtitle"];
                                     NSString   *aut    = temp.fields[@"author"];
                                     NSString   *bod    = temp.fields[@"body"];
                                     NSDate     *date   = temp.fields[@"publishDate"];
                                     NSArray    *thumb  = temp.fields[@"thumbnails"];
                                     NSString   *tags   = temp.fields[@"tags"];
                                     
                                     ArticleDataModel *articleModel = [[ArticleDataModel alloc]initWithContentType:type andArticleId:art andHeadline:head andSubtitle:sub andAuthor:aut andBody:bod andPublishDate:date andThumbnails:thumb andTags:tags];
                                     
                                     [self.articleArray addObject:articleModel];
                                 }
                                 
                                 
                             }
                             
                             NSMutableArray *temp = [self.articleArray objectAtIndex:0];
                             if (!temp) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, self.articleArray, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}

- (void) fetchWithIdBlog:(myCompletionBlock)completionBlock{
    CDAClient *client = [DataFetcher singletonInstance].fetchClient;
    
    [client fetchEntriesMatching:@{ @"content_type": @"5gLJdg7h32eGomEcAGMGsS"}
                         success:^(CDAResponse *response, CDAArray *entries){
                             self.array = entries.items;
                             NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.array];
                             
                             self.blogArray = [[NSMutableArray alloc]init];
                             for (NSInteger i = array.count-1; i >=0; i--){
                                 CDAEntry   *temp   = [array objectAtIndex:i];
                                 
                                 if (temp.fields[@"blogId"])
                                 {
                                     NSString   *type   = temp.fields[@"contentType"];
                                     NSString   *blog    = temp.fields[@"blogId"];
                                     NSString   *series   = temp.fields[@"seriesName"];
                                     NSString   *description    = temp.fields[@"description"];
                                     NSString   *aut    = temp.fields[@"author"];
                                     NSString   *bod    = temp.fields[@"body"];
                                     NSDate     *date   = temp.fields[@"publishDate"];
                                     NSArray    *thumb  = temp.fields[@"thumbnails"];
                                     NSArray   *tags   = temp.fields[@"tags"];
                                     
                                     BlogDataModel *blogModel = [[BlogDataModel alloc]initWithContent:type andBlogId:blog andSeries:series andDescrip:description andAuthor:aut andBody:bod andDate:date andThumbs:thumb andTags:tags];
                                     
                                     [self.blogArray addObject:blogModel];
                                 }
                                 
                                 
                             }
                             
                             NSMutableArray *temp = [self.blogArray objectAtIndex:0];
                             if (!temp) {
                                 completionBlock(NO, nil, nil);
                             }else{
                                 completionBlock(YES, self.blogArray, nil);
                             }
                             
                         }
                         failure:^(CDAResponse *response, NSError *error){
                             NSLog(@"%@", error);
                             completionBlock(NO, nil, error);
                         }
     ];
}



@end
