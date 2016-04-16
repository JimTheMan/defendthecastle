package com.states
{
	import com.assets.Assets;
	import com.views.DcMainView;
	
	import feathers.controls.Button;
	import feathers.text.BitmapFontTextFormat;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class SetPowerupState extends Sprite implements IDCState
	{
		
		private var _mainView:DcMainView;
		private var _model:Object;
		private var _setPowerupSprite:Sprite;
		private var _setPowerupPopup:Image;
		
		public function SetPowerupState(mainView:DcMainView, model:Object)
		{
			_mainView = mainView;
			_model = model
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			trace("da main been added, sir");
			buildScreen();
		}
		
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			_setPowerupSprite.removeFromParent(true);
			
		}
		
		private function buildScreen():void
		{
			
			_setPowerupSprite = new Sprite;
			this.addChild(_setPowerupSprite);
			
			_setPowerupPopup = new Image(Assets.genericPopup);
			_setPowerupSprite.addChild(_setPowerupPopup);
			
			var titleTF:TextField = new TextField(450, 200, "SET POWERUPS" , "BasicWhiteFont", 50, 0xFFFFFF);
			titleTF.hAlign = "center";
			titleTF.x = 200;
			titleTF.y = -40;
			_setPowerupSprite.addChild(titleTF);
			
			var nextBtn:Button = new Button();
			nextBtn.defaultSkin = new Image(Assets.greenBtnT);
			nextBtn.label = "Next";
			nextBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			nextBtn.x = 120
			nextBtn.y = 208
			nextBtn.labelOffsetX = - 10; 
			//			startBtn.name = jsonArray.staff[i].RestId
			_setPowerupSprite.addChild(nextBtn);
			nextBtn.addEventListener(starling.events.Event.TRIGGERED, onNextBtnClicked)
			
			var quitBtn:Button = new Button();
			quitBtn.defaultSkin = new Image(Assets.greenBtnT);
			quitBtn.label = "Quit";
			quitBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			quitBtn.x = 220
			quitBtn.y = 208
			quitBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_setPowerupSprite.addChild(quitBtn);
			quitBtn.addEventListener(starling.events.Event.TRIGGERED, onQuitBtnClicked)
			
			
			
		}
		
		private function onQuitBtnClicked():void
		{
			_mainView.changeState(DcMainView.SHOP_STATE);
			
		}
		
		private function onNextBtnClicked():void
		{
			_mainView.changeState(DcMainView.LEVEL_SELECT_STATE);
			
		}		
		
	}
}