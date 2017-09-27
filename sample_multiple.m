function [ sample_list ] = sample_multiple( point_list,insert_number )
%SAMPLEMULTIPLE Erzeugt einen Zeilenvektor mit 'insert_number'-vielen
%   Zwischenpunkten zwischen je zwei Punkten aus 'point_list'.
%   
%   SL = sampleMultiple(PL,0) gibt Kopie der ursprünglichen Liste
%   zurück.(dann muss bei aufeinanderfolgenden Punkten mit 2
%   gesamplet werden)
%   SL = sampleMultiple(PL,1) gibt Liste zurück, bei der n-1 Punkte
%   eingefügt wurden. (Ein Punkt wurde hinter jedem Punkt außer dem letzten
%   eingefügt.)(dann muss mit 3 gesampelt werden)


    sample_list = point_list(1);
        for i = 1:size(point_list,2)-1
            samp = sample(point_list(i),point_list(i+1),-1,insert_number+2);
            samp(1) =  [];
            sample_list = [sample_list,samp];            
        end

end

