relativeRankNat = [1,2,2,3,4,4,4,4];
relativeRankOpen = [1,2,2,4,4,4,3,1];
relativeRankPerspective = [7,5,6,4,2,1,3,3];
relativeRankLarge = [5,3,3,4,4,2,2,1];
relativeRankDiagonal = [6,4,4,5,3,2,2,1];
relativeRankClose = [4,4,4,4,1,3,2,4];
choose_ = nchoosek(1:2688,2);
numOfChoose_ = numel(choose_)/2;
O_ = sparse(numOfChoose_, 2688);
S_ = sparse(numOfChoose_, 2688);
locationO = 1;
locationS = 1;

get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRankNat, 'OSNat', class_labels)
get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRankOpen, 'OSOpen', class_labels)
get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRankPerspective, 'OSPerspective', class_labels)
get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRankLarge, 'OSLarge',class_labels)
get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRankDiagonal, 'OSDiagonal', class_labels)
get_O_S(choose_, numOfChoose_, O_, S_, locationO, locationS, relativeRankClose, 'OSClose', class_labels)



