*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary


*** Variables ***
${URL}                  https://ajanvaraus.terveystalo.com/en/
${BROWSER}              chrome
${BOOKING}              Booking
${BOOKINGBUTTON}        //*[@id="book-for-yourself-btn"]
${PRIVATECUSTOMER}      //*[@id="book-for-yourself-content"]/div/ul/li[1]/a
${SEARCH_SPECIALIST}     //*[@id="select-service-or-specialist-popup"]
${SELECT_SERVICE}       //*[@id="service-11725289-4673-466d-b742-314404d489a9"]
#${GENERALPRACTITIONER}  id:popular-service-8bda3634-5090-42a3-a312-993791630b69
${CITYLOCATION}         //*[@id="select-location-popup"]
${SELECT_CLINIC}        //*[@id="root"]/div/main/div[1]/aside/div[3]/div/div/div[3]/button
${CITY_SEARCH}          Terveystalo Oulu
${SCROLL_ELEMENT}       //*[@id="root"]/div/main/div[1]/aside/div[3]/div/table/tbody
${TERVEYSTALO_OULU}     //*[@id="city-6fa0ba0b-92cc-4cb6-8168-30baf4f93aa6-clinic-968fd8e8-b211-41aa-9520-2f7a613e826c"]
${DATE_SEARCH}          //*[@id="2022-07-05"]
${CHOOSE_APPOINTMENT}   //*[@id="mainResult-da7d74c5-d065-419e-8ad2-afc81ac76e80"]/div[2]/div

*** Keywords ***
Provided precondition
Launch Browser and Navigate To Booking Page
    Open Browser                        ${URL}        ${BROWSER}
    Maximize Browser Window

Go To Book Appointment For Yourself
    Page Should Contain                 ${BOOKING}
    Click element                       ${BOOKINGBUTTON}
    Click element                       ${PRIVATECUSTOMER}
    Sleep                               5

Select Specialist Service And Appointment Type
    Input Text                          ${SEARCHSPECIALIST}    Cardiology
    Sleep                               5
    Click Button                        ${SELECT_SERVICE}

Search and Select Appointment Clinic
    Wait until element is visible       ${CITYLOCATION}
    Input Text                          ${CITYLOCATION}        ${CITY_SEARCH}
     FOR                                ${index}    IN RANGE    2
        press keys                      ${SCROLL_ELEMENT}      ARROW_DOWN
    END
    Sleep                                 5
    Click Button                        ${TERVEYSTALO OULU}
    Click Button                        ${SELECT_CLINIC}
    FOR                                 ${index}    IN RANGE    5
        press keys                      ${SCROLL_ELEMENT}      ARROW_DOWN
    END
    Sleep                                 5

Choose Appointment Date
    Click element                       ${DATE_SEARCH}

Select Specialist
    Wait Until Element is Visible        ${CHOOSE_APPOINTMENT}
    Click element                        ${CHOOSE_APPOINTMENT}
