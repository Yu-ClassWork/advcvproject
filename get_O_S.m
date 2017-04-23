%%

O_ = sparse(numOfChoose_, 2688);
S_ = sparse(numOfChoose_, 2688);
locationO = 1;
locationS = 1;
sameThreshold = 1;
% choose_ = nchoosek(1:2688,2);
% numOfChoose_ = numel(choose_)/2;
relativeRankNat = [1,2,2,3,4,4,4,4];
relativeRankOpen = [1,2,2,4,4,4,3,1];
for i = 1:numOfChoose_
    pairToCompare = choose_(i, :);
    compareOne = pairToCompare(1);
    compareTwo = pairToCompare(2);
    typeOfOne = class_labels(compareOne);
    typeOfTwo = class_labels(compareTwo);
    typeO = 0;
    typeS = 0;
    
    if relativeRankNat(typeOfOne) == relativeRankNat(typeOfTwo)
        typeS = 1;
    else
        typeO = 1;
        rankOne = relativeRankNat(typeOfOne);
        rankTwo = relativeRankNat(typeOfTwo);
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