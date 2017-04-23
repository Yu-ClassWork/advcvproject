%%

% numOfChoose_ = numel(choose_)/2;
% O_ = sparse(numOfChoose_, 2688);
% S_ = sparse(numOfChoose_, 2688);
% locationO = 1;
% locationS = 1;
% sameThreshold = 1;
% relativeRankNat = [1,2,2,3,4,4,4,4];
% relativeRankOpen = [1,2,2,4,4,4,3,1];
% relativeRankPerspective = [7,5,6,4,2,1,3,3];
% relativeRankLarge = [5,3,3,4,4,2,2,1];
% relativeRankDiagonal = [6,4,4,5,3,2,2,1];
% relativeRankClose = [4,4,4,4,1,3,2,4];

function [] = get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRank, filename, class_labels)
for i = 1:numOfChoose_
    pairToCompare = choose_(i, :);
    compareOne = pairToCompare(1);
    compareTwo = pairToCompare(2);
    typeOfOne = class_labels(compareOne);
    typeOfTwo = class_labels(compareTwo);
    typeO = 0;
    typeS = 0;
    
    if relativeRank(typeOfOne) == relativeRank(typeOfTwo)
        typeS = 1;
    else
        typeO = 1;
        rankOne = relativeRank(typeOfOne);
        rankTwo = relativeRank(typeOfTwo);
    end
    
    if typeO == 1
        %         O_(locationO,:) = 0;
        if rankOne > rankTwo
            O_(locationO,compareOne) = 1;
            O_(locationO,compareTwo) = -1;
            locationO = locationO + 1;
        else
            O_(locationO,compareOne) = -1;
            O_(locationO,compareTwo) = 1;
            locationO = locationO + 1;
        end
    elseif typeS == 1
        %         S_(locationS,:) = 0;
        S_(locationS,compareOne) = 1;
        S_(locationS,compareTwo) = -1;
        locationS = locationS + 1;
    else
        'error'
    end
end

save(filename);

end
