//
//  AlbumsViewController.m
//  Saints Community
//
//  Created by Kehinde Shittu on 23/03/2016.
//  Copyright © 2016 Kehesjay. All rights reserved.
//

#import "AlbumsViewController.h"
#import "AlbumViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "Utils.h"
#import "Tracks.h"

@interface AlbumsViewController ()

@end

@implementation AlbumsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Utils initSidebar:self barButton:self.sidebarButton];
    self.tabBarController.tabBarItem.title = @"Audio Folders";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
     self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
//    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
//    NSArray *albums = [albumsQuery collections];
    
    return [[Tracks albums] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
    NSArray *albums = [albumsQuery collections];
    
    NSDictionary *rowItem = [[Tracks albums] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [rowItem objectForKey:@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Sermon by: %@", [rowItem objectForKey:@"artist"]];
    
//    MPMediaItemArtwork *artwork = [rowItem valueForProperty:MPMediaItemPropertyArtwork];
    
//    UIImage *artworkImage = [artwork imageWithSize: CGSizeMake (44, 44)];
    
//    if (artworkImage) {
//        cell.imageView.image = artworkImage;
//    } else {
        cell.imageView.image = [UIImage imageNamed:@"music_folder.png"];
//    }
    
    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AlbumViewController *detailViewController = [segue destinationViewController];
    
//    MPMediaQuery *albumsQuery = [MPMediaQuery albumsQuery];
//    NSArray *albums = [albumsQuery collections];
    
    int selectedIndex = [[self.tableView indexPathForSelectedRow] row];
//    MPMediaItem *selectedItem = [[albums objectAtIndex:selectedIndex] representativeItem];
//    NSString *albumTitle = [selectedItem valueForProperty:MPMediaItemPropertyAlbumTitle];
    
    detailViewController.selectedAlbum = selectedIndex;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
