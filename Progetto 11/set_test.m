function [testcase] = set_test(tag)

if tag == 1
    testcase = 'burgers';
elseif tag == 2
    testcase = 'kdv';
else
    error('Invalid tag');
end

end