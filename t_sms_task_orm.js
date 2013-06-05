var express = require('express');
var app = express();
var orm = require('orm');
var paging = require('orm-paging');
var server = require('http').createServer(app);
app.use(express.bodyParser({}));

app.use(orm.express("mysql://root:123456@localhost/audit", {
    define: function (db, models) {
	
			db.use(paging);
	
			models.sms_task = db.define("t_sms_task", {
			id 				:Number,
			priority		:Number,
			type			:Number,
			method			:Number,
			content			:String,
			long_title		:Number,
			jump			:Number,
			send_title		:String,
			send_o_url		:String,
			send_s_url		:String,
			send_time_type	:Number,
			send_time		:Date,
			create_time		:Date,
			lock_flag		:Number,
			black_filter	:Number,
			qc_type			:Number,
			excfile			:String,
			srcfile			:String,
			sendfile		:String,
			flag			:String,
			opadmin			:String,
			op_step			:Number,
			del_flag		:Number,
			status			:Number,
			vip				:Number,
			qcfile			:String,
			interval_time	:String,
			num_count		:Number,
			data_date		:String,
			audit_time		:Date,
			audit_suggestion:String
			});  //end of define t_sms_task
			
			models.users = db.define("users", {
				id			:Number,
				name		:String,
				password	:String,
				priv		:String,
				power		:String,
				location	:String,
				secret 		:String
			});  //end of users
			
    }//End of define:function...
}));//End of app.use.....................

app.get('/t_sms_task_orm.js',function(req,res){
	res.send("??@@@###@?");
});  //写在use之前  防止读取静态文件

app.use('/', express.static(__dirname + '/'));

server.listen(9999);

var itemsPerPage=4;

//监听来自抓取平台提交的内容,插入数据库
app.post("/audit2MySQL", function(req, res){
	var task =  req.body;
	req.models.sms_task.create([
	{
		srcfile			:task.srcfile,
		send_time_type	:task.send_time_type,
		method			:task.method,
		send_title		:task.send_title,
		send_o_url		:task.send_o_url,
		content			:task.content,
		priority		:task.priority,
		long_title		:task.long_title,
		jump			:task.jump,
		qc_type			:task.qc_type,
		interval_time	:task.interval_time,
		create_time		:task.create_time,
		send_time		:task.send_time,
		num_count		:task.num_count,
		excfile			:task.excfile,
		sendfile		:task.sendfile,
		opadmin			:task.opadmin,
		op_step			:task.op_step,
		data_date		:task.data_date
	}
	], function(err, items){
		res.header("Access-Control-Allow-Origin", "*");
		res.header("Access-Control-Allow-Headers", "X-Requested_with");
		
		if(!err){
			res.send(items);
		}else{
			res.send(err);
		}
	})
});


//获取总页数
app.get("/pages", function(req, res){
	req.models.sms_task.settings.set("pagination.perpage", itemsPerPage); // default is 20
	req.models.sms_task.pages(function (err, pages) {
		res.send(JSON.stringify(pages));
    });
});

app.get("/paging", function(req, res){
		var p=req.param('p'); 
//		console.log("ppp="+p);
		req.models.sms_task.settings.set("pagination.perpage", itemsPerPage); // default is 20			
		req.models.sms_task.pages(function (err, pages) {
		if(p){
				req.models.sms_task.page(p).order('id',"Z").run(function (err, tasks) {
					res.send(JSON.stringify(tasks));
				});//End of get taasks
		}else{
				req.models.sms_task.page(1).order('id',"Z").run(function (err, tasks) {
					res.send(JSON.stringify(tasks));
				});//End of get taasks		
		}
    });//End of get pages
});//End of get pages...

//find all, deprecated by pagination
app.get("/findAllSmsTasks", function (req, res) {

    // req.models is a reference to models used above in define()
    req.models.sms_task.find({  },['create_time', "Z"], function (err, tasks) {
	
		if(err){
			res.send(err);			 
		}else{
			res.send(JSON.stringify(tasks));
		}
    });  //end of find
	
}); //end of get request

app.post("/login", function(req, res){
//	console.log("req.body=="+req.body);
	
	var na=req.body.name;
	var password=req.body.password;
	console.log("姓名="+na);
	console.log("密码="+password);
	req.models.users.find({name:na}, function (err, users){
		if(err){
			res.send(JSON.stringify({error:err}));
		}else{
			if(users.length>0){//如果根据name找不到user
				if(users[0].password==password){
					var o={};
						o.name=users[0].name;
						o.priv=users[0].priv;
					res.send(JSON.stringify(o));
				}else{
					res.send("fail");
				}
			}else{
				res.send("No User Found ~~");
			}
		}
		
	});  //End of find

}); //End of login get

app.get("/updateStatus", function(req, res){
	var id=req.param('id');
	var status=req.param('status');
	console.log("id"+id+",status="+status);
	req.models.sms_task.get(id, function(err, task){
		task.status=status;
		task.save(function(err){
			if(err){
				res.send(JSON.stringify({'err':err}));
			}else{
				res.send(task);	
			}
		}); //End of Save
		
	}); //End of Get

}); //End of Update Get Request

app.post("/updateSuggestion", function(req, res){
	var task=req.body.task;
	console.log(task);
	req.models.sms_task.get(task.id, function(err, resTask){
		resTask.audit_suggestion=task.audit_suggestion;

//		var t=Date.parse(task.audit_time).toLocalFormat("%Y-%m-%d %H:%M:%S");
//		console.log(t);
		
		resTask.audit_time=task.audit_time;      
		resTask.save(function(err){
			if(err){console.log(err);
				res.send(JSON.stringify({'err':err}));
			}else{
			console.log(resTask);
				res.send(resTask);	
			}
		}); //End of Save
		
	}); //End of Get

}); //End of Update Get Request

app.get("/getTaskById", function(req, res){
	var id=req.param('id');
	req.models.sms_task.get(id, function(err, task){
		res.send(task);
	}); //End of Get

}); //End of Update Get Request

app.get("/users", function(req, res){
	req.models.users.find({},function(err, users) {
	console.log(users);
		res.send(JSON.stringify(users));
	});//End of get users
});//End of get pages...


app.post("/updateSecret", function(req, res){
	var id=req.body.id;
	var secret=req.body.secret;
	
	console.log(secret);
	
	req.models.users.get(id, function(err, resUser){
		resUser.secret=secret;   
		resUser.save(function(err){
			if(err){console.log(err);
				res.send(JSON.stringify({'err':err}));
			}else{
				console.log(resUser);
				res.send(resUser);	
			}
		}); //End of Save
		
	}); //End of Get

}); //End of Update Get Request