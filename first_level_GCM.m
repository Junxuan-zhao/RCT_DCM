%% Move first-level DCM files into two folders (intervention/control)
% List of subjects to move
subs = {intervention group ID};

% Source and destination directories
srcDir = '/data/scratch/projects/punim1784/DCM/Reappraisal_task/T1/';
dstDir = '/data/scratch/projects/punim1784/DCM/Reappraisal_task/intervention/T1/';

% Loop through each subject and move the file
for i = 1:length(subs)
    % Construct the filename pattern (adjust T3 if needed)
    filePattern = sprintf('DCM_full_Reappraisal_T1_%s*', subs{i});
    files = dir(fullfile(srcDir, filePattern));
    
    if ~isempty(files)
        for f = 1:length(files)
            srcFile = fullfile(srcDir, files(f).name);
            dstFile = fullfile(dstDir, files(f).name);
            movefile(srcFile, dstFile);
            fprintf('Moved %s successfully.\n', files(f).name);
        end
    else
        fprintf('No files found for %s!\n', subs{i});
    end
end

% Source and destination directories
srcDir1 = '/data/scratch/projects/punim1784/DCM/Reappraisal_task/T3/';
dstDir1 = '/data/scratch/projects/punim1784/DCM/Reappraisal_task/intervention/T3/';

% Loop through each subject and move the file
for i = 1:length(subs)
    % Construct the filename pattern (adjust T3 if needed)
    filePattern1 = sprintf('DCM_full_Reappraisal_T3_%s*', subs{i});
    files = dir(fullfile(srcDir1, filePattern1));
    
    if ~isempty(files)
        for f = 1:length(files)
            srcFile1 = fullfile(srcDir1, files(f).name);
            dstFile1 = fullfile(dstDir1, files(f).name);
            movefile(srcFile1, dstFile1);
            fprintf('Moved %s successfully.\n', files(f).name);
        end
    else
        fprintf('No files found for %s!\n', subs{i});
    end
end

%% creat GCM file

spm('Defaults','fMRI');
spm_jobman('initcfg');

subjdir_IN = fullfile(['/data/scratch/projects/punim1784/DCM/Reappraisal_task/intervention']);
    
outdir = fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task/second_level/intervention');
        if ~exist(outdir, 'dir')
            mkdir(outdir);
        end

% Get all T3 DCMs
dcms_in = spm_select('FPListRec', subjdir_IN, '^DCM.*\.mat$');

    GCM = spm_dcm_load(cellstr(dcms_in));
    GCM = spm_dcm_fit(GCM);
    save(fullfile(outdir, ['GCM_full.mat']), 'GCM');
    
