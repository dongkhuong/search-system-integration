({
    callAction: function(component, actionName, params, successCallback, failureCallback) {
        var action = component.get(actionName);
        if( params ) {
            action.setParams(params);
        }
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS') {
                if(successCallback) {
                    successCallback( response.getReturnValue() );
                }
            } else {
                 if ( failureCallback ) {
                    failureCallback( response.getError(), response.getState() );
                 }
            }
        });
        $A.enqueueAction( action ); 
    },
    getDataBySearching: function(component, event, searchKey) {
      var helper = this;
      component.set('v.videoList', null);
      component.set('v.errorMessage', null);
      helper.callAction(
      	component,
        'c.getDataBySearching',
        {
            searchKey: searchKey,
            objectName: component.get('v.sObjectName'),
            recordId: component.get('v.recordId')
        },
        function(data) {
            component.set('v.errorMessage', '');
            var videoList = JSON.parse(data);
            console.log(videoList);
            component.set('v.videoList', videoList);
        },
        function(errors, state) {
            component.set('v.videoList', null);
            var errorMessage = (errors && Array.isArray(errors) && errors.length > 0) ? errors[0].message : 'Common Error';
            component.set('v.errorMessage', errorMessage);
        });
    },
    viewDataBySearching: function(component, event, searchKey) {
      	this.getDataBySearching(component, event, searchKey);  
    },
    handleSearch : function(component, event) {
		var isEnterKey = event.keyCode ===13;
        var searchKey = component.find('enter-search').get('v.value');
        if(isEnterKey) {
            if(!searchKey.trim()) {
                //TO DO
            } else {
                this.viewDataBySearching(component, event, searchKey.trim());
            }
        }
	}
})