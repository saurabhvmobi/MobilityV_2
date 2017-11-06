//
//  ToolsViewController.m
//  SimplicITy
//
//  Created by Varghese Simon on 12/4/14.
//  Copyright (c) 2014 Vmoksha. All rights reserved.
//

#import "ToolsViewController.h"

@interface ToolsViewController ()
{
    NSArray *arrayOfImages, *arrayOfDatas;
    
    UIBarButtonItem *backButton;
    UIButton *back;
    NSInteger selectedRow;

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraintConstant;

@end

@implementation ToolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   

   
//    arrayOfDatas = @[ @"Lync Connection Checker", @"Days left for password expiry", @"Survey", @"Room Checker"];
    //arrayOfDatas = @[ @"Lync Connection Checker", @"Survey"];

//    arrayOfImages = @[[UIImage imageNamed:@"LyncToolsIcon"], [UIImage imageNamed:@"PasswordResetToolImage"], [UIImage imageNamed:@"SurveyToolIcon"], [UIImage imageNamed:@"SurveyToolIcon"]];
    
    arrayOfImages = @[[UIImage imageNamed:@"LyncToolsIcon"], [UIImage imageNamed:@"SurveyToolIcon"]];

}


-(void)backButtonImplementation{
    
    back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back_Arrow"] forState:UIControlStateNormal];
    back.titleLabel.font = [self customFont:16 ofName:MuseoSans_700];
    [back setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [back  addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    backButton = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backButton;

    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    [self backButtonImplementation];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localize) name:MCLocalizationLanguageDidChangeNotification object:nil];
    [self localize];
    
    [self.tableView reloadData];


}
-(void)localize
{
  [back setTitle:STRING_FOR_LANGUAGE(@"Home") forState:UIControlStateNormal];
    self.title = STRING_FOR_LANGUAGE(@"Tools");
 arrayOfDatas = @[ STRING_FOR_LANGUAGE(@"Connection.Checker"), STRING_FOR_LANGUAGE(@"Survey")];
    [back sizeToFit];
}




- (void)backBtnAction
{
    [self.tabBarController setSelectedIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([self.tableView indexPathForSelectedRow].row == 3)
//    {
//        UIViewController *cont =
//    }
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOfDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = arrayOfDatas[indexPath.row];
    label.font=[self customFont:16 ofName:MuseoSans_700];
    label.highlightedTextColor = [UIColor whiteColor];

    
    
    
    UIImageView *imageCVIew = (UIImageView *)[cell viewWithTag:101];
    imageCVIew.image = arrayOfImages[indexPath.row];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [self barColorForIndex:selectedRow];
    [cell setSelectedBackgroundView:bgColorView];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedRow = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
    if (indexPath.row == 0)
    {
        [self performSegueWithIdentifier:@"ToolToLyncTestSegue" sender:nil];
    }

   else if (indexPath.row == 1)
    {
        [self performSegueWithIdentifier:@"toolsToSurveySegue" sender:nil];
        
    }
}

@end
