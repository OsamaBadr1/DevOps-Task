# Scripting-Task

## Question
### Write a Bash shell or a python script which can:
      1. Process a text file which has users and their properties in each line.
      2. Determine one by one if the ID number of the user (last column) is odd or even number if it's specified. ● Check whether that user has a routable, FQDN email address.
      3. If so, write a message to stdout like: the $ID of $EMAIL is even|odd number.  
      4. If the user has no valid email address OR user ID, the script should silently continue to the next user. 

## Answer
### Script Description:
      1. Clear the shell
      2. Check if the user has a valid complete data 
            - Username 
            - email
            - ID
      3. In the case of user has full data, the user data will be processed
         If not, Will skip the user
      4. Check if the user has a fqdn
      5. Considered any user has @ at the second column then the user has fqdn
      3. In the case of the user has fqdn, the user data will be processed
         If not, Will skip the user
      7. Since localhost is fqdn so the data will be processed
      8. Check if the user has an even ID number or an odd ID number
      9. If the user has even ID will print 
            The ID ( ID ) of the user ( fqdn ) is even number
      10. If the user has odd ID will print 
            The ID ( ID ) of the user ( fqdn ) is odd number
            
### Steps to run the script:
      1. git clone https://github.com/OsamaBadr1/DevOps-Task.git
      2. cd DevOps-Task/Scripting-Task/
      3. chmod +x script.sh
      4. ./script.sh
      
### Script output:
      Start processing the file line by line
      --------------------------------------
      The ID ( 325 ) of the user (john@domain.com) is odd number
      The ID ( 131 ) of the user (jane@domain.com) is odd number
      The ID ( 150 ) of the user (bert@localhost) is even number
