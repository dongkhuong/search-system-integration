({
	handleSearch : function(component, event) {
		var isEnterKey = event.keyCode ===13;
        var queryTerm = component.find('enter-search').get('v.value');
        if(isEnterKey) {
            component.set('v.isSearching', true);
            setTimeout(function() {
               component.set('v.isSearching', false); 
            }, 2000);
        }
	}
})