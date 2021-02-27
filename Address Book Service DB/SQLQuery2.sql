--UC18 add date_added column

use AddressBookService;
ALTER TABLE AddressBook ADD Added_Date DATE CONSTRAINT Added_Date_DefaulrValue Default GETDATE();