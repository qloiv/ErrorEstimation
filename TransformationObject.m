classdef TransformationObject
    %TRANSFORMATIONOBJECT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sampleSize_1
        sampleSize_2       
        start_pt
        end_pt
        angles
        arms
        
        original_pts
        
        transformed_pts_tsp
        
        transformed_pts_jsp
        error = 100 %% TODO choose max
        trajectory
    end
    
    methods
        function obj = TransformationObject(start_pt,end_pt, sampleSize_1, sampleSize_2,angles,arms)
            obj.start_pt = start_pt;
            obj.end_pt = end_pt;
            obj.sampleSize_1 = sampleSize_1;
            obj.sampleSize_2 = sampleSize_2;
            obj.angles = angles;
            obj.arms = arms;
        end
        function obj = toJSpace(obj)
            obj.original_pts = sample(obj.start_pt,obj.end_pt,-1,obj.sampleSize_1); %sample points from line
            obj.transformed_pts_jsp = (transform(obj.original_pts, obj.angles,obj.arms)); %to joint space
        end
        function obj = trajGen(obj)
            %build trajectory from transformed points
            obj.trajectory = (trajectory1(obj.transformed_pts_jsp,obj.sampleSize_2)); %in joint space
        end
        function obj = toTSpace(obj)
            obj.transformed_pts_tsp = retransform(obj.arms,obj.trajectory); %from joint space to 
        end
        function obj = computeError(obj)
            ori_pts = [];
            ori_pts(1,:) = sampleMultiple(obj.original_pts(1,:), obj.sampleSize_2);
            ori_pts(2,:) = sampleMultiple(obj.original_pts(2,:),obj.sampleSize_2);

            trs_pts = obj.transformed_pts_tsp;
            trs_pts(3,:) = [];
            obj.error = mse(trs_pts,ori_pts);
        end
        function plot(obj)
            
            figure
            ax1 = subplot(2,1,1);
            plot(err)
            title(ax1,'Error')

            ax2 = subplot(2,1,2);
            plot(obj.transformed_pts_tsp(1,:),obj.transformed_pts_tsp(2,:));
            hold on;
            plot(obj.original_pts(1,:),obj.original_pts(2,:))
            title(ax2,'Original and Transformed Points')
            hold off;
       end
    
    end
end

