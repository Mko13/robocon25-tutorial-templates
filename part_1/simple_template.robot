*** Comments ***
Tutorial: Templates - Part 1: BASICS > Basic Concept


*** Settings ***
Test Template       Print Something


*** Test Cases ***
Simple Test Case With Template
    aaa    bbb
    ccc    ddd
    eee    fff


*** Keywords ***
Print Something
    [Documentation]    Print two words
    [Arguments]    ${first}    ${second}
    Log Many    First: '${first}'    Second: '${second}'