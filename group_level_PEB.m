%% -----------------------------------------------------------------------
spm('Defaults','fMRI');
spm_jobman('initcfg');


% Load GCM & M.mat files and mean-center covariates
gcmdir_IN = fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/intervention/');
gcmdir_CON = fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/control/');

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/second_level_matrix_intervention.mat');    
    X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
    X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir_IN)
    load(['GCM_full.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB1 = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_IN, 'second_level_PEB.mat'), 'PEB1');
    BMA_IN = spm_dcm_peb_bmc(PEB1);
    save(fullfile(gcmdir_IN, 'BMA_search_IN.mat'),'BMA_IN');

    % ---------------------
    % 2nd-level PEB for Control
    % ---------------------
clear M GCM X dm
    cd(gcmdir_CON)
    load(['GCM_full.mat'],'GCM');

load('/data/scratch/projects/punim1784/DCM/Reappraisal_full_model/second_level/second_level_matrix_control.mat');    
    X = dm.X;
    X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
    X_labels = dm.labels;

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;
    
    
    PEB2 = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_CON, 'second_level_PEB.mat'), 'PEB2');
    BMA_CON = spm_dcm_peb_bmc(PEB2);
    save(fullfile(gcmdir_CON, 'BMA_search_CON.mat'),'BMA_CON');

   % ---------------------
    % 3rd-level PEB (time / interaction)
    % ---------------------
   PEBs = {PEB1; PEB2};

    % Simple time effect
    X3 = [1 -1;   % intervention
          1 1];  % control
    X3(:,2:end) = X3(:,2:end) - mean(X3(:,2:end)); % mean-center

    M3 = struct();
    M3.X = X3;
    M3.Xnames = {'Mean','Group'};
    
    outdir = fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/third_level/');                     
                               
    if ~exist(outdir, 'dir')
            mkdir(outdir);
        end
PEB3 = spm_dcm_peb(PEBs, M3);
save(fullfile(outdir, 'third_level_PEB.mat'),'PEB3');

BMA_Time = spm_dcm_peb_bmc(PEB3); %Bayesian Model Comparison (BMC) and Bayesian Model Averaging (BMA) over reduced models derived from the PEB.
save(fullfile(outdir, 'BMA_search.mat'),'BMA_Time');  

