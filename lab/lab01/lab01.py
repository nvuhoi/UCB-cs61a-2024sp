def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    ans = 1
    a = 0
    while a < k :
        ans *= n - a
        a += 1
    return ans


def divisible_by_k(n, k):
    """
    >>> a = divisible_by_k(10, 2)  # 2, 4, 6, 8, and 10 are divisible by 2
    2
    4
    6
    8
    10
    >>> a
    5
    >>> b = divisible_by_k(3, 1)  # 1, 2, and 3 are divisible by 1
    1
    2
    3
    >>> b
    3
    >>> c = divisible_by_k(6, 7)  # There are no integers up to 6 divisible by 7
    >>> c
    0
    """
    if k > n :
        return 0
    else :
        a = 0
        b = k
        while b <= n :
            if b % k == 0 :
                print(b)
                a += 1
            b += 1    
    return a

def sum_digits(y):
    """Sum all the digits of y.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> a = sum_digits(123) # make sure that you are using return rather than print
    >>> a
    6
    """
    from math import pow
    n = 0
    while y // pow(10, n) != 0 :
        n += 1
    n -= 1
    sum = 0
    while n  != -1 :
        sum += y // pow(10, n)
        a = y // pow(10, n)
        y -= a *  pow(10, n)
        n -= 1
    return int(sum) 



def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    from math import pow
    p = 0
    while n // pow(10, p) != 0 :
        p += 1
    p -= 1
    sum = 0
    while p  != 0 :
        one = n // pow(10, p)
        a = n // pow(10, p)
        n -= a * pow(10, p)
        p -= 1
        two = n // pow(10, p)
        if int(one) == 8 :
            if int(two) == 8 :
                return True
    return False

