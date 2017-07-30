function p_home() {

	function GetQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}

	function initGoods(data) {
		$('#c_name').html(data.cname);
		$('#c_id').html(data.cid);
		$('#c_price').html(data.cprice);
		$('#c_remain').html(data.cremain);
		if (data.btype != null) {
			$('#btype_content').show();
			$('#c_btname').html(data.btype);
		}
		if (data.stype != null) {
			$('#stype_content').show();
			$('#c_stname').html(data.stype);
		}

	}
	
	var c_id = GetQueryString('id');
	
	$.post("/mall/getGoodsByCid.do", {
		cid : c_id,
	}, function(data, status) {

		if (status) {
			initGoods(data);			
		}
	});

}
$(document).ready(p_home);
