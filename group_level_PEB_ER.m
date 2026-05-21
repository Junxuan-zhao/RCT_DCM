%% -----------------------------------------------------------------------
% add changes of emotion regulation as a regressor in the PEB model

spm('Defaults','fMRI');
spm_jobman('initcfg');


% Load GCM & M.mat files and mean-center covariates
gcmdir= fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/');
gcmdir_out= fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/b_path/');
load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/nonAccept.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'nonaccept_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_nonaccept.mat'),'BMA');

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/awareness.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'awareness_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_awareness.mat'),'BMA');

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/clarity.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'clarity_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_clarity.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/eesc_aware.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'eesc_aware_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_eesc_aware.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/eesc_motivation.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'eesc_motivation_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_eesc_motivation.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/goals.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'goals_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_goals.mat'),'BMA');

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/impulse.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'impulse_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_impulse.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/strategy.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'strategy_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_strategy.mat'),'BMA');

 clear BMA PEB M dm
% Load GCM & M.mat files and mean-center covariates
gcmdir= fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/');
gcmdir_out= fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/b_path/');
load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/nonAccept.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'nonaccept_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_nonaccept.mat'),'BMA');

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/awareness.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'awareness_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_awareness.mat'),'BMA');

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/clarity.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'clarity_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_clarity.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/eesc_aware.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'eesc_aware_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_eesc_aware.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/eesc_motivation.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'eesc_motivation_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_eesc_motivation.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/goals.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'goals_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_goals.mat'),'BMA');

 clear BMA PEB M dm

load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/impulse.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'impulse_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_impulse.mat'),'BMA');

 clear BMA PEB M dm

 load('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/strategy.mat');    
   X = dm.X;
   X(:,2:end) = X(:,2:end) - mean(X(:,2:end)); % mean-center
   X_labels = dm.labels;

    % ---------------------
    % 2nd-level PEB for Intervention
    % ---------------------
    cd(gcmdir)
    load(['GCM_T3.mat'],'GCM');

    M = struct();
    M.Q = 'field';
    M.X = X;
    M.Xnames = X_labels;

    PEB = spm_dcm_peb(GCM, M);
    save(fullfile(gcmdir_out, 'strategy_PEB.mat'), 'PEB');
    BMA = spm_dcm_peb_bmc(PEB);
    save(fullfile(gcmdir_out, 'BMA_strategy.mat'),'BMA');

 clear BMA PEB M dm
