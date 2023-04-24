function trainVoice = createDatabase()

% Initialization steps:
clc;    % Clear the command window.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
topLevelFolder = uigetdir; %UNCOMMENT TO GET TOPLEVEL FOLDER NAME
if topLevelFolder == 0
	return;
end
fprintf('The top level folder is "%s".\n', topLevelFolder);

filePattern = sprintf('%s/**/*.wav', topLevelFolder);
allFileInfo = dir(filePattern);
% Process all files in those folders.
listOfFolderNames = unique({allFileInfo.folder});
numberOfFolders = length(listOfFolderNames);
totalNumberOfFiles = length(allFileInfo);
% Now we have a list of all files, matching the pattern, in the top level folder and its subfolders.

% ------------------ create trainVoice database ----------------
trainVoice = [];
if totalNumberOfFiles >= 1
	for k = 1 : totalNumberOfFiles
		% Go through all those files.
		thisFolder = allFileInfo(k).folder;
		thisBaseFileName = string(allFileInfo(k).folder) +"\"+ string(allFileInfo(k).name);
        [~, baseNameNoExt, ~] = fileparts(thisBaseFileName);
            
        currentVoice = processVoice(thisBaseFileName);
        if endsWith(baseNameNoExt,["1","2","3"])
            trainVoice = [trainVoice,currentVoice];
            fprintf('Train %s\n', baseNameNoExt);
        else
            fprintf('Test %s. Skipped.\n', baseNameNoExt);
        end
	end
else
	fprintf('     Folder %s has no files in it.\n', thisFolder);
end

fprintf('\nDone looking in all folders!\nFound %d files in the %d folders.\n', totalNumberOfFiles, numberOfFolders);
end

