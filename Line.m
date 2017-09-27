classdef Line < handle
    %LINE Erzeugt eine gerade Linie zwischen Anfangs- und Endpunkt
    %   
    %LINE Properties:
    %   line - ZEILENVEKTOR der alle Punkte der Linie beinhaltet
    %   start_point - Startpunkt (Dimension egal)
    %   end_point - Endpunkt
    %   point_number - Anzahl der Punkte auf der Linie
    %   distance_max - GRÖSSTE Distanz zwei benachbarter Punkte aller
    %   Dimensionen
    %   dimension - Grösse der Dimension der Punkte der Liste
    %
    %LINE Methoden:
    %   Line (Constructor) - erzeugt Linie mit Angabe von
    %                        Start- und Endpunkt und Gesamtanzahl der
    %                        Punkte auf der Linie 


    
    properties
        line
        start_point
        end_point
        point_number
        distance_max
        dimension
        
    end
    
    methods 
        function obj = Line(start_point, end_point, point_number)
            obj.start_point = start_point;
            obj.end_point = end_point;            
            obj.point_number = point_number;
            obj.line = sample(start_point, end_point, -1, point_number);
            obj.distance_max = max(abs(obj.line(:,1)-obj.line(:,2)));
            obj.dimension = size(obj.line,1);
        end
    end
    
end

