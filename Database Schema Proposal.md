# Users #
User ID| Email | Nickname | Password | Privilege |  
-- | -- | -- | -- | --  
0 | admin@teenserv.com | Admin | 21ediwosjciposau | admin  
1 | nancy.smith@gmail.com | Nancy Smith | ewofijdsoljfkld | normal  

According to the specifications the unique User ID must be email address. The idea is that users could use some other public email addresses to contact each other or use a relay service (like that on kijiji).  
Of course the password is excrypted.  

# Teenager #

User ID | Name | Date of Birth | Home address | Address Post Code | Public Email addresses | Cell phone | Prof pic  
------- | ---- | --- | ------------ | ------------- | ---------- | -------- | - 


# Client # 
User ID | Name | Home address | Post Code | Email  | Cell phone | Prof pic | Bank account  
-- | -- | -- | -- | -- | -- | -- | -  
1 | Nancy Smith | 27 King's College Circle | M5S 1A1 | nancy.smith@mail.utoronto.ca | 2333344456 | null  



# Teenager Offer #
Offer ID | Teen ID | Service Type | Hours | Offer Details
-- | -- | -- | -- | -  
1 | 1 | 1 | 2017/10/04 12:00-13:30;2017/10/04 18:00-19:00 | I could come during either periods of time, but not both  
  
Hours column stores the hours (intervals) offered by the teenage, with minimum unit of 10 min.   
Offer Details is some further explanation given by the teenager.   
  
# Client Request #  
Request ID | Client ID | Service ID | Request Periods Type | Time | Trigger Type | Trigger Detail  
-- | -- | -- | -- | -- | -- | -  
1 | 1 | 1 | Once | 2017/10/04 08:00-18:00 | null | null  
1 | 1 | 1 | Trigger | 2017/10/05 00:00-24:00 | 1 | 10  
  
Triggers are to be processed by the controller, for example Trigger Type 1 with Detail 10 means that the serice will happen every 10 days. In this case, "Time" is interpreted as trigger activate time.  
  
  
# Reviews #  
  
Review ID | Person ID | Person Type | Service Type | Request ID | Offer ID | Rate | Review Text | Review time   
 -- | -- | -- | -- | -- | -- | -- | -- | -  
1 | 1 | Client | 1 | 10 | 20 | 4 | Good work | 2017/10/03 18:37  
  
# Block List #  
Block ID | Block by | User ID | Block till |   
 -- | -- | -- | -  
1 | 1 | 2 | 2017/10/04 18:00  
2 | 1 | 2 | 2999/12/31 23:59  
  
