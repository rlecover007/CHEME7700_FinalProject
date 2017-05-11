
var OmnitureTracker =  function() {
    this.SuiteId = $('#omniture_site_id').length ? $('#omniture_site_id').val() : "";
    this.Site = $('#omniture_site').length ? $('#omniture_site').val() : "";
    this.Division = $('#omniture_division').length ? $('#omniture_division').val() : "";
    this.InstitutionName = "";
    this.InstitutionId = "";
    this.GroupName = $('#groupName').length ? $('#groupName').val() : "";
    this.GroupId = $('#groupId').length ? $('#groupId').val() : "";
    this.UserName = $('#userName').length ? $('#userName').val() : "";
    this.PageName = $('#pageName').length ? $('#pageName').val() : "";
    this.AuthenticationType
        = $('#AuthenticationType').length ? $('#AuthenticationType').val() : "";
    this.UserId = $('#userId').length ? $('#userId').val() : "";
};

OmnitureTracker.prototype.Track = function(params) {
    if (this.SuiteId.length <= 0) { console.log('Omniture Suite id is null'); return false;}
    if (this.Site.length <= 0) { console.log('Omniture Site id is null'); }
    if (this.Division.length <= 0) { console.log('Omniture division is null'); return false;}
    if (this.GroupName.length <= 0) { console.log('Omniture Group Name is null');}
    if (this.GroupId.length <= 0) { console.log('Omniture Group Id is null');}

    if(params) {
        var omnitureData = { };
        omnitureData["suiteId"] = this.SuiteId;
        omnitureData["site"] = this.Site;
        omnitureData["division"] = this.Division;
        omnitureData["institutionName"] = this.InstitutionName;
        omnitureData["institutionId"] = this.InstitutionId;
        omnitureData["groupName"] = this.GroupName;
        omnitureData["groupId"] = this.GroupId;
        omnitureData["userName"] = this.UserName;
        omnitureData["authenticationType"] = this.AuthenticationType;
        omnitureData["userId"] = this.UserId;
        omnitureData["pageName"] = this.PageName;
        $.each(params, function(key, value) {
            omnitureData[key] = value;
        });
        WKUserAnalytics.track(omnitureData);
    }
};