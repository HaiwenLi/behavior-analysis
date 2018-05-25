function head_dir = calc_head_direction(Folder)
% Read centerline and calculate head direction

image_names = dir([Folder, 'centerline\*.mat']);
Start_Index = 0;
End_Index = length(image_names)-1;

head_dir = zeros(length(image_names),2);
for i=Start_Index:End_Index
	centerline_data = load([Folder 'centerline\' num2str(i) '.mat']);
    centerline = centerline_data.centerline;
    head = centerline(1,:);
    tail = centerline(size(centerline,1),:);
	head_dir(i-Start_Index+1,:) = head - tail;
end
end