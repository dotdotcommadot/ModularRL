package com.dotdotcommadot.modularrl.modules.logmodule.view.main
{
	import spark.components.SkinnableContainer;
	import spark.components.TextArea;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class LogModuleMainView extends SkinnableContainer
	{
		//--------------------------------------------------------------------------
		//
		// Public Methods
		// 
		//--------------------------------------------------------------------------
		
		//-----------------------------------
		// SkinParts
		//-----------------------------------
		
		[SkinPart( required="true" )]
		public var logTextArea : TextArea;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function LogModuleMainView()
		{
		}
	}
}