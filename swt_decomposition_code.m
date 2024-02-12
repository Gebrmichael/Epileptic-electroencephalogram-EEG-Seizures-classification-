function [] = swt_decomposition_code(~) 
    
    
   load('S005.txt');
   
 signal='S005.txt';
[cD1,cD2,cD3,cD4,cD5,cD6,cD7,cD8, cA8] = Wavelet_Decomposition(signal,8);


%------------------------------------------------------------------------

%                 Gamma = s1;
%                 subplot(3,1,1); plot(1:1:length(Gamma),Gamma);title('one sample Non-epileptic original EEG Signal'); 
%                  
%                  Gamma = D1;
%                 subplot(3,1,2); plot(1:1:length(Gamma),Gamma);title('The Detail frequency high pass decomposed by SWT Upsampling same sampling size with the original signal)'); 
%                 
%                 Gamma = A1;
%                 subplot(3,1,3); plot(1:1:length(Gamma),Gamma);title('The Approximation frequency low pass decomposed by SWT Upsampling andsame sampling size with the original signal)'); 
%                  
                 
                Gamma = cD1; 
                subplot(4,2,1); plot(1:1:length(Gamma),Gamma);title('Detail cD1'); 
                Gamma = cD2; 
                subplot(4,2,2); plot(1:1:length(Gamma),Gamma);title('Detail cD2'); 
                Gamma = cD3; 
                subplot(4,2,3); plot(1:1:length(Gamma),Gamma);title('Detail cD3');               
                Beta = cD4; 
                subplot(4,2,4); plot(1:1:length(Beta), Beta); title('Detail cD4');              
                Alpha = cD5; 
                subplot(4,2,5); plot(1:1:length(Alpha),Alpha); title('Detail cD5');         
                Theta = cD6; 
                subplot(4,2,6); plot(1:1:length(Theta),Theta);title('Detail cD6');               
                Gamma = cD7; 
                subplot(4,2,7); plot(1:1:length(Gamma),Gamma);title('Detail cD7');
                subplot(4,2,8); plot(1:1:length(Gamma),Gamma);title('Detail cD7');
                Delta = cA8;  
                subplot(4,2,9);plot(1:1:length(Delta),Delta);title('Approximation cA7');

end


function [cA8,cD1,cD2,cD3,cD4,cD5,cD6,cD7,cD8 ] = Wavelet_Decomposition(S,L)

                [swa,swd] = swt(S,L,'db8');

 cA1 = swa(1,:);     cD1 = swd(1,:); 
 cA2 = swa(2,:);     cD2 = swd(2,:); 
 cA3 = swa(3,:);     cD3 = swd(3,:); 
 cA4 = swa(4,:);     cD4 = swd(4,:); 
 cA5 = swa(5,:);     cD5 = swd(5,:); 
 cA6 = swa(6,:);     cD6 = swd(6,:); 
 cA7 = swa(7,:);     cD7 = swd(7,:); 
 cA8 = swa(8,:);     cD8 = swd(8,:); 
end




