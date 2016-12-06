<cfscript>
  component output="false" mixins="controller" {

    public function init() {
      this.version = "1.4.5,2.0";
      return this;
    }

    /********************
      SETTERS
    *********************/

    public void function setTitle(required string title) {
      request.$meta.title = arguments.title;
    }

    public void function setKeywords(required string keywords) {
      request.$meta.keywords = arguments.keywords;
    }

    public void function setDescription(required string description) {
      request.$meta.description = arguments.description;
    }

    /********************
      GETTERS
    *********************/

    public string function getContentTitle() {

      local.title = "";

      if (structKeyExists(request, "$meta")
          && structKeyExists(request.$meta, "title")) {
        local.title = request.$meta.title;
      }

      return local.title;
    }

    public string function getPageTitle(spacer=" - ", site=cgi.server_name) {

      local.title = arguments.site;

      if (structKeyExists(request, "$meta")
          && structKeyExists(request.$meta, "title")) {
        local.title = request.$meta.title & arguments.spacer & arguments.site;
      }

      return local.title;
    }

    public string function getKeywords() {

      local.keywords = "";

      if (structKeyExists(request, "$meta")
          && structKeyExists(request.$meta, "keywords")) {
        local.keywords = request.$meta.keywords;
      }

      return local.keywords;
    }

    public string function getDescription() {

      local.description = "";

      if (structKeyExists(request, "$meta")
          && structKeyExists(request.$meta, "description")) {
        local.description = request.$meta.description;
      }

      return local.description;
    }

    public string function getCopyright(numeric startYear=2016) {

      local.copyright = arguments.startYear;
      local.currentYear = year(now());

      if (local.copyright neq local.currentYear)
        return local.copyright & " - " & local.currentYear;

      return local.copyright;
    }
  }
</cfscript>
