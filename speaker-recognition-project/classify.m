function classify(train1, ...
    train2, ...
    train3, ...
    train4, ...
    train5, ...
    train6, ...
    train7, ...
    train8, ...
    train9, ...
    train10, ...
    train11, ...
    train12, ...
    train13, ...
    train14, ...
    train15)

% for each test files compute score
% choose database person that yields smallest score

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

% ------------------ conpare all files in folder with each train database. Print which it belongs to. ----------------
if totalNumberOfFiles >= 1
    minScoreList = [];
	for k = 1 : totalNumberOfFiles
		thisFolder = allFileInfo(k).folder;
		thisBaseFileName = string(allFileInfo(k).folder) +"\"+ string(allFileInfo(k).name);
		[~, baseNameNoExt, ~] = fileparts(thisBaseFileName);
        scoreList = [];
        if endsWith(baseNameNoExt,["4","5","6"])
      		currentVoice = processVoice(thisBaseFileName);

            scoreList = [scoreList calcScore(currentVoice,train1)];
            scoreList = [scoreList calcScore(currentVoice,train2)];
            scoreList = [scoreList calcScore(currentVoice,train3)];
            scoreList = [scoreList calcScore(currentVoice,train4)];
            scoreList = [scoreList calcScore(currentVoice,train5)];
            scoreList = [scoreList calcScore(currentVoice,train6)];
            scoreList = [scoreList calcScore(currentVoice,train7)];
            scoreList = [scoreList calcScore(currentVoice,train8)];
            scoreList = [scoreList calcScore(currentVoice,train9)];
            scoreList = [scoreList calcScore(currentVoice,train10)];
            scoreList = [scoreList calcScore(currentVoice,train11)];
            scoreList = [scoreList calcScore(currentVoice,train12)];
            scoreList = [scoreList calcScore(currentVoice,train13)];
            scoreList = [scoreList calcScore(currentVoice,train14)];
            scoreList = [scoreList calcScore(currentVoice,train15)];
            [minScore,indexOfClosest] = min(scoreList);
            minScoreList = [minScoreList minScore];
            fprintf('Test %s belongs to to train%d with score %f\n', baseNameNoExt, indexOfClosest,minScore );
%             fprintf('Score list:');
%             scoreList
%             abs(minScore-scoreList)./scoreList*100
        else
            %
        end
    end
    fprintf('Stdev: %f\n', std(minScoreList));
    fprintf('Mean score: %f\n',mean(minScoreList));
else
	fprintf('     Folder %s has no files in it.\n', thisFolder);
end

end


