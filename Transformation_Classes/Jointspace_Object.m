classdef Jointspace_Object
    %JOINTSPACE_OBJECT Die Gelenkstellungen im Gelenkraum und die daraus
    %   erzeugte Trajektorie.
    %
    %JOINTSPACE_OBJECT Properties: 
    %   setting - Vorgaben des Roboters und der abzufahrenden Linie
    %   checkpoint_number - Anzahl der Gelenkstellungen, die aus den
    %   Checkpoints des Pfades im kart. Raum erzeugt wurden
    %   trajectory_checkpoints - die Gelenkstellungen, die direkt aus den
    %   Checkpoints erzeugt wurden
    %   actual_trajectory - die Trajektorie, die aus den
    %   checkpoint-Gelenkstellungen erzeugt wurde
    %   trajectory_function - Name der Trajektorienfunktion, die benutzt
    %   wird
    
    properties
        setting
        checkpoint_number
        trajectory_checkpoints
        actual_trajectory
        trajectory_function
    end
    
    methods
        function obj = Jointspace_Object(transformation_setting, taskspace_object)
            obj.setting = transformation_setting
            obj.checkpoint_number = taskspace_object.checkpoint_number
            obj.trajectory_checkpoints = transform(taskspace_object.predefined_path
    end
    
end

