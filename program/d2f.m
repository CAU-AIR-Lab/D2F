function feat = d2f( data, target, number )

fcol = size( data, 2 );
tcol = size( target, 2 );

f_ent = zeros( fcol, 1 );
ff_ent = zeros( fcol, fcol );
fl_ent = zeros( fcol, tcol );
for k=1:fcol
    f_ent(k,1) = n_entropy( data(:,k) );
    ff_ent(k,k) = f_ent(k,1);
    for m=k+1:fcol
        ff_ent(k,m) = n_entropy( [data(:,k),data(:,m)] );
        ff_ent(m,k) = ff_ent(k,m);
    end
    
    for m=1:tcol
        fl_ent(k,m) = n_entropy( [data(:,k),target(:,m)] );
    end
end

scr = zeros( fcol, tcol );
for k=1:fcol
    for m=1:tcol
        scr(k,m) = f_ent(k,1) - fl_ent(k,m);
    end
end
scr = sum( scr, 2 );

[~,feat] = max(scr);
scr(feat,1) = -inf;
for k=2:number
    for m=1:fcol
        if isinf( scr(m,1) ), continue, end
        for n=1:length(feat)
            for a=1:tcol
                scr(m,1) = scr(m,1) ...
                    - f_ent(m,1) - f_ent(feat(n,1)) ...
                    + ff_ent(m,feat(n,1)) + fl_ent(m,a) ...
                    - n_entropy( [data(:,m),data(:,feat(n,1)),target(:,a)] );
            end
        end
    end
    [~,feat(end+1,1)] = max(scr);
    scr(feat(end,1),1) = -inf;
end


function [res] = n_entropy( vector )

[uidx,~,single] = unique( vector, 'rows' );
count = zeros(size(uidx,1),1);
for k=1:size(vector,1)
    count( single(k), 1 ) = count( single(k), 1 ) + 1;
end
res = -( (count/size(vector,1))'*log2( (count/size(vector,1)) ) );
