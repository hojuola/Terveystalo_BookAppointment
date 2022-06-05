*** Settings ***
Documentation    Suite description
Library          Browser


*** Variables ***
${BOOKYOURSELF}          //*[@id="book-for-yourself-btn"]/span
${HOMEPAGE_BOOKING}      //*[@id="root"]/div/main/div[1]/div/h1
${PRIVATECUSTOMERS}      //*[@id="book-for-yourself-content"]/div/ul/li[1]/a
${SEARCHSPECIALISTBOX}   id=select-service-or-specialist-popup
${SERVICENAME}           Eye diseases
${CHOOSESERVICE}         //*[@id="service-2c566058-f809-4f4d-b2d1-9c9242e04a52"]
${SEARCHCLINIC_FIELD}    id=select-location-popup
${APPOINTMENTTYPE}       //*[@id="root"]/div/main/div[1]/aside/div[2]/div
${SEARCH_CLINIC}         Terveystalo Oulu
${CLINICNAME}            id=city-6fa0ba0b-92cc-4cb6-8168-30baf4f93aa6-clinic-968fd8e8-b211-41aa-9520-2f7a613e826c
${SELECT_DATE}           id=2022-07-27
${FROM_THIS_TIME}        //*[@id="root"]/div/main/div[1]/aside/div[4]/div[1]/div/div[1]
${TO_THIS_TIME}          //*[@id="root"]/div/main/div[1]/aside/div[4]/div[1]/div/div[2]
${VIDEO_APPOINTMENT}     //*[@id="types-select"]/div[2]/label/input
${PHONE_APPOINTMENT}     //*[@id="types-select"]/div[3]/label/input
${SCROLL_ELEMENT}        //*[@id="root"]/div/main/div[1]/section

*** Keywords ***
Launch Browser and Navigate To Booking Page
    New Browser   chromium    headless=false
    new page      https://ajanvaraus.terveystalo.com/en/
    get text      ${HOMEPAGE_BOOKING}  ==  Booking

Go To Book Appointment For Yourself
    Click       ${BOOKYOURSELF}
    Click       ${PRIVATECUSTOMERS}

Select Specialist Service And Appointment Type
    fill text    ${SEARCHSPECIALISTBOX}  ${SERVICENAME}
    Click        ${CHOOSESERVICE}
    Click        ${APPOINTMENTTYPE}

Search and Select Appointment Clinic
    fill text          ${SEARCHCLINIC_FIELD}  ${SEARCH_CLINIC}
    Click              ${CLINICNAME}

Choose Appointment Date
    click       //*[@id="root"]/div/main/div[1]/aside/div[3]/div/div/div[3]
    click       id=2022-07-27
    click       ${SELECT_DATE}


Select Earliest To Latest Time
    click                ${FROM_THIS_TIME}
    get select options   ${FROM_THIS_TIME}
    click                ${TO_THIS_TIME}
    get select options   ${TO_THIS_TIME}

Uncheck Video Appointment
    click           ${VIDEO_APPOINTMENT}


Uncheck Phone Appointment
     click           ${PHONE_APPOINTMENT}

Select Specialist
    scroll to element   ${SCROLL_ELEMENT}
    click               ${SCROLL_ELEMENT}