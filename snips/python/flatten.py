"""flatten iterator itertools"""


import itertools

def flatten (x):
    return list(itertools.chain.from_iterable(x))
