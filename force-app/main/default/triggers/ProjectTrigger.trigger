/** 
* Populate account field Completed_Projects__c with count of related projects with status=closed
**/
trigger ProjectTrigger on Project__c (after delete, after insert, after update) {
    
    Set<Id> accountIds = new Set<Id>();
    
    if (Trigger.isUpdate || Trigger.isDelete) {
        for (Project__c proj  : Trigger.old){
            accountIds.add(proj.Account__c);   
        }
    }
    
    Map<Id,Account> accountMap = new Map<Id,Account>(
        [SELECT id, Completed_Projects__c,
         (SELECT Id, Status__c, End_Date__c  
          FROM Projects__r
          WHERE Status__c = 'closed') 
         FROM Account 
         WHERE Id IN :accountIds]);    
    
    if(!accountMap.isEmpty()){
        for (Account acc : accountMap.values()) {
                  Integer completeProj = 0;
                  for (Project__c p : acc.Projects__r){
                      if (p.Status__c == 'closed'){
                          completeProj++;
                      }
                  }
                  accountMap.get(acc.Id).Completed_Projects__c = completeProj;
              }
    }
    
    if (accountMap.size() > 0) {
        update accountMap.values(); 
    }
    
}