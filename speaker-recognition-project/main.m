clearvars;

train1 = createDatabase();
train2 = createDatabase();
train3 = createDatabase();
train4 = createDatabase();
train5 = createDatabase();
train6 = createDatabase();
train7 = createDatabase();
train8 = createDatabase();
train9 = createDatabase();
train10 = createDatabase();
train11 = createDatabase();
train12 = createDatabase();
train13 = createDatabase();
train14 = createDatabase();
train15 = createDatabase();
%%
% save('allVoice.mat', ...
%     'train1',...
%     'train2',...
%     'train3',...
%     'train4',...
%     'train5',...
%     'train6',...
%     'train7',...
%     'train8',...
%     'train9',...
%     'train10',...
%     'train11',...
%     'train12',...
%     'train13',...
%     'train14',...
%     'train15');
%%
load('allVoice.mat');
%%

% choose foler when prompted and classify test voices in train set.
classify( ...
    train1, ...
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
    train15);
%%
% choose foler when prompted and classify test voices outside of train set
classifyUnknown( ...
    train1, ...
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
    train15);
% evaluateVoice() - print classification percentage 
% for incorrectly identified files - listen - dothey sound familiar?