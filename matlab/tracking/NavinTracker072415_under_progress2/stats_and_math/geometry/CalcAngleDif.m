function Dif = CalcAngleDif(Data, StepSize)			% StepSize MUST be > 0

% This function is identical to CalcDif, except for the fact that it accounts for
% the periodic nature of Data about +/-180 deg.
% For detailed documentation see CalcDif.

Len = length(Data);
HalfStepHi = ceil(StepSize/2);
HalfStepLo = floor(StepSize/2);

Dif(1) = GetAngleDif(Data(1), Data(2));
for i = 2:HalfStepHi
	Dif(i) = GetAngleDif(Data(1), Data(2*i-1)) / (2*i-2);
end
Dif(HalfStepHi+1:Len-HalfStepLo) = GetAngleDif(Data(1:Len-StepSize), Data(StepSize+1:Len)) / StepSize;
for i = 1:HalfStepLo-1
	Dif(Len-HalfStepLo+i) = GetAngleDif(Data(Len-2*HalfStepLo+2*i), Data(Len)) / (2*HalfStepLo-2*i);
end
Dif(Len) = GetAngleDif(Data(Len-1), Data(Len));

return;

end
