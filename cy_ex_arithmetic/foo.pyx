from __future__ import print_function

FOO_COUNT = 0

cdef class Foo:
    cdef public str my_id

    def __init__(self, my_id=None):
        global FOO_COUNT
        if my_id is None:
            self.my_id = str(FOO_COUNT)
            FOO_COUNT += 1
        else:
            self.my_id = my_id

    def __repr__(self):
        return 'Foo({})'.format(self.my_id)

    def __str__(self):
        return 'Foo({})'.format(self.my_id)

    def __add__(left, right):
        if isinstance(left, Foo):
            if isinstance(right, Foo):
                return Foo(left.my_id + '+' + right.my_id)
            else:
                return Foo(left.my_id + '+' + str(right))
        elif isinstance(left, int):
            if isinstance(right, Foo):
                return Foo(str(left) + '+' + right.my_id)
            else:
                return Foo(str(left) + '+' + str(right))

    def __sub__(left, right):
        if isinstance(left, Foo):
            if isinstance(right, Foo):
                return Foo(left.my_id + '-' + right.my_id)
            else:
                return Foo(left.my_id + '-' + str(right))
        elif isinstance(left, int):
            if isinstance(right, Foo):
                return Foo(str(left) + '-' + right.my_id)
            else:
                return Foo(str(left) + '-' + str(right))
