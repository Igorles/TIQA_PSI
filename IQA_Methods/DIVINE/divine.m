function q = divine(im)

% q = divine2(im)

q = evalc('divine2(im)');
q = strsplit(q);

for i=1:size(q,2)
if isempty(q{end})
q(end) = [];
end
end

q = str2num(q{end});

end

