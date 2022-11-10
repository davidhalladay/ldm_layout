from setuptools import setup, find_packages

setup(
    name='ldm_layout',
    version='1.0.0',
    packages=find_packages(),
    install_requires=[
        'torch',
        'numpy',
    ],
)