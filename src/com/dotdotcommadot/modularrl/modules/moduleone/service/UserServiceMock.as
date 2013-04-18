package com.dotdotcommadot.modularrl.modules.moduleone.service
{
	import com.dotdotcommadot.modularrl.modules.moduleone.model.UserModel;
	import com.dotdotcommadot.modularrl.modules.moduleone.model.factories.UserFactory;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class UserServiceMock implements IUserService
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		[Inject] public var userModel : UserModel;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function UserServiceMock()
		{
			
		}
		
		//--------------------------------------------------------------------------
		//
		// Public Methods
		// 
		//--------------------------------------------------------------------------
		
		public function load( maxUsers : int = 1000 ) : void
		{
			var users : ArrayCollection = new ArrayCollection();
			
			for( var i : int; i < maxUsers; i++ )
			{
				users.addItem( UserFactory.create( i, "Bobby " + i ) );
			}
			
			userModel.users = users;
		}
	}
}