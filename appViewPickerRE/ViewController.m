//
//  ViewController.m
//  appViewPickerRE
//
//  Created by jimbo on 20/10/24.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *expRegulares;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    expRegulares = @[@"^[a-fA-F0-1]+$", @"^[0-1]+$", @"^[0-7]+$", @"[0-9]+$"];
    
    
    self.pickerviewRE.dataSource = self;
    self.pickerviewRE.delegate = self;
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return expRegulares.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return expRegulares[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *pattern = expRegulares[row];
    NSString *cadenaPrueba  = self.textfieldEntrada.text;
    
    
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern                   options:0 error:&error];
    
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:cadenaPrueba options:0
    range:NSMakeRange(0, [cadenaPrueba length])];
    
    
    if (matches.count > 0) {
        self.labelSalida.textColor = [UIColor greenColor];
        self.labelSalida.text = @"Encontrado";
    } else {
        self.labelSalida.textColor = [UIColor redColor];
        self.labelSalida.text = @"No encontrado";
    }
    
}

- (IBAction)botonCorero:(id)sender {
    
    NSString *email = self.textfieldEntrada.text;
    NSString *patron = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]\.[a-zA-Z]{2,}$";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patron options:0 error:&error];
      
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:email options:0 range:NSMakeRange(0, email.length)];
    
    if (matches.count > 0) {
            self.labelSalida.text = @"Correo electrónico válido";
            self.labelSalida.textColor = [UIColor greenColor];
        } else {
            self.labelSalida.text = @"Correo electrónico inválido";
            self.labelSalida.textColor = [UIColor redColor];
        }
}

- (IBAction)botonValidar:(id)sender {
}
@end
