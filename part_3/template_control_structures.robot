*** Comments ***
Tutorial: Templates - Part 3: Control structures


*** Settings ***
Documentation       Control structures

Library             OperatingSystem

Suite Setup         Log    This is suite setup
Suite Teardown      Log    This Is suite teardown
Test Setup          Log    This is test setup
Test Teardown       Log    This Is test teardown

Test Template       File Size Should Not Exceed


*** Variables ***
@{FILES}    log.html    report.html    output.xml
@{BYTES}    5000000    1000000    3000000


*** Test Cases ***
Loop Over Filename
    FOR    ${file}    IN    @{FILES}
        ${file}    1000000
    END


Multiple Iterations In Loop
    FOR    ${file}    IN    @{FILES}
        ${file}    1000000
        ${file}    5000000
        ${file}    3000000
    END


Two Loops
    FOR    ${file}    IN    @{FILES}
        ${file}    1000000
    END
    FOR    ${size}    IN    @{BYTES}
        log.html    ${size}
    END


Nested
    FOR    ${file}    IN    @{FILES}
        FOR    ${size}    IN    @{BYTES}
            ${file}    ${size}
        END
    END


With IN RANGE
    FOR    ${file}    IN    @{FILES}
        FOR    ${size}    IN RANGE    2000000    3000000    5000000
            ${file}    ${size}
        END
    END


With ENUMERATE
    [Template]    Verify File Size And Rename
    FOR    ${index}    ${file}    IN ENUMERATE    @{FILES}
        ${file}    1000000    ${index}_checked_${file}
    END


With WHILE
    # Explicitly not supported
    WHILE    True    limit=10
        ${file}    1000000
    END


With TRY/EXCEPT
    # Explicitly not supported
    TRY
        ${file}    10000
    EXCEPT
        No Operation
    END


With BREAK
    # Don't execute next steps, nor next iterations if condition is met.
    FOR    ${size}    IN    @{BYTES}
        IF    ${size} == 1000000    BREAK
        log.html    ${size}
    END


With CONTINUE
    # Skip next steps and move to next iteration if condition is met.
    FOR    ${size}    IN    @{BYTES}
        IF    ${size} == 1000000    CONTINUE
        log.html    ${size}
    END


New Group Syntax
    GROUP    HTML
        log.html   1000000
        report.html   500000
    END

    GROUP    XML
        output.xml   20000
        another.xml   90000
    END


New Group Syntax With Loop
    GROUP    HTML
        FOR    ${file}    IN    @{FILES}
            ${file}    1000000
        END
    END

    GROUP    XML
        output.xml   20000
        another.xml   90000
    END


*** Keywords ***
File Size Should Not Exceed
    [Documentation]    Checks given file size. Fails if exceeds max.
    [Arguments]    ${file}    ${max_size}
    [Setup]    Log    This is iteration setup
    ${size}=    Get File Size    data/${file}
    Should Be True    ${size }< ${max_size}
    [Teardown]    Log    This is iteration teardown

Verify File Size And Rename
    [Documentation]    Checks given file size. Renames if size is ok.
    [Arguments]    ${file}    ${max_size}    ${rename}
    ${size}=    Get File Size    data/${file}
    Should Be True    ${size} < ${max_size}
    Copy File    data/${file}    checked/${rename}

