var songinit = angular.module('Songinit', ['angularSoundManager']);

songinit.controller("songsController", function($scope, $http) {
   $http.get('/song')
   .then(function(res){
      $scope.songs = res.data;        
   });
  
})
