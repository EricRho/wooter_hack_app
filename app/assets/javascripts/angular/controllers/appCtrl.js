app.controller('testCtrl', ['$scope', function($scope) {
	$scope.things = ({
		name: 'eric',
		age: 28
	}, {
		name: 'ian',
		age: 27
	}, {
		name: 'euan',
		age: 27
	});
}]);

app.controller('clockCtrl', ['$scope', function($scope) {
	$scope.clock = new Date();
	var updateClock = function() {
		$scope.clock = new Date();
	};
	setInterval(function() {
		$scope.$apply(updateClock);
	}, 1000);
}]);