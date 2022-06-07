*** Settings ***
Documentation    Suite description
Resource       ../Resources/TerveystaloResources.robot


*** Test Cases ***
Broswer Launch And Open Terveystalo Page
   Launch Browser and Navigate To Booking Page
Navigate to Appointment
   Go To Book Appointment For Yourself
Select Appointment Criteria
   Select Specialist Service And Appointment Type
   Search and Select Appointment Clinic
   Choose Appointment Date
   Select Specialist
