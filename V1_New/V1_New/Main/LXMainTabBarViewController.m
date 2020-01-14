//
//  LXMainTabBarViewController.m
//  V1_New
//
//  Created by Andy on 2020/1/14.
//  Copyright © 2020 Andy. All rights reserved.
//

#import "LXMainTabBarViewController.h"
#import "LXNavigationViewController.h"
#import "LXHomeViewController.h"
#import "LXSubscribeViewController.h"
#import "LXCollectionViewController.h"
#import "LXMineViewController.h"

#define  tarbar_edge_bottom (isFullScreen ? 3.0f : 3.0f)

@interface LXMainTabBarViewController ()

@property NSUInteger previousIndex;
@property (nonatomic, strong) NSArray *childVCArray;
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) LXHomeViewController *homeView;
@property (nonatomic, strong) LXSubscribeViewController *subscribeView;
@property (nonatomic, strong) LXCollectionViewController *collectionView;
@property (nonatomic, strong) LXMineViewController *mineView;

@end

@implementation LXMainTabBarViewController

- (void)dealloc {
    NSLog(@"LXMainTabBarViewController dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setTranslucent:NO];
    [self setControllers];
    [self setTabBarItems];
    self.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGRect tabFrame = self.tabBar.frame;
    if (tabFrame.size.height < MAINTARBAR_HEIGHT) {
        tabFrame.size.height = MAINTARBAR_HEIGHT;
        tabFrame.origin.y = self.tabBar.lx_top - tabFrame.size.height + self.tabBar.lx_height;
        self.tabBar.frame = tabFrame;
        [self reSetTabBar];
    }
}

- (void)reSetTabBar {
    
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.lx_width, MAINTARBAR_HEIGHT)];
    view.userInteractionEnabled = NO;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    view.image = [UIColor imageWithColor:[UIColor whiteColor]];
    self.backImageView = view;
    [[self.tabBar.subviews firstObject] insertSubview:view atIndex:0];
    
}

#pragma mark - method

-(void)setTabBarItems {
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            obj.tabBarItem.image = [[UIImage imageNamed:@"tabbar_home"]
                                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            obj.tabBarItem.title = @"首页";
            obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_home_selected"]
                                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else if (idx == 1) {
            obj.tabBarItem.image = [[UIImage imageNamed:@"tabbar_follow"]
                                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            obj.tabBarItem.title = @"订阅";
            obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_follow_selected"]
                                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else if (idx == 2) {
            obj.tabBarItem.image = [[UIImage imageNamed:@"tabbar_publish"]
                                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else if (idx == 3) {
            obj.tabBarItem.image = [[UIImage imageNamed:@"tabbar_message"]
                                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            obj.tabBarItem.title = @"收藏";
            obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_message_selected"]
                                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        } else if (idx == 4) {
            obj.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mine"]
                                    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            obj.tabBarItem.title = @"我的";
            obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mine_selected"]
                                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        obj.tabBarItem.imageInsets = UIEdgeInsetsMake(tarbar_edge_bottom, 0, -tarbar_edge_bottom, 0);
    }];
}

- (void)setControllers {
    
    self.homeView = [[LXHomeViewController alloc] init];
    LXNavigationViewController *homeNav = [[LXNavigationViewController alloc]initWithRootViewController:self.homeView];
    
    self.subscribeView = [[LXSubscribeViewController alloc]init];
    LXNavigationViewController *subscribeNav = [[LXNavigationViewController alloc]initWithRootViewController:self.subscribeView];
    
    UIViewController *publish = [UIViewController new];
    LXNavigationViewController *publishNav = [[LXNavigationViewController alloc]initWithRootViewController:publish];
    publish.view.backgroundColor = [UIColor brownColor];
    
    self.collectionView = [[LXCollectionViewController alloc]init];
    LXNavigationViewController *collectionNav = [[LXNavigationViewController alloc]initWithRootViewController:self.collectionView];
    
    self.mineView = [[LXMineViewController alloc]init];
    LXNavigationViewController *mineNav = [[LXNavigationViewController alloc]initWithRootViewController:self.mineView];
    
    self.viewControllers = @[homeNav, subscribeNav, publishNav, collectionNav, mineNav];
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == 2) {
        return NO;
    }
    return YES;
    
}

-(void)changeSelectedIndex:(NSNotification *)notify {
    NSInteger index = [notify.object integerValue];
    self.selectedIndex = index;
}


@end
