*** Comments ***
Tutorial: Templates - Part 1: BASICS > Template Types


*** Settings ***
Documentation       Template from custom library

Library             CustomLib.py

Test Template       Should Add Up To Integer


*** Test Cases ***
Templated Test Case With Custom Library Keyword
    41       1
    0.5      81.5
    14.2     0.8
