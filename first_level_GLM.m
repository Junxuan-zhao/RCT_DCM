subjects = [subject ID];
numScans=392;
disacqs = 0; %The number of scans you later discard during preprocessing
numScans = numScans-disacqs;

%%Loop for sublist
spm('Defaults','fMRI');
spm_jobman('initcfg');

for subject=subjects
    clear matlabbatch
    subject = num2str(subject,'%03d');
   
    if ~exist(['/data/scratch/projects/punim1784/GLM_task/T1/Reappraisal/1st-level/sub-T' subject])
        mkdir(['/data/scratch/projects/punim1784/GLM_task/T1/Reappraisal/1st-level/sub-T' subject])
    end
    
    sub_inputdir = fullfile(['/data/scratch/projects/punim1784/preproc_file/Reappraisal_V2/sub-T' subject '_task-reappraisal_setting-preproc_bold.nii']);
    
    filter=['*',subject,'_task-reappraisal_setting-preproc_bold.nii'];

%------------------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GLM SPECIFICATION, ESTIMATION & INFERENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% OUTPUT DIRECTORY
%------------------------------------------------------------------------------------------
matlabbatch{1}.spm.stats.fmri_spec.dir = {['/data/scratch/projects/punim1784/GLM_task/T1/Reappraisal/1st-level/sub-T' subject]};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1.25;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;

% MODEL SPECIFICATION
%--------------------------------------------------------------------------
run_scans = spm_select('ExtFPList', sub_inputdir,filter,1:numScans);
run_scans = spm_select('Expand', sub_inputdir);
matlabbatch{1}.spm.stats.fmri_spec.sess.scans = cellstr(run_scans);
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).name = 'task';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).onset = [onset time];
%%
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(1).orth = 0;

%
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).name = 'DownNeg';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).onset = [onset time];
%%
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(2).orth = 0;

matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).name = 'LookNeu';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).onset = [onset time];
%%
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(3).orth = 0;


matlabbatch{1}.spm.stats.fmri_spec.sess.cond(4).name = 'Rest';
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(4).onset = [onset time];
%%
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(4).duration = [duration];
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(4).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.cond(4).orth = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

% MODEL ESTIMATION
%--------------------------------------------------------------------------
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
%matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

% INFERENCE
%--------------------------------------------------------------------------
 matlabbatch{3}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
    matlabbatch{3}.spm.stats.con.consess{1}.fcon.name    = 'Effects of interest';
    matlabbatch{3}.spm.stats.con.consess{1}.fcon.weights =  [1 0 0 0;0 1 0 0];
    matlabbatch{3}.spm.stats.con.consess{1}.fcon.sessrep = 'none';

    matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'DownNegGtLookNeg';
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [-1 1 0 0];
    matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';

   % matlabbatch{3}.spm.stats.con.consess{2}.tcon.name = 'LookNegGtLookNeu';
   % matlabbatch{3}.spm.stats.con.consess{2}.tcon.weights = [0 0 1 -1 0];
   % matlabbatch{3}.spm.stats.con.consess{2}.tcon.sessrep = 'none';

    matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'LookNegGtDownNeg';
    matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [1 -1 0 0];
    matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';

    %matlabbatch{3}.spm.stats.con.consess{3}.tcon.name = 'LookNeuGtLookNeg';
    %matlabbatch{3}.spm.stats.con.consess{3}.tcon.weights = [0 0 -1 1 0];
    %matlabbatch{3}.spm.stats.con.consess{3}.tcon.sessrep = 'none';
   matlabbatch{3}.spm.stats.con.delete = 0;


%%Run matlabbatch jobs
spm_jobman('run',matlabbatch);
end
