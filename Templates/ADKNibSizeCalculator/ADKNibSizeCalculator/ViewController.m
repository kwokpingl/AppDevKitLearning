//
//  ViewController.m
//  ADKNibSizeCalculator
//
//  Created by Chih Feng Sung on 6/16/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

// TODO: import AppDevKit's header

#import "ViewController.h"
#import "SampleCollectionVIewCell.h"

static NSString * const SampleCollectionVIewCellIdentifer = @"SampleCollectionVIewCell";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];
    [self.collectionView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupCollectionView
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"SampleCollectionVIewCell" bundle:nil] forCellWithReuseIdentifier:SampleCollectionVIewCellIdentifer];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SampleCollectionVIewCell *cell = (SampleCollectionVIewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:SampleCollectionVIewCellIdentifer forIndexPath:indexPath];

    cell.thumbImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"IceCream%ld", (long)(indexPath.item % 11 + 1)]];

    cell.contentView.backgroundColor = [UIColor lightGrayColor];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    CGSize size = CGSizeMake(viewWidth, 50.0f);

    // TODO: using ADKNibSizeCalculator to calculate size easily

    return size;
}

@end
