package com.dotdotcommadot.modularrl.modules.logmodule.view.main
{
	import com.dotdotcommadot.modularrl.shared.model.LogModel;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class LogModuleMainViewMediator extends Mediator
	{
		//--------------------------------------------------------------------------
		//
		// Public Properties
		// 
		//--------------------------------------------------------------------------
		
		[Inject] public var view : LogModuleMainView;

		[Inject] public var logModel : LogModel;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function LogModuleMainViewMediator()
		{
			trace( "jo") 
		}
		
		//--------------------------------------------------------------------------
		//
		// Initialize
		// 
		//--------------------------------------------------------------------------
		
		override public function initialize() : void
		{
			// Model
			logModel.logChanged.add( onLogChanged );
		}
		
		//--------------------------------------------------------------------------
		//
		// Private Methods
		// 
		//--------------------------------------------------------------------------
		
		private function onLogChanged() : void
		{
			view.logTextArea.text = logModel.log;
		}
	}
}