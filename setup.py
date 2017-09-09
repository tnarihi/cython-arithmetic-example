from setuptools import setup
from distutils.extension import Extension
from Cython.Build import cythonize


def cython_extension_from_module_name(module_name, **ext_opts):
    return Extension(module_name, [module_name.replace(
        '.', '/') + '.pyx'], **ext_opts)


def get_cython_extensions(modules):
    return [cython_extension_from_module_name(p[0], **p[1]) for p in modules]


def main():
    cython_modules = [
        ['cy_ex_arithmetic.foo', {}]
    ]
    cython_extensions = get_cython_extensions(cython_modules)

    compiler_directives = {}
    ext_modules = cythonize(cython_extensions,
                            compiler_directives=compiler_directives)

    setup(package_dir={'': ''},
          packages=['cy_ex_arithmetic'],
          ext_modules=ext_modules)

if __name__ == '__main__':
    main()
