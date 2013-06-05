var myApp = angular.module('myApp', []).filter('weDontLike', function(){
    
    return function(items, name){
        
        var arrayToReturn = [];
        //console.log(items);
        for (var key in items) {
           if(items[key]){
            arrayToReturn.push(key);
           }
        }
        return arrayToReturn;
    };
});

function TasksCtrl($scope,$http) {

	var user_cookies={};

	if(sessionStorage["audit_new"]){
		user_cookies=JSON.parse(sessionStorage["audit_new"]);
		$scope.user=user_cookies.user;
		$scope.priv=user_cookies.priv;
	}else{
		window.location="/";
	}


  
  var updatePages=function(start){

//      $http.get('/paging',{'p':start}).
//         success(function(data){
//			$scope.tasks = data;  
//      });//end of post success
	  
	  
	  $http({
		url:"/paging",
		method:"GET",
		params:{p:start}
	  }).success(function(data){
		$scope.tasks=data;
	  });  //Pagination
	  
	  $http.get('/pages').
          success(function(data){
		  $scope.pages=[];
		  for(var i=1;i<=data;i++){
			$scope.pages.push(i);
		  }
//			console.log($scope.pages);
      });//end of post success
	  
 
	  
  };

  //分页查看，响应用户点击分页按钮
  $scope.loadPage=function(start){
//	console.log(start);
    updatePages(start);
  };
 
  $scope.executeAudit=function(id, status){
		$http({
			url:"/updateStatus",
			method:"GET",
			params:{'id':id, 'status': status}
		}).success(function(data){
			if(data.err){
				alert(data.err);
			}else{
				console.log(data);
				if(data.id){
					for(var i=0;i<$scope.tasks.length;i++){
						if($scope.tasks[i].id===id){
							$scope.tasks[i]=data;
						}
					}// End of for
					console.log(window.frames[0]);
//					window.frames[0].postMessage(data, '*');
				}
			} //End of If else
	  }); //End of Success
  };
  
  $scope.auditSugg=function(task){
			window.frames[1].postMessage(task, '*');
//			console.log("MM="+message.id+message.title);	
  }
  
  //父窗口收到修改意见后判定task.id->修改scope.tasks
  //隐藏Modal
  	window.onmessage = function(event) {
		var task=event.data;
		
		if(task.id){
			$scope.$apply(function(){
				for(var i=0;i<$scope.tasks.length;i++){
					if($scope.tasks[i].id===task.id){
						$scope.tasks[i]=task;
						$('#myModal').modal('hide');
					}
				}// End of for
			});	//End of scope.apply
		}//End of if	
			
	};  //End of OnMessage
	
	$scope.logout=function(){
		if(confirm("确定退出吗?")){
			window.location="/"; 
			console.log($scope.username);
		}
	}
  //数据的初始化
  //首先得到整个表的条目数量，取users[user_login].tasksList.length
  //然后根据每页面50，倒排得去服务器取数据
  //另外只能取该用户自身的数据，别人的数据他不应该能看到
  //当然power===admin的用户，就随便了
  updatePages();
  
}