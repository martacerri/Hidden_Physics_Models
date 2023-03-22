function [testcase] = set_test(tag)

if tag == 1
    testcase = 'burgers';
elseif tag == 2
    testcase = 'kdv';
elseif tag == 3
    testcase = 'ks';
elseif tag == 4
    testcase = 'schrodinger';
elseif tag == 5
    testcase = 'ns';
else
    error('Invalid tag');
end

end