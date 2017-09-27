classdef Taskspace_Object < handle
    %TASKSPACE_OBJECT Die Linie, die der Roboter letztendlich abfährt. Im
    %   Task-Space. Diese besitzt einen Fehler zu der eigentlich vorgegebenen
    %   Linie.
    %   
    %TASKSPACE_OBJECT Properties:
    %   path - Zeilenvektor der Punkte, die abgefahren werden
    %   point_number - Anzahl der Punkte im Pfad
    %   dimension - Dimension der Punkte
    %TASKSPACE_OBJECT Methoden:
    %   Taskspace_Object (Constructor) - Erstelle Zeilenvektor mit
    %   Checkpoints, die an 'checkpoint_number'-vielen Stellen mit der
    %   vorgegebenen Linie übereinstimmen  
    
    properties
        checkpoint_number
        setting
        actual_path
        predefined_path
    end
    
    methods
        function obj = Taskspace_Object(transformation_setting, checkpoint_number)           
            obj.checkpoint_number = checkpoint_number
            obj.setting = transformation_setting
            obj.predefined_path = Line(setting.start_point, setting.end_point, checkpoint_number)
            obj.actual_path = zeros(1, checkpoint_number)
        end
    end
    
end

