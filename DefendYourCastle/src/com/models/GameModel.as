package com.models
{
	
	import com.states.PlayState;
	
	import org.osflash.signals.Signal;
	
	import starling.animation.Juggler;
	import starling.events.EventDispatcher;
	
	public class GameModel extends EventDispatcher
	{
		
		public static var score:int = 0;
		public static var money:int = 0;
		public static var guysOut:int = 0;
		public static var guysToSendThisLevel:int = 0;
		public static var guysSentThisLevel:int = 0;
		public static var guysKilledThisLevel:int = 0;
		private static var _castleHealth:int = CASTLE_MAX_HEALTH;
		public static var CASTLE_MAX_HEALTH:int = 1000;
		public static var HEIGHT_TO_KILL:int = 400;
		public static var stageHeight:int = 640;
		private static var _kills:int = 0;
		public static var gameOverSig:Signal = new Signal();
		
		private static var _rungeMoverAry:Array = [];
		private static var _guysMovingAry:Array = [];
		
		public static var gameJuggler:Juggler = new Juggler;
		private static var instance:GameModel;
		private static var allowInstantiation:Boolean;
		private static var _levelChosen:int;
		private static var _mana:int = 200;
		private static var _secondsLeft:int = 100;
		private static var _levelTimeUpSig:Signal = new Signal();
		
		
		
		
		
		public static function get levelTimeUpSig():Signal
		{
			return _levelTimeUpSig;
		}

		public static function set levelTimeUpSig(value:Signal):void
		{
			_levelTimeUpSig = value;
		}

		public static function get secondsLeft():int
		{
			return _secondsLeft;
		}

		public static function set secondsLeft(value:int):void
		{
			_secondsLeft = value;
			if (_secondsLeft >= 0)
			{
				PlayState._timeTF.text = "TIME: " + value;
				
			}
			
			if (_secondsLeft == 0)
			{
				levelTimeUpSig.dispatch();
			}
		}

		public static function get mana():int
		{
			return _mana;
		}

		public static function set mana(value:int):void
		{
			_mana = value;
			
			
			PlayState._manaTF.text = "MANA: " + _mana;
			
			
		}

		public static function get levelChosen():int
		{
			return _levelChosen;
		}

		public static function set levelChosen(value:int):void
		{
			_levelChosen = value;
		}

		public static function get kills():int
		{
			return _kills;
		}

		public static function set kills(value:int):void
		{
			_kills = value;
			
			PlayState._killsTF.text = "SCORE: " + _kills;
		}

		public static function getInstance():GameModel {
			if (instance == null) {
				allowInstantiation = true;
				
				instance = new GameModel();
				
				allowInstantiation = false;
			}
			return instance;
		}
		
		public function GameModel()
		{
			if (!allowInstantiation) 
			{
				throw new Error("Error: Instantiation failed: Use SharedObjectManager.getInstance() instead of new.");
			}
			else
			{
				init();
			}
		}
		
		private function init():void
		{
			// TODO Auto Generated method stub
			
		}		
		
		public static function get guysMovingAry():Array
		{
			return _guysMovingAry;
		}

		public static function set guysMovingAry(value:Array):void
		{
			_guysMovingAry = value;
			
			trace("guysMovingAry size: " + value);
		}

		public static function get rungeMoverAry():Array
		{
			return _rungeMoverAry;
		}

		public static function set rungeMoverAry(value:Array):void
		{
			_rungeMoverAry = value;
		}

		public static function get castleHealth():int
		{
			return _castleHealth;
		}

		public static function set castleHealth(value:int):void
		{
			_castleHealth = value;
//			
//			trace ("_castleHealth " + _castleHealth);
			if (_castleHealth >= 0)
			{
				PlayState._healthTF.text = "HEALTH: " + value;
				
			}
			
			if (_castleHealth <= 0)
			{
				gameOverSig.dispatch();
			}
		}

	}
}