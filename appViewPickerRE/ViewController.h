//
//  ViewController.h
//  appViewPickerRE
//
//  Created by jimbo on 20/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textfieldEntrada;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerviewRE;

@property (weak, nonatomic) IBOutlet UITextField *textfieldExpRegular;
@property (weak, nonatomic) IBOutlet UILabel *labelSalida;

- (IBAction)botonValidar:(id)sender;

- (IBAction)botonCorero:(id)sender;

@end

