({  
    doInit : function(component){
        var main = component.find('main');
		$A.util.addClass(main, component.get("v.AutoSwitch"));
    },
    
    loadPictures : function(component) {
        var projectId = component.get("v.recordId");
        if (!projectId) {
            return;
        }
        
        var action = component.get("c.getPictures");
        action.setParams({
            "projectId": projectId,
        });
        action.setCallback(this, function (response) {
            var files = component.get("v.files");
            var newFiles = response.getReturnValue();
            if (!newFiles) {
                return;
            }
            if (!files) {
                files = [];
            } else {
                for (var i=files.length;i<newFiles.length; i++) {
                    files.push(newFiles[i]);
                }
            }
            component.set("v.files", files);
        });
        $A.enqueueAction(action);
    }
})