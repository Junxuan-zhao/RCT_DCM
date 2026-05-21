%% DCM Specification and Estimation for Reappraisal Task
subjects = [subject ID];

spm('Defaults','fMRI');
spm_jobman('initcfg');

% Timepoints you want to process
timepoints = {'T1', 'T3'};

% Node names (must match VOI filenames below or edit mapping)
% Node names (must match VOI filenames below or edit mapping)
nodes = {'amygdala','insula',...
      'precuneus','SMA',...
         'vlPFC','vmPFC'};
n = numel(nodes);

% DCM options
TR = 1.25;
TE = 0.04;
include = [1 1 0 0]';   % Task Reappraisal included
delays = repmat(0.625,1,n);

% Create A matrix mask: all-to-all between-region except homologous L-R removed
A = ones(n,n);


% B matrix: Reappraisal modulatory mask: same as A for off-diagonals, AND allow self-modulation
B(:,:,2) = A;
B(:,:,1) = zeros (n);

% C vector: LookNegative driving input -> Amyg L/R, Insula L/R, dACC
C = zeros(n,2);
C(:,1) = 1;
C(:,2) = 0;

%% Single model specification name
model_name = 'full_Reappraisal';

% VOI filename template:
% This assumes each subject's VOIs are named like 'VOI_Amygdala_L_1.mat' in the subject's 1st-level folder.
% If your filenames differ, change the mapping below accordingly.
voi_template = strcat('VOI_', nodes, '_1.mat');  % cell array of strings

% Loop models/timepoints/subjects
for tp = 1:length(timepoints)
    timepoint = timepoints{tp};
    outdir = fullfile('/data/scratch/projects/punim1784/DCM/Reappraisal_task', timepoint);
    if ~exist(outdir,'dir'), mkdir(outdir); end

    for i = 1:numel(subjects)
        subject = sprintf('%03d', subjects(i));
        spm_dir = fullfile('/data/scratch/projects/punim1784/GLM_task', timepoint, 'Reappraisal/1st-level', ['sub-T' subject]);

        if ~exist(spm_dir,'dir')
            fprintf('Skipping missing folder: %s\n', spm_dir);
            continue;
        end

        % Load SPM.mat
        SPMfile = fullfile(spm_dir,'SPM.mat');
        if ~exist(SPMfile,'file')
            fprintf('SPM.mat not found for %s %s\n', subject, timepoint);
            continue;
        end
        SPM = load(SPMfile); SPM = SPM.SPM;

        % Load VOIs into xY struct array (ordered as nodes)
        for r = 1:n
            voi_file = fullfile(spm_dir, voi_template{r});
            if ~exist(voi_file,'file')
                fprintf('Missing VOI for subj %s time %s: %s\n', subject, timepoint, voi_file);
                continue;
            end
                XY = load(voi_file);
                %xY_temp = XY.xY;
                %xY_temp.xY = XY.Y;
                %xY(r) = xY_temp;
                xY(r) = XY.xY;
        end

        % Build DCM specification structure 's'
        cd (outdir);
        s = struct();
        s.name = [model_name '_' timepoint '_T' subject];
        s.u = include;                % which conditions used
        s.delays = delays;
        s.TE = TE;
        s.nonlinear = false;
        s.two_state = false;
        s.stochastic = false;
        s.centre = true;
        s.induced = 0;
        s.a = A;
        s.b = B;                      % single modulatory input (Reappraisal) as B(:,:,1)
        s.c = C;
        s.d = zeros(n,n,0);           % no bilinear nonlinear modulations in this spec
        DCM = spm_dcm_specify(SPM, xY, s);

        % Save DCM into the designated outdir
        DCM_fname = fullfile(outdir, [model_name '_' timepoint '_sub-T' subject '.mat']);
        save(DCM_fname,'DCM');
        fprintf('Saved %s\n', DCM_fname);
    end % subjects

end % timepoints

fprintf('All done.\n');


