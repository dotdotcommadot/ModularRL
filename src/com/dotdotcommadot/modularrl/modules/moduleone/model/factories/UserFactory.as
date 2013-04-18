package com.dotdotcommadot.modularrl.modules.moduleone.model.factories
{
	import com.dotdotcommadot.modularrl.modules.moduleone.model.vo.User;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class UserFactory
	{
		public static function create( id : int, name : String ) : User
		{
			var user : User = new User();
			user.id = id;
			user.name = name;
			
			return user;
		}
	}
}