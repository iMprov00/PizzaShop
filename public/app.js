function something()
{
	var x = window.localStorage.getItem('aaa');

	x = x * 1 + 1

	window.localStorage.setItem('aaa', x);

	alert(x);
}

function add_to_cart(id) 
{

	var key = 'product_' + id;

	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	//alert('Вы добавили в корзину ' + cart_get_number_of_items() + ' пицц');

	update_orders_input();
	update_orders_button();

}

function cart_get_number_of_items()
{

	var cnt = 0;

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);

		if(key.indexOf('product_') == 0)
		{
			cnt = cnt + value * 1;
		} 
	}

	return cnt;

}

function cart_get_orders()
{

	var orders = '';

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);

		if(key.indexOf('product_') == 0)
		{
			orders = orders + key + '=' + value + ',';
		} 
	}

	return orders;

}

function update_orders_input() 
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

function update_orders_button()
{
	var text = 'Корзина (' + cart_get_number_of_items() + ')';
	$('#orders_button').val(text);
}

function cancel_order()
{
	window.localStorage.clear();
	update_orders_button();
	update_orders_input();
	$('#cart').text('Ваша корзина пустая...')
	return false;
}