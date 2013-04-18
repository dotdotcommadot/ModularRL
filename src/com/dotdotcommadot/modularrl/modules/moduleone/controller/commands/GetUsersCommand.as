package com.dotdotcommadot.modularrl.modules.moduleone.controller.commands
{
	import com.dotdotcommadot.modularrl.modules.moduleone.service.IUserService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class GetUsersCommand extends Command
	{
		[Inject] public var userService : IUserService;
		
		[Inject] public var numberOfUsers : int;
		
		override public function execute() : void
		{
			userService.load( numberOfUsers );
		}
	}
}