classdef Transformation_Setting
    %TRANSFORMATION_SETTING Enthält die Grundinformationen für einen
    %bestimmen Roboter, der eine bestimmte Linie abfährt
    %   
    %TRANSFORMATION_SETTING Properties:
    %   arms - Längen der Roboterarme, letzter ist der mit dem TCP
    %   line - Linie, die abgefahren werden soll
    %   dimension - Dimension der Punkte der Linie
    %TRANSFORMATION_SETTING Methoden:
    %   Transformation_Setting (Constructor) - speichert die Linie und die
    %   Armlängen
    properties
        arms
        line
        dimension
    end
    
    methods
        function obj = Transformation_Setting(arms, line)
            obj.arms = arms;
            obj.line = line;
            obj.dimension = dimension;
        end
    end
    
end

