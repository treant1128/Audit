function UserCtrl($scope,$http) {
  var now_where_I_am=window.location;


  var user_cookies={};
  if(sessionStorage["audit_new"]){
    user_cookies=JSON.parse(sessionStorage["audit_new"]);
  }else{

  }

  if(now_where_I_am){
	  if(user_cookies.user!=null || user_cookies.user!=undefined){
	  		$scope.username=user_cookies.user;
	  }
	}else{
		
	}

  $scope.verfy_user=function(){

   var data={name:$scope.username,password:$scope.password};
  
   if ($scope.username!="" && $scope.password!="") {
   	console.log("hi.....I am not nulll......");
  	  $http.post('/login',data).success(function(data) {
 
			if(data.priv){
  	  				sessionStorage["audit_new"]=JSON.stringify(data);
    				window.location="auditAdmin.html";
			}else{
				alert(data);
			}
  	  });//end of http post method
  	}//end of if usr and password input textbox not null

  }//end of verfy_user function

}