package com.dotdotcommadot.modularrl.modules.moduleone.view.main
{
	import com.dotdotcommadot.modularrl.modules.moduleone.controller.signals.GetUsersSignal;
	import com.dotdotcommadot.modularrl.modules.moduleone.model.UserModel;
	
	import flash.events.MouseEvent;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleOneMainViewMediator extends Mediator
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		[Inject] public var view : ModuleOneMainView;
		
		[Inject] public var getUsersSignal : GetUsersSignal;

		[Inject] public var userModel : UserModel;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function ModuleOneMainViewMediator()
		{
		}
		
		//--------------------------------------------------------------------------
		//
		// Initialize
		// 
		//--------------------------------------------------------------------------
		
		override public function initialize():void
		{
			// View
			view.loadUsersButton.addEventListener( MouseEvent.CLICK, onClick_loadUsersButton );
			
			// Model
			userModel.usersChanged.add( onUsersChanged );
		}
		
		//--------------------------------------------------------------------------
		//
		// Private Methods
		// 
		//--------------------------------------------------------------------------
		
		private function onClick_loadUsersButton( event : MouseEvent ) : void
		{
			getUsersSignal.dispatch( view.numberOfUsersStepper.value );
		}
		
		private function onUsersChanged() : void
		{
			view.users = userModel.users;
		}
	}
}