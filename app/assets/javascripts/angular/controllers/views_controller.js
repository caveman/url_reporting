var reportingApp = angular.module('reportingApp', []);


reportingApp.controller('viewListCtrl',	['$scope', '$http', 
	function ($scope, $http) {
		$http.get('views.json').success(function(data) {
	    $scope.views = data;
	  });
	  //$scope.orderProp = 'created_at';
	}]);