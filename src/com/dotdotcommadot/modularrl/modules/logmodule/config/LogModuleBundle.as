package com.dotdotcommadot.modularrl.modules.logmodule.config
{
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.commandCenter.CommandCenterExtension;
	import robotlegs.bender.extensions.contextView.ContextViewExtension;
	import robotlegs.bender.extensions.contextView.ContextViewListenerConfig;
	import robotlegs.bender.extensions.enhancedLogging.InjectableLoggerExtension;
	import robotlegs.bender.extensions.enhancedLogging.TraceLoggingExtension;
	import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
	import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;
	import robotlegs.bender.extensions.localEventMap.LocalEventMapExtension;
	import robotlegs.bender.extensions.mediatorMap.MediatorMapExtension;
	import robotlegs.bender.extensions.modularity.ModularityExtension;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.extensions.stageSync.StageSyncExtension;
	import robotlegs.bender.extensions.viewManager.ManualStageObserverExtension;
	import robotlegs.bender.extensions.viewManager.StageCrawlerExtension;
	import robotlegs.bender.extensions.viewManager.StageObserverExtension;
	import robotlegs.bender.extensions.viewManager.ViewManagerExtension;
	import robotlegs.bender.extensions.vigilance.VigilanceExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.LogLevel;
	
	/**
	 * @author Hans Van den Keybus
	 * @copyright (c) 2013, dotdotcommadot
	 */
	public class LogModuleBundle extends MVCSBundle
	{
		override public function extend(context:IContext):void
		{
			context.logLevel = LogLevel.DEBUG;
			
			context.install(
				TraceLoggingExtension,
				VigilanceExtension,
				InjectableLoggerExtension,
				ContextViewExtension,
				EventDispatcherExtension,
				ModularityExtension,
				CommandCenterExtension,
				EventCommandMapExtension,
				LocalEventMapExtension,
				ViewManagerExtension,
				StageObserverExtension,
				ManualStageObserverExtension,
				MediatorMapExtension,
				StageCrawlerExtension,
				StageSyncExtension,
				SignalCommandMapExtension);
			
			context.configure(ContextViewListenerConfig);
		}
	}
}