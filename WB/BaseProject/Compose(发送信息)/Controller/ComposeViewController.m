//
//  ComposeViewController.m
//  BaseProject
//
//  Created by apple-jd28 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ComposeViewController.h"
#import "WRTextView.h"
#import "WRComposeToolBar.h"
#import "WRComposePhotes.h"


@interface ComposeViewController () <UITextViewDelegate,WRComposeToolBarDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, weak) WRTextView *textView;
@property (nonatomic, weak) WRComposeToolBar *toolBar;
@property (nonatomic, weak) UIBarButtonItem *rightItem;
@property (nonatomic, weak) WRComposePhotes *photos;
@end

@implementation ComposeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpTextView];
    
    [self setUpTabButton];
    
    [self setUpToolBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self addPhotoView];
}

#pragma mark - addPhotoView添加图片视图

- (void)addPhotoView
{
    WRComposePhotes *photos = [WRComposePhotes new];
    
    [_textView addSubview:photos];
    
    [photos mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kWindowW, kWindowW));
        make.center.mas_equalTo(0);
    }];
    _photos = photos;
}

#pragma mark -设置导航栏
- (void)setUpTabButton
{
    self.title  = @"发微博";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:0 target:self action:@selector(dismiss)];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn sizeToFit];
    
    [btn bk_addEventHandler:^(id sender) {
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    item.enabled = NO;
    
    _rightItem = item;
    self.navigationItem.rightBarButtonItem = item;
}
#pragma mark - 点击导航栏左右按钮
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 设置工具栏
- (void)setUpToolBar
{
    WRComposeToolBar *toolBar = [[WRComposeToolBar alloc] init];
    
    [self.view addSubview:toolBar];
    
    [toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    toolBar.delegate = self;
    _toolBar = toolBar;
}

#pragma mark - 工具栏代理  点击工具栏按钮
- (void)didClickedOnToolBtn:(UIButton *)button
{
    NSInteger index = button.tag;
    
    if (index == 0) {
        UIImagePickerController *pickerC = [UIImagePickerController new];
        
        pickerC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerC.delegate = self;
        [self presentViewController:pickerC animated:YES completion:nil];
        
        
    }
    
}
#pragma mark -UIImagePikerControllerDelegate 选中图片

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    _photos.photo = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -设置TextView
- (void)setUpTextView
{
    WRTextView *textView = [WRTextView new];
    
    
    [self.view addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    textView.alwaysBounceVertical = YES;
    
    textView.delegate = self;
    
    textView.placeHolder = @"abc";
    
    _textView = textView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextViewTextDidChangeNotification object:nil];
    
}

#pragma mark - Scroll代理
//拖拽textView让键盘消失
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_textView endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_textView becomeFirstResponder];
}

#pragma mark - 键盘弹起
- (void)keyboardFrameChange:(NSNotification*)noti
{
    CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    if (keyboardFrame.origin.y == self.view.higth) {
        [UIView animateWithDuration:duration animations:^{
            _toolBar.transform = CGAffineTransformIdentity;
        }];
    } else {
    
        [UIView animateWithDuration:duration animations:^{
            
            _toolBar.transform = CGAffineTransformMakeTranslation(0, -keyboardFrame.size.height);
        }];
    }
}

#pragma mark - textView改变
- (void)textChange:(NSNotification*)nofi
{
    if (_textView.text.length) {
        _textView.hidePlaceHolder = YES;
        _rightItem.enabled = YES;
    } else {
        _textView.hidePlaceHolder = NO;
        _rightItem.enabled = NO;
    }
}

@end
