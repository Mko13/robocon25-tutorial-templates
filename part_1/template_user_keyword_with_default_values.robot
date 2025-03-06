*** Comments ***
Tutorial: Templates - Part 1: BASICS > Template Types


*** Settings ***
Documentation       Template from user keyword. Here, Template keyword
...                 contains arguments with default values.

Test Template       Should Contain Given Times


*** Test Cases ***                       WORD               CHAR        COUNT
Templated Test Case With User Keyword
                                         Hello              l           2
                                         Robot Framework    r           2
                                         2512               2           2
                                         Robocon            o           3
                                         morning            @{EMPTY}
                                         @{EMPTY}


*** Keywords ***
Should Contain Given Times
    [Documentation]    Counts given character in word. Fails if not 2.
    [Arguments]    ${string}=evening    ${character}=n   ${expected}=2
    Log    ${string}, ${character}, ${expected}
    ${count} =    Get Count    ${string}    ${character}
    Should Be Equal As Integers    ${count}    ${expected}