angular
  .module("sportsStore")
  .constant("dataUrl", "https://localhost:44388/api/products")
  .controller("sportsStoreCtrl", function ($scope, $http, dataUrl) {
    const staticDataProducts = [
      {
        name: "Product #1",
        description: "A product",
        category: "Category #1",
        price: 100,
      },
      {
        name: "Product #2",
        description: "A product",
        category: "Category #1",
        price: 110,
      },
      {
        name: "Product #3",
        description: "A product",
        category: "Category #2",
        price: 210,
      },
      {
        name: "Product #4",
        description: "A product",
        category: "Category #3",
        price: 202,
      },
    ];

    $scope.data = {};
    $http
      .get(dataUrl + "/GetAllProducts")
      .then(function (response) {
        $scope.data.products = response.data;
        console.log($scope.data.products);
      }, function(res) {
        $scope.data.error = res;
      });
  });
