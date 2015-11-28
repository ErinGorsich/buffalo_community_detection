% run buffalo community detection.  12 November
% set filepath to circlefigs_for_Julie
s=1;
self=1;
debug=1;
verbose=1;
A1= dataset('File', 'M_MatrixDurationIndexCorrectedEven_2014_06.csv', 'Delimiter',',','ReadObsNames',true); 
A2= dataset('File', 'M_MatrixDurationIndexCorrectedEven_2014_08.csv', 'Delimiter',',','ReadObsNames',true); 
A3= dataset('File', 'M_MatrixDurationIndexCorrectedEven_2014_10.csv', 'Delimiter',',','ReadObsNames',true); 
A4= dataset('File', 'M_MatrixDurationIndexCorrectedEven_2014_12.csv', 'Delimiter',',','ReadObsNames',true); 
A5= dataset('File', 'M_MatrixDurationIndexCorrectedEven_2015_02.csv', 'Delimiter',',','ReadObsNames',true); 
A6= dataset('File', 'M_MatrixDurationIndexCorrectedEven_2015_06.csv', 'Delimiter',',','ReadObsNames',true); 
M1=double(A1);
M2=double(A2);
M3=double(A3);
M4=double(A4);
M5=double(A5);
M6=double(A6);

[COMTY1, ending]= cluster_jl_mgb_debug_091013(M1,s,self,debug,verbose)
[COMTY2, ending]= cluster_jl_mgb_debug_091013(M2,s,self,debug,verbose)
[COMTY3, ending]= cluster_jl_mgb_debug_091013(M3,s,self,debug,verbose)
[COMTY4, ending]= cluster_jl_mgb_debug_091013(M4,s,self,debug,verbose)
[COMTY5, ending]= cluster_jl_mgb_debug_091013(M5,s,self,debug,verbose)
[COMTY6, ending]= cluster_jl_mgb_debug_091013(M6,s,self,debug,verbose)

% 2014_06
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_06_m0.3106.csv', COMTY1.COM{1}') % initial iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_06_m0.3106.csv', COMTY1.SIZE{1}') % initial iteration commsize

csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_06_m0.3287.csv', COMTY1.COM{3}') % final iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_06_m0.3287.csv', COMTY1.SIZE{3}') % final iteration commsize

% 2014_08
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_08_m0.3170.csv', COMTY2.COM{1}') % initial iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_08_m0.3170.csv', COMTY2.SIZE{1}') % initial iteration commsize

csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_08_m0.3270.csv', COMTY2.COM{3}') % final iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_08_m0.3270.csv', COMTY2.SIZE{3}') % final iteration commsize

% 2014_10
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_10_m0.293.csv', COMTY3.COM{1}') % initial iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_10_m0.293.csv', COMTY3.SIZE{1}') % initial iteration commsize

csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_10_m0.3056.csv', COMTY3.COM{3}') % final iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_10_m0.3056.csv', COMTY3.SIZE{3}') % final iteration commsize

% 2014_12
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2014_12_m0.2816.csv', COMTY4.COM{2}') % final iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2014_12_m0.2816.csv', COMTY4.SIZE{2}') % final iteration commsize

% 2015_02
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_02_m0.2676.csv', COMTY5.COM{1}') % initial iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2015_02_m0.2676.csv', COMTY5.SIZE{1}') % initial iteration commsize

csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_02_m0.2682.csv', COMTY5.COM{3}') % final iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2015_02_m0.2682.csv', COMTY5.SIZE{3}') % final iteration commsize

% 2015_06
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_06_m0.2184.csv', COMTY6.COM{1}') % initial iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2015_06_m0.2184.csv', COMTY6.SIZE{1}') % initial iteration commsize

csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.com_2015_06_m0.2340.csv', COMTY6.COM{3}') % final iteration community id
csvwrite('/Users/gorsich/Documents/postdoc_buffology/circlefigs_for_Julie/comty.size_2015_06_m0.2340.csv', COMTY6.SIZE{3}') % final iteration commsize

