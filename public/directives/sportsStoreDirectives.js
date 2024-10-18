/**
 * <insert-link></insert-link>
 * Works exactly like an HTML link element. Can use this directive to include css files 
 * which will be inserted just above the <title> tag in the <head> element. This allows 
 * for a cleaner approach to including unique styles for each angularjs view.
 */
angular.module("sportsStore").directive("insertLink", function ($document) {
  return {
    restrict: "E",
    scope: {
      rel: "@",
      href: "@",
      type: "@",
      media: "@",
    },
    link: function (scope, element, attrs) {
      // Create the link element
      const linkElement = angular.element("<link>");
      linkElement.attr("rel", scope.rel || "stylesheet");
      linkElement.attr("href", scope.href);
      linkElement.attr("type", scope.type || "text/css");
      linkElement.attr("media", scope.media || "all");

      // Get the head element and title tag
      const headElement = $document.find("head");
      const titleElement = headElement.find("title");

      // Insert the link before the title tag
      if (titleElement.length) {
        const titleDomElement = titleElement[0];
        titleDomElement.parentNode.insertBefore(linkElement[0], titleDomElement);
      } else {
        headElement.append(linkElement);
      }
    },
  };
});