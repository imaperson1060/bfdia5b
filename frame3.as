stop();
var levelsString:String = "";
var levelCount:Number = 53;
var f:Number = 19;
var levels:Array = new Array(levelCount);
var startLocations:Array = new Array(levelCount);
var locations:Array = new Array(6);
var bgs:Array = new Array(levelCount);
var levelStart:Number = 0;
var levelWidth:Number = 0;
var levelHeight:Number = 0;
var thisLevel:Array = new Array(0);
var switchable:Array = new Array(6);
var charCount:Number = 0;
var charCount2:Number = 0;
var playMode:Number = 0;
var lineCount:Number = 0;
var lineLength:Number = 0;
var dialogueChar:Array = new Array(levelCount);
var dialogueText:Array = new Array(levelCount);
var dialogueFace:Array = new Array(levelCount);
var levelName:Array = new Array(levelCount);
var mdao:Array = new Array(levelCount);
var mdao2:Number = 0;
var levelProgress:Number;
var best:Array;
var prev:Array;
var gotCoin:Array;
var gotThisCoin:Boolean = false;
var tileCount:Number = 11;
var bfdia5b:SharedObject = SharedObject.getLocal("bfdia5b");
if(!bfdia5b.data.timerMod) bfdia5b.data.timerMod = { config: {
	levelTimer: [ 4, 3 ],
	levelTimerScale: [ 70, 70 ],
	levelTimerOpacity: 60,
	levelKeys: [ 695, 4 ],
	levelKeysScale: [ 60, 60 ],
	levelKeysOpacity: 45,
	showTimer: true,
	showKeys: true
} };
var deathCount:Number;
var timer:Number;
var coins:Number;
var longMode:Boolean = false;
if(bfdia5b.data.levelProgress == undefined){
	clearVars();
}else{
	levelProgress = bfdia5b.data.levelProgress;
	best = new Array(levelCount);
	prev = new Array(levelCount);
	gotCoin = new Array(levelCount);
	coins = 0;
	for(var i:Number = 0; i < levelCount; i++){
		best[i] = bfdia5b.data.best[i] || bfdia5b.data.timerMod.best[i]; // load from legacy save files
		prev[i] = bfdia5b.data.timerMod.prev[i];
		gotCoin[i] = bfdia5b.data.gotCoin[i];
		if(gotCoin[i]) coins++;
	}
	deathCount = bfdia5b.data.deathCount;
	timer = bfdia5b.data.timer;
}
function clearVars(){
	deathCount = timer = coins = levelProgress = 0;
	best = new Array(levelCount);
	prev = new Array(levelCount);
	gotCoin = new Array(levelCount);
	for(var i:Number = 0; i < levelCount; i++){
		gotCoin[i] = false;
	}
}
function saveGame(){
	delete bfdia5b.data.best;
	bfdia5b.data.timerMod.best = new Array(levelCount);
	bfdia5b.data.timerMod.prev = new Array(levelCount);
	bfdia5b.data.gotCoin = new Array(levelCount);
	for(var i:Number = 0; i < levelCount; i++){
		bfdia5b.data.timerMod.best[i] = best[i];
		bfdia5b.data.timerMod.prev[i] = prev[i];
		bfdia5b.data.gotCoin[i] = gotCoin[i];
	}
	bfdia5b.data.coins = coins;
	bfdia5b.data.levelProgress = levelProgress;
	bfdia5b.data.deathCount = deathCount;
	bfdia5b.data.timer = timer;
	bfdia5b.flush();
}
function charAt(j:Number){
	return levelsString.charCodeAt(j+levelStart)-48;
}
function charAt2(j:Number){
	return levelsString.charAt(j+levelStart);
}
function tileAt(j:Number,i:Number,y:Number){
	var num:Number = levelsString.charCodeAt(j+levelStart);
	if(num == 128) return 93;
	if(num <= 126){
		return num-46;
	}else if(num <= 182){
		return num-80;
	}else{
		return num-81;
	}
}
var lv = new LoadVars();
lv.onLoad = function(success){
	if(success){
		_root.levelsString = this.loadedLevels;
		for(var i:Number = 0; i < levelCount; i++){
			levelStart += 2;
			lineLength = 0;
			levelName[i] = "";
			while(charAt(lineLength) != -35){
				levelName[i] += charAt2(lineLength);
				lineLength++;
			}
			levelStart += lineLength;
			levelWidth = 10*charAt(2)+charAt(3);
			levelHeight = 10*charAt(5)+charAt(6);
			charCount = 10*charAt(8)+charAt(9);
			bgs[i] = 10*charAt(11)+charAt(12);
			longMode = false;
			if(charAt(14) == 24) longMode = true;
			levels[i] = new Array(levelHeight);
			for(var j:Number = 0; j < levelHeight; j++){
				levels[i][j] = new Array(levelWidth);
			}
			if(longMode){
				for(var y:Number = 0; y < levelHeight; y++){
					for(var x:Number = 0; x < levelWidth; x++){
						levels[i][y][x] = 111*tileAt(y*(levelWidth*2+2)+x*2+17,i,y)+tileAt(y*(levelWidth*2+2)+x*2+18,i,y);
					}
				}
				levelStart += levelHeight*(levelWidth*2+2)+17;
			}else{
				for(var y:Number = 0; y < levelHeight; y++){
					for(var x:Number = 0; x < levelWidth; x++){
						levels[i][y][x] = tileAt(y*(levelWidth+2)+x+17,i,y);
					}
				}
				levelStart += levelHeight*(levelWidth+2)+17;
			}
			startLocations[i] = new Array(charCount);
			for(var j:Number = 0; j < charCount; j++){
				startLocations[i][j] = new Array(6);
				for(var k:Number = 0; k < (f-1)/3; k++){
					startLocations[i][j][k] = charAt(k*3)*10+
					charAt(k*3+1);
				}
				levelStart += f-2;
				if(startLocations[i][j][5] == 3 || startLocations[i][j][5] == 4){
					levelStart++;
					startLocations[i][j].push(new Array(0));
					lineLength = 0;
					while(charAt(lineLength) != -35){
						startLocations[i][j][6].push(charAt(lineLength));
						lineLength++;
					}
					levelStart += lineLength;
				}
				levelStart += 2;
			}
			lineCount = 10*charAt(0)+charAt(1);
			levelStart += 4;
			dialogueText[i] = new Array(lineCount);
			dialogueChar[i] = new Array(lineCount);
			dialogueFace[i] = new Array(lineCount);
			for(var j:Number = 0; j < lineCount; j++){
				dialogueChar[i][j] = 10*charAt(0)+charAt(1);
				if(charAt(2) == 24){
					dialogueFace[i][j] = 2;
				}else{
					dialogueFace[i][j] = 3;
				}
				levelStart += 4;
				lineLength = 0;
				dialogueText[i][j] = "";
				while(charAt(lineLength) != -35){
					lineLength++;
					dialogueText[i][j] += charAt2(lineLength-1);
				}
				levelStart += lineLength+2;
			}
			mdao2 += 100000*charAt(0)+10000*charAt(1)+1000*charAt(2)+100*charAt(3)+10*charAt(4)+charAt(5);
			mdao[i] = mdao2;
			levelStart += 8;
		}
		gotoAndStop("game");
	}
}
lv.load("levels.txt");