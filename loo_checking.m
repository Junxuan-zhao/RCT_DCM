%% -----------------------------------------------------------------------
spm('Defaults','fMRI');
spm_jobman('initcfg');


% Load GCM & M.mat files and mean-center covariates
gcmdir= fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/');
gcmdir_out= fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/b_path/');

%nonaccept
load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/GCM_T3.mat');
load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/nonAccept.mat');    
spm_dcm_loo(GCM,dm,{'A(6,1)'})
spm_dcm_loo(GCM,dm,{'A(2,3)'})

 clear BMA PEB M dm 

%awareness
load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/awareness.mat');    
spm_dcm_loo(GCM,dm,{'A(2,1)'})
spm_dcm_loo(GCM,dm,{'A(5,1)'})
spm_dcm_loo(GCM,dm,{'A(2,2)'})
spm_dcm_loo(GCM,dm,{'A(4,2)'})
spm_dcm_loo(GCM,dm,{'A(2,3)'})
spm_dcm_loo(GCM,dm,{'A(6,5)'})
 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/clarity.mat');    
spm_dcm_loo(GCM,dm,{'A(2,1)'})
spm_dcm_loo(GCM,dm,{'A(5,1)'})
spm_dcm_loo(GCM,dm,{'A(6,1)'})
spm_dcm_loo(GCM,dm,{'A(4,2)'})
spm_dcm_loo(GCM,dm,{'A(2,3)'})
spm_dcm_loo(GCM,dm,{'A(3,3)'})
spm_dcm_loo(GCM,dm,{'A(6,5)'})
 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/eesc_aware.mat');    
 spm_dcm_loo(GCM,dm,{'A(4,2)'})
spm_dcm_loo(GCM,dm,{'A(1,3)'})
spm_dcm_loo(GCM,dm,{'A(2,4)'})
spm_dcm_loo(GCM,dm,{'A(5,4)'})
 clear dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/eesc_motivation.mat');    
 spm_dcm_loo(GCM,dm,{'A(4,2)'})
spm_dcm_loo(GCM,dm,{'A(1,3)'})
spm_dcm_loo(GCM,dm,{'A(2,4)'})
spm_dcm_loo(GCM,dm,{'A(5,5)'})

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/goals.mat');    
spm_dcm_loo(GCM,dm,{'A(5,1)'})
 spm_dcm_loo(GCM,dm,{'A(6,1)'})
 spm_dcm_loo(GCM,dm,{'A(2,2)'})
  spm_dcm_loo(GCM,dm,{'A(6,5)'})
   spm_dcm_loo(GCM,dm,{'A(5,6)'})
 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/impulse.mat');    
spm_dcm_loo(GCM,dm,{'A(5,1)'})
spm_dcm_loo(GCM,dm,{'A(4,2)'})
spm_dcm_loo(GCM,dm,{'A(3,3)'})
spm_dcm_loo(GCM,dm,{'A(6,5)'})
spm_dcm_loo(GCM,dm,{'A(5,6)'})

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/strategy.mat');    
spm_dcm_loo(GCM,dm,{'A(2,2)'})
spm_dcm_loo(GCM,dm,{'A(4,2)'})
spm_dcm_loo(GCM,dm,{'A(1,3)'})
spm_dcm_loo(GCM,dm,{'A(2,4)'})


 clear dm
