function [ x_out ] = laff_scal( alpha, x )

[rows_x, cols_x] = size(x);

% the vector must have either 1 row or 1 column
if(rows_x ~= 1 && cols_x ~= 1)
    x_out = 'FAILED';
    return
end

if(~isscalar(alpha))
    x_out = 'FAILED';
    return
end

if(rows_x == 1) 
   for i=1:cols_x
       x(1, i) = alpha * x(1, i);
   end
else
   for i=1:rows_x
      x(i, 1) = alpha * x(i, 1); 
   end
end

x_out = x;
return

end

