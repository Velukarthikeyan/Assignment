var ractive=new Ractive({el:"#container",template:"#template",
data:{initialvalues:[{value:0},{value:0},{value:0}],
amounts:[-10,-25,10,25],bars:["Bar-1","Bar-2","Bar-3"]},


calculate:function(a)
{var b=this.get("selectedvalue");

if(null!=b){
	var c="initialvalues["+b+"].value",
	d=Math.max(0,this.get(c));
d>0&&0>a&&0>d+a?this.add(c,~d+1):0==d&&0>a?this.add(c,0):this.add(c,a)
}}
});