*** Settings ***
Documentation    Suite description
Resource        ../Resources/BookAppointmentResources.robot


*** Test Cases ***
User should successfully book an appointment
    Launch Browser and Navigate To Booking Page
    Go To Book Appointment For Yourself
    Select Specialist Service And Appointment Type
    Search and Select Appointment Clinic
    Choose Appointment Date
    Select Earliest To Latest Time
    Uncheck Phone Appointment
    Uncheck Video Appointment
    Select Specialist

