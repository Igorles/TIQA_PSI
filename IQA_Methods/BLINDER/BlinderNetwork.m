function  Constants = BlinderNetwork(nameNetwork)



j=1;
Constants.net = nameNetwork;    % alexnet, vgg16, vgg19

for i=2:size(Constants.net.Layers,1)-1
    tmp=Constants.net.Layers(i);
    if(contains(tmp.Name, 'drop'))

    else
        Constants.Layers{j}=tmp.Name;
        if(isprop(tmp,'Bias')&&size(tmp.Bias,3)~=1)
            Constants.Lengths{j}=size(tmp.Bias,3);
        elseif(isprop(tmp,'Bias')&&size(tmp.Bias,3)==1)
            Constants.Lengths{j}=size(tmp.Bias,1);
        else
            Constants.Lengths{j}=Constants.Lengths{j-1};
        end
        j=j+1;
    end
end

end