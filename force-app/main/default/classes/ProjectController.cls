global with sharing class ProjectController {
    @AuraEnabled
    public static List<ContentVersion> getPictures (Id projectId) {

        List<ContentDocumentLink> links = [select id, LinkedEntityId, ContentDocumentId from ContentDocumentLink 
                                           WHERE LinkedEntityId=:projectId AND ContentDocument.FileType in ('PNG','JPG', 'JPEG','GIF')];

        if (links.isEmpty()) {
            return null;
        }

        Set<Id> contentIds = new Set<Id>();

        for (ContentDocumentLink link :links) {
            contentIds.add(link.ContentDocumentId);
        }

        return [SELECT Id, Title FROM ContentVersion WHERE ContentDocumentId IN :contentIds AND IsLatest=true ORDER BY CreatedDate];
    }

}