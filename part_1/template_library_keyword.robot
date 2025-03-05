*** Comments ***
Tutorial: Templates - Part 1: BASICS > Template Types


*** Settings ***
Documentation       Template from library keyword

Test Template       Should Contain


*** Test Cases ***
Templated Test Case With Library Keyword
    Good Morning!    morning    ignore_case=True
    Robot Framework    Framework
    Welcome!    Welcome
