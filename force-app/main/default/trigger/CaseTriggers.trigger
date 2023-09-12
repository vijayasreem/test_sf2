trigger CaseTrigger on Case (before insert) {

   for(Case c : Trigger.new){
       
       //update Date_Received__c to today
       c.Date_Received__c = System.today();
       
       //remove characters other than alphabets and short the lenght of string to 50
       if(c.Provider_Name__c != null){
           String newName = c.Provider_Name__c.replaceAll('[^A-Za-z0-9 ]', '');
           c.Provider_Name__c = newName.substring(0, Math.min(50, newName.length()));
       }
   }
}