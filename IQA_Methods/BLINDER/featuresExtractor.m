function [output] = featuresExtractor(img ,net, ind)
actLayer = net.Layers{ind};

[x y ~]=size(img);

if x < 224 || y < 224
    img = imresize(img,'OutputSize',[224 224]);
end

actValues= activations(net.net, img, actLayer);
output = zeros(1, 2*net.Lengths{ind});
for i=1:2*net.Lengths{ind}
    if(i<=net.Lengths{ind})
        tmp = actValues(:,:,i);
        output(i) = min(tmp(:));
    else
        tmp = actValues(:,:,i-net.Lengths{ind});
        output(i) = max(tmp(:));
    end
end
end

