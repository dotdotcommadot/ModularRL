package com.dotdotcommadot.modularrl.modules.moduletwo.view.main
{
	import spark.components.Button;
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class ModuleTwoMainView extends SkinnableContainer
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
		public var logTextInput : TextInput;
		
		[SkinPart( required="true" )]
		public var addLogButton : Button;
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		// 
		//--------------------------------------------------------------------------
		
		public function ModuleTwoMainView()
		{
		}
	}
}