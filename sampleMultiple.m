function [ sample_list ] = sampleMultiple( point_list,sample_size )
%SAMPLEMULTIPLE Summary of this function goes here
%   Detailed explanation goes here
%erzeugt aus den gegebenen punkten in point_list mit der gegebenen anzahl
%zwischenpunkte numberofpoints -1 eine neue sample liste
%muss ich evtl umschreiben falls zu langsam

    sample_list = point_list(1);
        for i = 1:size(point_list,2)-1
            samp = sample(point_list(i),point_list(i+1),-1,sample_size);
            samp(1) =  [];
            sample_list = [sample_list,samp];
            
        end

end

