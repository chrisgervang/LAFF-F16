function [ y_out ] = laff_axpy( alpha, x, y )

%Get the size of vector x.
[rows_x, cols_x] = size (x);
[rows_y, cols_y] = size(y);

% row vectors have many columns and one row
% column vectors have many rows and one column

% all vectors must have either 1 row or 1 column
if(rows_x ~= 1 && cols_x ~= 1) || (rows_y ~=1 && cols_y ~= 1)
    y_out = 'FAILED';
    return
end
% all vectors must have the same number of elements
if(rows_x * cols_x ~= rows_y * cols_y)
    y_out = 'FAILED';
    return
end

if(~isscalar(alpha))
    y_out = 'FAILED';
    return
end

% if x is a column vector
if(cols_x == 1)
    % if y is a column vector
    if(cols_y == 1)
       % column -> column copy
       for i=1:rows_x 
           y(i, 1) = alpha*x(i,1) + y(i,1);
       end
    else
        % column -> row copy
       for i=1:rows_x
          y(1, i) = alpha*x(i, 1) + y(1,i);
       end
    end
else % x is a row column
   if(cols_y == 1) % y is a column vector
       % row -> column copy
       for i=1:cols_x
          y(i, 1) = alpha*x(1,i) + y(i,1); 
       end
   else
       % row -> row copy
       for i=1:cols_x
          y(1,i) = alpha*x(1,i) + y(1,i); 
       end
   end
end

y_out=y;
return
end

