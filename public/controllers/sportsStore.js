angular
  .module("sportsStore")
  .constant("dataUrl", "https://localhost:44388/api/products")
  .constant("orderUrl", "https://localhost:44388/api/orderddetails")
  .controller(
    "sportsStoreCtrl",
    function ($scope, $http, $location, dataUrl, orderUrl) {
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

      $scope.data = {
        /**
         * Input fields binded to scope.
         */
        shipping: {
          name: "",
          street: "",
          city: "",
          state: "",
          zip: "",
          country: "",
          giftwrap: false,
        },

        products: [],
      };
      $scope.data.shipping.name = "";
      $scope.data.shipping.street = "";

      $http.get(dataUrl + "/GetAllProducts").then(
        function (response) {
          $scope.data.products = response.data;
          console.log($scope.data.products);
        },
        function (res) {
          $scope.data.error = res;
        }
      );

      $scope.sendOrder = function (shippingDetails) {
        const order = angular.copy(shippingDetails);
        order.products = cart.getProducts();
        $http
          .post(orderUrl, order)
          .success(function (data) {
            $scope.data.orderId = data.id;
            cart.getProducts().length = 0;
          })
          .error(function (error) {
            $scope.data.orderError = error;
          })
          .finally(function (error) {
            $location.path("/complete");
          });
      };
    }
  );
