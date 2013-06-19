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

  //用来临时存储审核通过的任务  用来核实
  $scope.tempTask={};
  $scope.usersToLocation=[];
	var user_cookies={};

	if(sessionStorage["audit_new"]){
		user_cookies=JSON.parse(sessionStorage["audit_new"]);
		$scope.name=user_cookies.name;
		$scope.priv=user_cookies.priv;
    $scope.location=user_cookies.location;
	}else{
		window.location="/";
	}

  //向server发送location, server的全局变量usersToLocation因此得以初始化
//    $http({
//        url:'/verifyLocation',
//        method:'POST',
//        data:{'location':$scope.location}
//        }).success(function(data){
//            $scope.usersToLocation=data; 
//            console.log($scope.usersToLocation);
//
//   
//        }).error(function(err){
//            console.log(err);
//      });

  var updatePages=function(start){  
   $http({
     url:'/pages',
     method:'GET',
     params:{'location':$scope.location}
   }).success(function(data){
      console.log(data);
      $scope.pages=[];
      for(var i=1; i<=data; i++){
         $scope.pages.push(i);
      }
   }).error(function(err){
      console.log(err);
     });



  //获取分页数据  没有传入start时默认取第一页
	  $http({
	  	url:"/paging",
	  	method:"GET",
  		params:{p:start, location:$scope.location}
	  }).success(function(data){
        console.log(data);
    		$scope.tasks=data;
	  });  //Pagination
	 
  };

   
  //HTTP GET修改status
  var updateStatus=function(id, status){
    $http({
      url:'/updateStatus',
      method:'GET',
      params:{'id':id, 'status':status}
        }).success(function(data){
          if(data.err){
            alert(data.err);
          }else{
            console.log(data);
            if(data.id){
              for(var i=0; i<$scope.tasks.length; i++){
                if($scope.tasks[i].id===id){
                  $scope.tasks[i]=data;
                } // locate the unique task by id
              } //End of for circle        
            }
          }  
        });//End of success
  };//End of updateStatus

  //分页查看，响应用户点击分页按钮
  $scope.loadPage=function(start){
    updatePages(start);
//    $(".pagination > ul > li").css("background-color","red");
  };
 
  $scope.executeAudit=function(task, status){
//	$http({
//		url:"/updateStatus",
//		method:"GET",
//		params:{'id':id, 'status': status}
//	}).success(function(data){
//		if(data.err){
//			alert(data.err);
//		}else{
//			console.log(data);
//			if(data.id){
//				for(var i=0; i<$scope.tasks.length; i++){
//					if($scope.tasks[i].id===id){
//						$scope.tasks[i]=data;
//           
//            //给t4的iFrame发送消息-->整个对象
//            window.frames[0].postMessage(data, '*');
//            $('#myModal1st').modal('show'); 
//					}
//				}// End of for
//			}
//		} //End of If else
//  }); //End of Success

    if(task.id){
      //如果通过(status==1),则发送Message->弹出iframe->自动填充并提交 
      if(status==1){
        $scope.tempTask=task;
        window.frames[0].postMessage(task, '*');
        $("#myModal1st").modal('show');
      }

      //如果驳回(status==2), 提示框确认 
      if(status==2){
        if(confirm('确定驳回此下发任务吗?')){
          updateStatus(task.id, status);    
        }
      }
    }//End of task.id valid
 
  }; //End of executeAudit
  

  //发送消息到审核意见iframe
  $scope.auditSugg=function(task){
			window.frames[1].postMessage(task, '*');
//			console.log("MM="+message.id+message.title);	
  } //End of auditSugg
  
  //父窗口收到修改意见后判定task.id->修改scope.tasks  隐藏Modal
 	window.onmessage = function(event){

		var task=event.data;
		console.log(task);

    //根据Message内容的不同做出不同响应
    //1. 确认保存审核意见
		  if(task.id){
			  $scope.$apply(function(){
				  for(var i=0; i<$scope.tasks.length; i++){
					  if($scope.tasks[i].id===task.id){
						  $scope.tasks[i] = task; //更新绑定的数据
						  $('#myModal2nd').modal('hide');
					  }
				  }// End of for
			  });	//End of scope.apply
		  }//End of if	
	
    //2. 返回列表 -> 隐藏Modal
	  	if(task.return2List){
		  	$("#myModal2nd").modal("hide");
		  } //Hide modal when 'return to list' button click

    //3. 下发成功后TaskList返回值的确认
      if(task.checkSMSTaskDataCallback){
        var result=task.checkSMSTaskDataCallback;
        console.log($scope.tempTask.send_o_url);

        for(var i=0; i<result.length; i++){  console.log(result[i]);
          if(result[i]===$scope.tempTask.send_o_url){
            updateStatus($scope.tempTask.id, 1);
            $("#myModal1st").modal('hide');
            console.log("Ready to Return");
            return;
          } //End of if url exists
        }
      }else{
        console.log("ERROR");
      }

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
