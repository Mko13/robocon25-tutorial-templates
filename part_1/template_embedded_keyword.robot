*** Comments ***
Tutorial: Templates - Part 1: BASICS > Template Types


*** Settings ***
Documentation       Template Keyword with embedded arguments

Test Template       Joining "${start}" And "${end}" Should Give Us "${word}"


*** Test Cases ***
Templated Test Case With Embedded Args
    Gno     mes       Gnomes
    L       ove       Love
    Rob     ot        Robot
    Fram    ework!    Framework!


*** Keywords ***
Joining "${start}" And "${end}" Should Give Us "${word}"
    [Documentation]    Joins two strings and compares to the expected result.
    ${result} =    Catenate    SEPARATOR=    ${start}    ${end}
    Should Be Equal    ${result}    ${word}