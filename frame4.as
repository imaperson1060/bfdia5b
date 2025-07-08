//solid-Up, solid-Down, solid-Left, solid-Right, deadly-Up, deadly-Down, deadly-Left, deadly-Right,
//active, large (can't be filled in level editor),shadable BG Tile, lever/buttonID, switchable,
//make good borders, is a liquid
var musicSound:Sound = new Sound();
musicSound.attachSound("music");
musicSound.start(0, 12345);

var blockProperties:Array = [
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false], // 0
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[true,true,true,true,true,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,true,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,true,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,true,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,true,true,false,0,0,false,false],
[false,false,false,false,false,false,false,false,true,true,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,6,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,6,false,false],
[true,true,true,true,true,true,true,true,false,false,false,0,0,false,false],
[false,true,false,false,false,false,false,false,false,true,false,0,0,false,false],
[true,true,true,true,true,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,true,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,true,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,true,false,false,false,0,0,false,false],
[true,true,true,true,true,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,1,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,1,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,1,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,1,false,false],
[false,false,false,false,false,false,false,false,true,false,false,1,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,7,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,2,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,8,0,false,false],
[false,true,false,false,false,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,13,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,14,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,false,false],
[false,false,true,false,false,false,false,false,false,true,false,0,0,false,false],
[true,true,true,true,false,true,false,true,false,false,false,0,0,false,false],
[true,true,true,true,false,true,true,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,2,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,2,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,2,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,2,false,false],
[false,true,false,false,false,false,false,false,false,true,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,3,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,9,0,false,false],
[false,false,false,false,false,false,false,false,true,true,false,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,3,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,3,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,3,false,false],
[false,true,false,false,false,false,false,false,true,false,false,0,3,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,3,false,false],
[true,true,true,true,false,false,false,false,true,false,false,0,3,false,false],
[false,false,false,false,false,false,false,false,true,true,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,true,false,false,false,false,false,false,false,0,0,false,false],
[true,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,true,false,false,false,false,false,false,true,0,0,false,false],
[true,true,true,true,false,false,false,false,true,false,false,15,0,false,false],
[true,true,true,true,true,true,true,true,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[true,true,true,true,false,false,false,false,true,false,false,0,0,false,false],
[false,false,false,false,true,true,true,true,true,false,false,0,0,false,false],
[false,false,false,false,true,true,true,true,true,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,1,false,false],
[true,true,true,true,true,true,true,true,true,false,false,0,1,false,false],
[false,false,false,false,false,false,false,false,true,true,false,0,0,false,false],
[false,true,false,false,false,false,false,false,true,false,false,0,1,false,false],
[false,false,false,false,false,false,false,false,true,false,false,0,1,false,false],
[false,true,false,false,false,false,false,false,true,false,false,0,6,false,false],
[false,true,false,false,false,false,false,false,true,false,false,0,6,false,false],
[false,true,false,false,false,false,false,false,true,false,false,0,6,false,false],
[false,true,false,false,false,false,false,false,true,false,false,0,6,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,true,true,true,true,false,false,false,0,1,false,true],
[false,false,false,false,false,false,false,false,true,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,true,true,true,true,false,false,false,0,1,false,true],
[false,false,false,false,false,false,false,false,true,false,false,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,false,false,false,false,true,false,false,6,0,false,false],
[false,false,false,false,false,false,false,false,true,false,false,12,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false],
[false,false,false,false,false,false,false,false,false,false,false,0,1,false,true],
[true,true,true,true,false,false,false,false,false,false,false,0,0,true,false],
[false,false,false,false,false,false,false,false,false,false,true,0,0,false,false]
];
var switches:Array = [[31,33,32,34,79,78,81,82],[51,53,52,54],[65,61,60,62,63,64],[],[],[14,16,83,85]];
var charD:Array = [  //width/2, height, weight, carry-height, fric, can be cached, heat speed
[28,45.4,0.45,27,0.8,false,1],
[23,56,0.36,31,0.8,false,1.7],
[20,51,0.41,20,0.85,false,5],
[10,86,0.26,31,0.8,false,1.6],
[10,84,0.23,31,0.8,false,1.4],
[28,70,0.075,28,0.8,false,9],
[26,49,0.2,20,0.75,false,0.6],
[44,65,0.8,20,0.75,false,0.8],
[16,56,0.25,17,0.76,false,0.8],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[0,0,0,0,0,false],
[36.5,72.8,1,20,0.6,false,0],
[15.1,72.8,0.6,20,0.7,true,0],
[20,40,0.15,20,0.7,true,0.7],
[25,50,0.64,20,0.6,true,0.1],
[25,10,1,0,0.7,true,0.2],
[25,50,1,20,0.7,true,0.1],
[25,29,0.1,20,0.8,true,1],
[21.5,43,0.3,20,0.6,true,0.5],
[35,60,1,20,0.7,true,0.1],
[22.5,45,1,20,0.7,true,0.8],
[25,50,1,0,0.7,true,0.1],
[15,30,0.64,20,0.6,true,0.2],
[10,55,0.8,0,0.3,true,0.4],
[45,10,1,0,0.7,true,0.2],
[20,40,1,0,0.8,false,0.8],
[16,45,0.4,20,0.94,false,1.1],
[25,10,1,0,0.7,true,0.3],
[45,10,0.4,0,0.7,true,0.7],
[15,50,0.1,0,0.8,true,1.9],
[25,25,0.1,0,0.8,true,1.7],
[30,540,10,10,0.4,true,0]];
var names:Array = ["Ruby","Book","Ice Cube","Match","Pencil","Bubble"];
function resetLevel(){
	charCount = startLocations[currentLevel].length;
	levelWidth = levels[currentLevel][0].length;
	levelHeight = levels[currentLevel].length;
	copyLevel(levels[currentLevel]);
	charDepth = levelWidth*levelHeight+charCount*2;
	charCount2 = 0;
	HPRC1 = HPRC2 = 1000000;
	for(var i:Number = 0; i < charCount; i++){
		var id:Number = startLocations[currentLevel][i][0];
		char[i] = new Character(id,startLocations[currentLevel][i][1]*30+startLocations[currentLevel][i][2]*30/100,
		startLocations[currentLevel][i][3]*30+startLocations[currentLevel][i][4]*30/100,70+i*40,400-i*30,0,0,false,4,false,0,200,200,30,
		startLocations[currentLevel][i][5],-1,new Array(0),charD[id][0],charD[id][1],charD[id][2],charD[id][2],
		charD[id][3],false,charD[id][4],0,2,0,new Array(0),0,0,0,0,charD[id][6]);
		if(id <= 5) charCount2++;
		if(id == 36) HPRC1 = i;
		if(id == 35) HPRC2 = i;
		if(char[i].charState == 3 || char[i].charState == 4) char[i].speed = startLocations[currentLevel][i][6][0]*10+startLocations[currentLevel][i][6][1];
	}
	drawLevel();
	drawCharacters();
	recover = false;
	cornerHangTimer = 0;
	charsAtEnd = 0;
	control = 0;
	cutScene = 0;
	white._visible = true;
	bgXScale = ((levelWidth-32)*10+960)/9.6;
	bgYScale = ((levelHeight-18)*10+540)/5.4;
	bg._xscale = Math.max(bgXScale, bgYScale);
	bg._yscale = Math.max(bgXScale, bgYScale);
	bg.gotoAndStop(bgs[currentLevel]+1);
	levelShadow.cacheAsBitmap = true;
	levelStill.cacheAsBitmap = true;
	bg.cacheAsBitmap = true;
	cameraX = Math.min(Math.max(char[0].x-480,0),levelWidth*30-960);
	cameraY = Math.min(Math.max(char[0].y-270,0),levelHeight*30-540);
	levelButtons.textie.text = numberToText(currentLevel+1,true)+". "+levelName[currentLevel];
	gotThisCoin = false;
	levelTimer = 0;
	levelTimer2 = 1000 / 60; // need to start at the first frame because wipeTimer == 30 blocks the timer from running
	if(char[0].charState <= 9) changeControl();
}
function copyLevel(thatLevel:Array){
	thisLevel = new Array(thatLevel.length);
	for(var y:Number = 0; y < levelHeight; y++){
		thisLevel[y] = new Array(thatLevel[y].length);
		for(var x:Number = 0; x < levelWidth; x++){
			thisLevel[y][x] = thatLevel[y][x];
		}
	}
}
function numberToText(i:Number, hundreds:Boolean){
	if(hundreds){
		if(i < 10){
			return "00"+i;
		}else if(i < 100){
			return "0"+i;
		}else{
			return i;
		}
	}else{
		if(i == 0){
			return "00";
		}else if(i < 10){
			return "0"+i;
		}else{
			return i;
		}
	}
}
function toHMS(i:Number){
	var h:Number = Math.floor(i/3600000);
	var m:Number = Math.floor(i/60000)%60;
	var s:Number = Math.floor(i/1000)%60;
	var ds:Number = Math.floor(i/100)%10;
	return numberToText(h,false)+":"+numberToText(m,false)+":"+numberToText(s,false)+"."+ds;
}
function toHMS2(i:Number){
	var h:Number = Math.floor(i/3600000);
	var m:Number = Math.floor(i/60000)%60;
	var s:Number = Math.floor(i/1000)%60;
	var ds:Number = Math.round(i%1000);
	return numberToText(h*60+m,false)+":"+numberToText(s,false)+"."+numberToText(ds,true);
}
function drawLevel(){
	if(playMode == 0 && currentLevel >= 1){
		removeTileMovieClips();
		addTileMovieClips();
	}
	for(var i:Number = 0; i < 6; i++){
		switchable[i] = new Array(0);
	}
	for(var y:Number = 0; y < levelHeight; y++){
		for(var x:Number = 0; x < levelWidth; x++){
			if(thisLevel[y][x] >= 1){
				if(blockProperties[thisLevel[y][x]][12] >= 1){
					switchable[blockProperties[thisLevel[y][x]][12]-1].push([x,y]);
				}
				if(blockProperties[thisLevel[y][x]][14]){
					addTileMovieClip(x,y,levelActive3);
				}else if(blockProperties[thisLevel[y][x]][11] >= 1){
					addTileMovieClip(x,y,levelActive2);
					if(blockProperties[thisLevel[y][x]][11] >= 7 && blockProperties[thisLevel[y][x]][11] <= 12){
						levelActive2["tileX"+x+"Y"+y].lever._rotation = 60;
					}
				}else if(blockProperties[thisLevel[y][x]][8]){
					addTileMovieClip(x,y,levelActive);
				}else{
					addTileMovieClip(x,y,levelStill);
				}
				if(thisLevel[y][x] == 6){
					locations[0] = x;
					locations[1] = y;
					if(bgs[currentLevel] == 9 || bgs[currentLevel] == 10) levelActive["tileX"+x+"Y"+y].bg.gotoAndStop(2);
				}
				if(thisLevel[y][x] == 12){
					locations[2] = x;
					locations[3] = y;
					locations[4] = 1000;
					locations[5] = 0;
				}
			}
		}
	}
}
function addTileMovieClip(x:Number, y:Number, level:MovieClip){
	var t:Number = thisLevel[y][x];
	level.attachMovie("tile"+Math.floor(t/10),"tileX"+x+"Y"+y,y*levelWidth+x,{_x:x*30,_y:y*30});
	level["tileX"+x+"Y"+y].gotoAndStop(t%10+1);
	if(t == 6){
		level["tileX"+x+"Y"+y].light.gotoAndStop(charCount2);
		for(var x2:Number = 0; x2 < 2; x2++){
			for(var y2:Number = 0; y2 < 4; y2++){
				setAmbientShadow(x-x2,y-y2);
			}
		}
	}else if(t >= 110 && t <= 129){
		for(var x2:Number = 0; x2 < 3; x2++){
			for(var y2:Number = 0; y2 < 2; y2++){
				setAmbientShadow(x-x2,y-y2);
			}
		}
	}else if(blockProperties[thisLevel[y][x]][10]){
		setAmbientShadow(x,y);
	}
	if(blockProperties[thisLevel[y][x]][13]){
		setBorder(x,y,levelStill["tileX"+x+"Y"+y].tileBorder,t);
	}
}
function setAmbientShadow(x:Number,y:Number){
	levelShadow.attachMovie("tileShadow","tileX"+x+"Y"+y,y*levelWidth+x,{_x:x*30,_y:y*30});
	var count:Number = 0;
	for(var i:Number = 0; i < 4; i++){
		var t:Number = blockProperties[thisLevel[y+cardinal[i][1]][x+cardinal[i][0]]][12];
		if(blockProperties[thisLevel[y+cardinal[i][1]][x+cardinal[i][0]]][i] &&  (t == 0 || t == 6)){
			count += Math.pow(2,3-i);
		}
	}
	levelShadow["tileX"+x+"Y"+y].ambientShadow.gotoAndStop(count+1);
	for(var i:Number = 0; i < 4; i++){
		if(!blockProperties[thisLevel[y][x+diagonal[i][0]]][opposite(i,0)] &&
		!blockProperties[thisLevel[y+diagonal[i][1]][x]][opposite(i,1)] &&
		blockProperties[thisLevel[y+diagonal[i][1]][x+diagonal[i][0]]][opposite(i,0)] &&
		blockProperties[thisLevel[y+diagonal[i][1]][x+diagonal[i][0]]][12] == 0 && 
		blockProperties[thisLevel[y+diagonal[i][1]][x+diagonal[i][0]]][opposite(i,1)] && 
		blockProperties[thisLevel[y+diagonal[i][1]][x+diagonal[i][0]]][12] == 0){
			levelShadow["tileX"+x+"Y"+y].ambientShadow2["a"+i].gotoAndStop(2);
		}else{
			levelShadow["tileX"+x+"Y"+y].ambientShadow2["a"+i].gotoAndStop(1);
		}
	}
}
function setBorder(x:Number,y:Number,tile:MovieClip,s:Number){
	var count:Number = 0;
	for(var i:Number = 0; i < 4; i++){
		if(thisLevel[y+cardinal[i][1]][x+cardinal[i][0]] != s && !outOfRange(x+cardinal[i][0],y+cardinal[i][1])){
			count += Math.pow(2,3-i);
		}
	}
	tile.ambientShadow.gotoAndStop(count+1);
	for(var i:Number = 0; i < 4; i++){
		if(thisLevel[y][x+diagonal[i][0]] == s && 
		thisLevel[y+diagonal[i][1]][x] == s &&
		thisLevel[y+diagonal[i][1]][x+diagonal[i][0]] != s){
			tile.ambientShadow2["a"+i].gotoAndStop(2);
		}else{
			tile.ambientShadow2["a"+i].gotoAndStop(1);
		}
	}
}
function outOfRange(x:Number, y:Number){
	return (x<0||y<0||x>=levelWidth||y>=levelHeight);
}
function opposite(i:Number,xOrY:Number){
	if(xOrY == 0){
		return 3.5-Math.abs(i-1.5);
	}else if(xOrY == 1){
		return Math.floor(i/2);
	}
}
function drawCharacters(){
	if(playMode == 0 && currentLevel >= 1){
		for(var i:Number = 0; i < startLocations[currentLevel-transitionType].length; i++){
			levelChar["char"+i].removeMovieClip();
		}
	}else{
		for(var i:Number = 0; i < startLocations[currentLevel].length; i++){
			levelChar["char"+i].removeMovieClip();
		}
	}
	for(var i:Number = 0; i < charCount; i++){
		levelChar.attachMovie("char","char"+i,charDepth-i*2,{_x:char[i].x,_y:char[i].y});
		levelChar["char"+i].gotoAndStop(char[i].id+1);
		levelChar["char"+i].leg1.gotoAndStop(1);
		levelChar["char"+i].leg2.gotoAndStop(1);
		if(char[i].charState <= 1) levelChar["char"+i]._visible = false;
		if(charD[id][5]) levelChar["char"+i].cacheAsBitmap = true;
		if(char[i].charState == 9){
			char[i].dire = 2;
			levelChar["char"+i].charBody.gotoAndStop(2);
			levelChar["char"+i].charBody.mouth.gotoAndStop(3);
			levelChar["char"+i].charBody.mouth.mouth.gotoAndStop(57);
		}
		if(i == HPRC2) HPRCBubble.attachMovie("charImage","charImage",0,{_x:char[i].x,_y:char[i].y,_xscale:143,_yscale:143});
	}
}
function startCutScene(){
	if(cutScene == 0){
		if(toSeeCS){
			cutScene = 1;
			cutSceneLine = 0;
			displayLine(currentLevel,cutSceneLine);
			char[control].dire = Math.ceil(char[control].dire/2)*2;
		}else{
			rescue();
			for(var i:Number = 0; i < dialogueChar[currentLevel].length; i++){
				var p:Number = dialogueChar[currentLevel][i];
				if(p >= 50 && p < 60){
					leverSwitch(p-50);
				}
			}
			cutScene = 3;
		}
	}
}
function endCutScene(){
	toSeeCS = false;
	cutScene = 2;
	rescue();
	csBubble.gotoAndPlay(17);
}
function rescue(){
	for(var i:Number = 0; i < charCount; i++){
		if(char[i].charState == 9){
			char[i].charState = 10;
			levelChar["char"+i].charBody.mouth.gotoAndStop(1);
		}
	}
}
function displayLine(level:Number, line:Number){
	var p:Number = dialogueChar[level][line];
	if(p >= 50 && p < 60){
		leverSwitch(p-50);
		cutSceneLine++;
		line++;
		p = dialogueChar[level][line];
	}
	var x:Number;
	if(p == 99){
		x = 480;
	}else{
		x = Math.min(Math.max(char[p].x,bubWidth/2+bubMargin),960-bubWidth/2-bubMargin);
		putDown(p);
	}
	_root.csBubble.gotoAndPlay(2);
	_root.csBubble._x = x;
	if(char[control].y-cameraY > 270){
		_root.csBubble._y = bubMargin+bubHeight/2;
	}else{
		_root.csBubble._y = 520-bubMargin-bubHeight/2;
	}
	if(p == 99){
		_root.csBubble.csBubble2.gotoAndStop(2);
	}else{
		_root.csBubble.csBubble2.gotoAndStop(1);
		_root.csBubble.csBubble2.box.charBody.gotoAndStop(char[p].id+1);
		_root.levelChar["char"+p].charBody.gotoAndStop(Math.ceil(char[p].dire/2)*2);
		_root.levelChar["char"+p].charBody.mouth.gotoAndStop(1);
		_root.levelChar["char"+p].charBody.mouth.gotoAndStop(dialogueFace[level][line]);
	}
	_root.csBubble.csBubble2.textie.text = dialogueText[level][line];
}
function leverSwitch(j:Number){
	for(var z:Number = 0; z < switchable[j].length; z++){
		var x:Number = switchable[Math.min(j,5)][z][0];
		var y:Number = switchable[Math.min(j,5)][z][1];
		for(var k:Number = 0; k < switches[j].length; k++){
			if(thisLevel[y][x] == switches[j][k*2]){
				thisLevel[y][x] = switches[j][k*2+1];
				levelActive["tileX"+x+"Y"+y].gotoAndStop(switches[j][k*2+1]%10+1);
			}else if(thisLevel[y][x] == switches[j][k*2+1]){
				thisLevel[y][x] = switches[j][k*2];
				levelActive["tileX"+x+"Y"+y].gotoAndStop(switches[j][k*2]%10+1);
			}
		}
	}
	for(var i:Number = 0; i < charCount; i++){
		char[i].justChanged = 2;
		checkDeath(i);
	}
}
function solidAt(x:Number,y:Number){
	var t:Number = getBlockTypeAt(x,y);
	return (blockProperties[t][0] && blockProperties[t][1] &&
	blockProperties[t][2] && blockProperties[t][3]);
}
function solidCeiling(x:Number,y:Number){
	return blockProperties[getBlockTypeAt(x,y)][0];
}
function safeToStandAt(x:Number,y:Number){
	var t:Number = getBlockTypeAt(x,y);
	return (blockProperties[t][1] && !blockProperties[t][5] && t != 14 && t != 16 && t != 83 && t != 85);
}
function getBlockTypeAt(x:Number,y:Number){
	return thisLevel[Math.floor(y/30)][Math.floor(x/30)];
}
function verticalProp(i:Number, sign:Number, prop:Number, x:Number, y:Number){
	var includeHeight:Number = -0.5*sign+0.5;
	var yTile = Math.floor((y-char[i].h*includeHeight)/30);
	if(prop <= 3 && sign == -1 && yTile == -1) return true;
	if(prop >= 4 && prop <= 7){
		for(var j:Number = Math.floor((x-char[i].w)/30); j <= Math.floor((x+char[i].w-0.01)/30); j++){
			if(blockProperties[thisLevel[yTile][j]][prop-4] &&
			!blockProperties[thisLevel[yTile][j]][prop]){
				return false;
			}
		}
	}
	for(var j:Number = Math.floor((x-char[i].w)/30); j <= Math.floor((x+char[i].w-0.01)/30); j++){
		if(blockProperties[thisLevel[yTile][j]][prop]){
			if(prop != 1 || !ifCarried(i) || allSolid(thisLevel[yTile][j])){
				return true;
			}
		}
	}
	return false;
}
function horizontalProp(i:Number, sign:Number, prop:Number, x:Number, y:Number){
	var xTile = Math.floor((x+char[i].w*sign)/30);
	if(prop <= 3 && ((sign == -1 && xTile <= -1) || (sign == 1 && xTile >= levelWidth))) return true;
	if(prop >= 4 && prop <= 7){
		for(var j:Number = Math.floor((y-char[i].h)/30); j <= Math.floor((y-0.01)/30); j++){
			if(blockProperties[thisLevel[j][xTile]][prop-4] &&
			!blockProperties[thisLevel[j][xTile-sign]][prop-4] &&
			!blockProperties[thisLevel[j][xTile]][prop]) return false;
		}
	}
	for(var j:Number = Math.floor((y-char[i].h)/30); j <= Math.floor((y-0.01)/30); j++){
		if(blockProperties[thisLevel[j][xTile]][prop]) return true;
	}
	return false;
}
function verticalType(i:Number, sign:Number, prop:Number, pist:Boolean){
	var includeHeight:Number = -0.5*sign+0.5;
	var yTile = Math.floor((char[i].y-char[i].h*includeHeight)/30);
	var toReturn:Boolean = false;
	for(var j:Number = Math.floor((char[i].x-char[i].w)/30); j <= Math.floor((char[i].x+char[i].w-0.01)/30); j++){
		if(thisLevel[yTile][j] == prop){
			if(pist) levelActive["tileX"+j+"Y"+yTile].piston.gotoAndPlay(2);
			toReturn = true;
		}
	}
	return toReturn;
}
function horizontalType(i:Number, sign:Number, prop:Number){
	var xTile = Math.floor((char[i].x+char[i].w*sign)/30);
	for(var j:Number = Math.floor((char[i].y-char[i].h)/30); j <= Math.floor((char[i].y-0.01)/30); j++){
		if(thisLevel[j][xTile] == prop){
			return true;
		}
	}
	return false;
}
function checkButton(i:Number){
	if(char[i].onob){
		var yTile:Number = Math.ceil(char[i].y/30);
		if(yTile >= 0 && yTile <= levelHeight-1){
			var num:Number;
			for(var j:Number = Math.floor((char[i].x-char[i].w)/30); j <= Math.floor((char[i].x+char[i].w)/30); j++){
				num = blockProperties[thisLevel[yTile][j]][11];
				if(num >= 13){
					if(levelActive2["tileX"+j+"Y"+yTile].button._currentframe != 2){
						leverSwitch(num-13);
						levelActive2["tileX"+j+"Y"+yTile].button.gotoAndStop(2);
					}
					var okay:Boolean = true;
					for(var k:Number = 0; k < char[i].buttonsPressed.length; k++){
						if(char[i].buttonsPressed[k][0] == j && char[i].buttonsPressed[k][1] == yTile) okay = false;
					}
					if(okay) char[i].buttonsPressed.push([j,yTile]);
					break;
				}
			}
		}
	}
}
function checkButton2(i:Number,bypass:Boolean){
	if(char[i].y < levelHeight*30+30){
		var len:Number = char[i].buttonsPressed.length;
		for(var j:Number = 0; j < len; j++){
			var x:Number = char[i].buttonsPressed[j][0];
			var y:Number = char[i].buttonsPressed[j][1];
			if(!char[i].onob || char[i].standingOn >= 0 || 
			char[i].x < x*30-char[i].w || char[i].x >= x*30+30+char[i].w || bypass){
				var okay:Boolean = true;
				for(var k:Number = 0; k < charCount; k++){
					if(k != i){
						for(var m:Number = 0; m < char[k].buttonsPressed.length; m++){
							if(char[k].buttonsPressed[m][0] == x && char[k].buttonsPressed[m][1] == y) okay = false;
						}
					}
				}
				if(okay){
					leverSwitch(blockProperties[thisLevel[y][x]][11]-13);
					levelActive2["tileX"+x+"Y"+y].button.gotoAndPlay(3);
				}
				for(var k:Number = 0; k < len; k++){
					if(k > j){
						char[i].buttonsPressed[k][0] = char[i].buttonsPressed[k-1][0];
						char[i].buttonsPressed[k][1] = char[i].buttonsPressed[k-1][1];
					}
				}
				char[i].buttonsPressed.pop();
			}
		}
	}
}
function checkDeath(i:Number){
	for(var y:Number = Math.floor((char[i].y-char[i].h)/30); y <= Math.floor((char[i].y-0.01)/30); y++){
		for(var x:Number = Math.floor((char[i].x-char[i].w)/30); x <= Math.floor((char[i].x+char[i].w)/30); x++){
			if(blockProperties[thisLevel[y][x]][4] || blockProperties[thisLevel[y][x]][5]
			|| blockProperties[thisLevel[y][x]][6] || blockProperties[thisLevel[y][x]][7]) startDeath(i);
		}
	}
}
function centered(i:Number, len:Number){
	if(i%2 == 0){
		return (len-i-2+len%2)/2;
	}else{
		return (i+len-1+len%2)/2;
	}
}
function onlyConveyorsUnder(i:Number){
	var yTile:Number = Math.floor(char[i].y/30+0.5);
	var min:Number = Math.floor((char[i].x-char[i].w)/30);
	var max:Number = Math.floor((char[i].x+char[i].w-0.01)/30);
	var todo:Number = 0;
	for(var j:Number = 0; j <= max-min; j++){
		var j2:Number = centered(j,1+max-min)+min;
		var t:Number = thisLevel[yTile][j2];
		if(blockProperties[t][1]){
			if(t == 14 || t == 83){
				if(todo == 0) todo = -2.48;
			}else if(t == 16 || t == 85){
				if(todo == 0) todo = 2.48;
			}else if(j == 0 || char[i].charState == 10){
				return 0;
			}
		}
	}
	return todo;
}
function newTileUp(i:Number){
	return (Math.floor((char[i].y-char[i].h)/30) < Math.floor((char[i].py-char[i].h)/30));
}
function newTileDown(i:Number){
	return (Math.ceil(char[i].y/30) > Math.ceil(char[i].py/30));
}
function newTileHorizontal(i:Number, sign:Number){
	return (Math.ceil(sign*(char[i].x+char[i].w*sign)/30) > Math.ceil(sign*(char[i].px+char[i].w*sign)/30));
}
function exitTileHorizontal(i:Number, sign:Number){
	return (Math.ceil(sign*(char[i].x-char[i].w*sign)/30) > Math.ceil(sign*(char[i].px-char[i].w*sign)/30));
}
function exitTileVertical(i:Number, sign:Number){
	var includeHeight:Number = 0.5*sign+0.5;
	return (Math.ceil(sign*(char[i].y-char[i].h*includeHeight)/30) > Math.ceil(sign*(char[i].py-char[i].h*includeHeight)/30));
}
function submerge(i:Number){
	if(char[i].temp > 0) char[i].temp = 0;
	var goal:Number = somewhereSubmerged(i);
	if(char[i].submerged <= 1 && goal >= 2){
		char[i].weight2 -= 0.16;
		rippleWeight(i,0.16,-1);
		char[i].vx *= 0.1;
		char[i].vy *= 0.1;
	}
	char[i].submerged = goal;
}
function unsubmerge(i:Number){
	if(exitTileHorizontal(i,-1) || exitTileHorizontal(i,1) || exitTileVertical(i,1) || exitTileVertical(i,-1)){
		var goal:Number = somewhereSubmerged(i);
		if(goal == 0 && char[i].submerged >= 1){
			if(char[i].submerged == 2 && exitTileVertical(i,-1) && char[i].weight2 < 0 && !ifCarried(i)){
				char[i].vy = 0;
				char[i].y = Math.ceil(char[i].y/30)*30;
				goal = 1;
			}
			char[i].weight2 += 0.16;
			rippleWeight(i,0.16,1);
		}
		char[i].submerged = goal;
	}
}
function heat(i:Number){
	if(char[i].submerged == 0)char[i].temp+=char[i].heatSpeed;
	char[i].justChanged = 2;
	if(char[i].temp > 50 && char[i].id != 3){
		startDeath(i);
		if(char[i].id == 2) extinguish(i);
	}
	if(char[i].heated == 1)unheat(i);
}
function unheat(i:Number){
	if(exitTileHorizontal(i,-1) || exitTileHorizontal(i,1) || exitTileVertical(i,1) || exitTileVertical(i,-1)){
		if(!somewhereHeated(i)) char[i].heated = 0;
	}
}
function extinguish(i:Number){
	for(var j:Number = 0 ; j < charCount; j++){
		if(char[j].charState >= 5 && j != i && char[j].temp > 0){
			if(Math.abs(char[i].x-char[j].x) < char[i].w+char[j].w && char[j].y > char[i].y-char[i].h && char[j].y < char[i].y+char[j].h){
				char[j].temp = 0;
			}
		}
	}
}
function somewhereSubmerged(i:Number){
	var record:Number = 0;
	for(var x:Number = Math.floor((char[i].x-char[i].w)/30); x <= Math.floor((char[i].x+char[i].w)/30); x++){
		var lowY:Number = Math.floor((char[i].y-char[i].h)/30);
		var highY:Number = Math.floor((char[i].y)/30);
		for(var y:Number = lowY; y <= highY; y++){
			if(blockProperties[thisLevel[y][x]][14]){
				if(y == highY){
					if(record == 0) record = 2;
				}else{
					record = 3;
				}
			}
		}
	}
	return record;
}
function somewhereHeated(i:Number){
	for(var x:Number = Math.floor((char[i].x-char[i].w)/30); x <= Math.floor((char[i].x+char[i].w)/30); x++){
		for(var y:Number = Math.floor((char[i].y-char[i].h)/30); y <= Math.floor((char[i].y)/30); y++){
			if(thisLevel[y][x] == 15) return true;
		}
	}
	return false;
}
function xOff(i:Number){
	return char[char[i].carriedBy].w*(Math.ceil(char[char[i].carriedBy].dire/2)*2-3)*0.7;
}
function xOff2(i:Number){
	return char[i].w*(Math.ceil(char[i].dire/2)*2-3)*0.7;
}
function yOff(i:Number){
	if(char[i].charState == 6){
		return char[char[i].carriedBy].h2;
	}else{
		return char[char[i].carriedBy].h2-13;
	}
}
function stopCarrierX(i:Number, x:Number){
	if(ifCarried(i)){
		char[char[i].carriedBy].x = x-xOff(i);
		char[char[i].carriedBy].vx = 0;
	}
}
function stopCarrierY(i:Number, y:Number, canCornerHang:Boolean){
	if(ifCarried(i) && (!char[char[i].carriedBy].onob || (char[char[i].carriedBy].standingOn >= 0 && char[char[char[i].carriedBy].standingOn].vy != 0))){
		if(char[char[i].carriedBy].standingOn >= 0){
			char[char[char[i].carriedBy].standingOn].vy = 0;
			fallOff(char[i].carriedBy);
		}
		if(char[char[i].carriedBy].vy >= 0 && canCornerHang && !solidAt(char[char[i].carriedBy].x,char[i].y+15)){
			var lSolid:Boolean = (solidAt(char[char[i].carriedBy].x-char[char[i].carriedBy].w-15,char[i].y+15) ||
			 solidAt(char[char[i].carriedBy].x-char[char[i].carriedBy].w-45,char[i].y+15));
			var rSolid:Boolean = (solidAt(char[char[i].carriedBy].x+char[char[i].carriedBy].w+15,char[i].y+15) || 
			 solidAt(char[char[i].carriedBy].x+char[char[i].carriedBy].w+45,char[i].y+15));
			char[i].justChanged = 2;
			char[char[i].carriedBy].justChanged = 2;
			if(lSolid && rSolid){
				putDown(char[i].carriedBy);
			}else if(lSolid){
				char[char[i].carriedBy].vx += power;
			}else if(rSolid){
				char[char[i].carriedBy].vx -= power;
			}
			cornerHangTimer++;
			if(cornerHangTimer > 30){
				putDown(char[i].carriedBy);
			}
		}
		char[char[i].carriedBy].vy = 0;
		char[char[i].carriedBy].y = y+yOff(i);
		if(newTileDown(char[i].carriedBy) && verticalProp(char[i].carriedBy,1,1,char[char[i].carriedBy].x,char[char[i].carriedBy].y)){
			char[char[i].carriedBy].y = Math.floor(char[char[i].carriedBy].y/30)*30;
		}
	}
}
function allSolid(i:Number){
	return (blockProperties[i][0] && blockProperties[i][1] && blockProperties[i][2] && blockProperties[i][3]);
}
function ifCarried(i:Number){
	if(char[i].carriedBy >= 0 && char[i].carriedBy <= 190){
		return char[char[i].carriedBy].carry;
	}else{
		return false;
	}
}
function onlyMovesOneBlock(i:Number, j:Number){
	var sign:Number = Math.floor((char[j].dire-1)/2)*2-1;
	var x1:Number = Math.ceil(sign*(char[i].x+char[i].w*sign)/30);
	var x2:Number = Math.ceil(sign*(char[control].x+xOff2(control)+char[i].w*sign)/30);
	return (Math.abs(x2-x1) <= 1);
}
function putDown(i:Number){
	if(char[i].carry){
		rippleWeight(i,char[char[i].carryObject].weight2,-1);
		char[i].weight2 = char[i].weight;
		char[char[i].carryObject].weight2 = char[char[i].carryObject].weight;
		char[i].carry = false;
		char[i].justChanged = 2;
		levelChar["char"+char[i].carryObject].swapDepths(charDepth-char[i].carryObject*2);
		char[char[i].carryObject].carriedBy = -1;
		char[char[i].carryObject].stopMoving();
	}
	cornerHangTimer = 0;
}
function charThrow(i:Number){
	char[i].weight2 = char[i].weight;
	char[char[i].carryObject].weight2 = char[char[i].carryObject].weight;
	char[char[i].carryObject].vy = -7.5;
	char[char[i].carryObject].vx = char[i].vx;
	if(char[i].dire <= 2){
		char[char[i].carryObject].vx -= 3;
	}else{
		char[char[i].carryObject].vx += 3;
	}
}
function fallOff(i:Number){
	if(char[i].standingOn >= 0){
		var after:Boolean = false;
		if(char[char[i].standingOn].submerged == 1){
			char[char[i].standingOn].submerged = 2;
		}else{
			rippleWeight(i, char[i].weight2, -1);
		}
		var len:Number = char[char[i].standingOn].stoodOnBy.length;
		for(var j:Number = 0; j < len; j++){
			if(char[char[i].standingOn].stoodOnBy[j] == i) after = true;
			if(after && j <= len-2)  char[char[i].standingOn].stoodOnBy[j] = char[char[i].standingOn].stoodOnBy[j+1];
		}
		char[char[i].standingOn].stoodOnBy.pop();
		char[i].standingOn = -1;
		char[i].onob = false;
		for(var j:Number = 0; j < char[i].stoodOnBy.length; j++){
			fallOff(char[i].stoodOnBy[j]);
		}
	}
}
function aboveFallOff(i:Number){
	if(char[i].stoodOnBy.length >= 1){
		for(var j:Number = 0; j < char[i].stoodOnBy.length; j++){
			fallOff(char[i].stoodOnBy[j]);
		}
	}
}
function rippleWeight(i:Number, w:Number, sign:Number){
	if(char[i].standingOn >= 0){
		char[char[i].standingOn].weight2 += w*sign;
		if(char[char[i].standingOn].submerged == 1 && char[char[i].standingOn].weight2 < 0) char[char[i].standingOn].submerged = 2;
		if(char[char[i].standingOn].submerged >= 2 && char[char[i].standingOn].weight2 < 0 && char[char[i].standingOn].onob){
			char[char[i].standingOn].onob = false;
		}
		rippleWeight(char[i].standingOn, w, sign);
	}
}
function bounce(i:Number){
	if(ifCarried(i)) bounce(char[i].carriedBy);
	if(char[i].dire%2 == 0) char[i].fricGoal = 0;
	char[i].jump(-jumpPower*1.66);
	char[i].onob = false;
	char[i].y = Math.floor(char[i].y/30)*30-10;
}
function landOnObject(i:Number){
	var record = 10000;
	var k = 0;
	for(var j:Number = 0; j < charCount; j++){
		if(!ifCarried(j) && (char[j].charState == 6 || char[j].charState == 4)){
			var dist:Number = Math.abs(char[i].x-char[j].x);
			if(dist < char[i].w+char[j].w && char[i].y >= char[j].y-char[j].h && (char[i].py < char[j].py-char[j].h || 
			(char[i].py == char[j].py-char[j].h && char[i].vy == 0))){
				if(dist-char[j].w < record){
					record = dist-char[j].w;
					k = j;
				}
			}
		}
	}
	if(record < 10000 && char[i].standingOn != k){
		if(char[i].standingOn >= 0) fallOff(i);
		if(char[k].charState == 6 && !char[k].onob) char[k].vy = inter(char[k].vy,char[i].vy,char[i].weight2/(char[k].weight2+char[i].weight2));
		land(i,char[k].y-char[k].h,char[k].vy);
		if(char[k].onob) land2(i,char[k].y-char[k].h);
		char[i].standingOn = k;
		char[k].stoodOnBy.push(i);
		rippleWeight(i, char[i].weight2, 1);
		char[i].fricGoal = char[k].fricGoal;
		if(char[k].submerged == 1 && char[k].weight2 >= 0){
			char[k].submerged = 2;
			char[k].weight2 -= 0.16;
		}
	}
}
function objectsLandOn(i:Number){
	for(var j:Number = 0; j < charCount; j++){
		if(char[j].charState >= 5 && char[j].standingOn != i){
			var dist:Number = Math.abs(char[i].x-char[j].x);
			if(dist < char[i].w+char[j].w && char[i].y-char[i].h <= char[j].y &&
				char[i].py-char[i].h > char[j].py && (char[i].submerged <= 1 || !char[j].onob || char[j].submerged == 2)){
				if(char[j].standingOn >= 0) fallOff(j);
				char[j].standingOn = i;
				char[i].stoodOnBy.push(j);
				land(j,char[i].y-char[i].h,char[j].vy);
				if(char[i].charState == 6) char[i].vy = inter(char[i].vy,char[j].vy,char[j].weight2/(char[i].weight2+char[j].weight2));
				char[j].vy = char[i].vy;
				rippleWeight(j, char[j].weight2, 1);
				char[j].fricGoal = char[i].fricGoal;
			}
		}
	}
}
function bumpHead(i:Number){
	if(char[i].standingOn >= 0){
		char[i].onob = false;
		char[char[i].standingOn].vy = 0;
		fallOff(i);
	}
}
function changeControl(){
	if(char[control].charState >= 7){
		char[control].stopMoving();
		levelChar["char"+control].swapDepths(charDepth-control*2);
		if(char[control].carry) levelChar["char"+char[control].carry].swapDepths(charDepth-control*2+1);
	}
	control = (control+1)%charCount;
	var attempts = 0;
	while(char[control].charState != 10 && attempts < 10){
		control = (control+1)%charCount;
		attempts++;
	}
	if(attempts == 10) control = 10000;
	if(control < 1000){
		if(ifCarried(control)) putDown(char[control].carriedBy);
		levelChar["char"+control].swapDepths(charDepth+charCount*2-control*2);
		levelChar["char"+control].burst.gotoAndPlay(2);
	}
}
function getCoin(i:Number){
	if(!gotThisCoin && char[i].charState >= 7){
		if(Math.floor((char[i].x-char[i].w)/30) <= locations[2] && 
		Math.ceil((char[i].x+char[i].w)/30)-1 >= locations[2] && 
		Math.floor((char[i].y-char[i].h)/30) <= locations[3] && 
		Math.ceil((char[i].y)/30)-1 >= locations[3]){ 
			levelActive["tileX"+locations[2]+"Y"+locations[3]].coin.gotoAndPlay(2);
			gotThisCoin = true;
		}
	}
}
function startDeath(i:Number){
	if(char[i].deathTimer >= 30 && (char[i].charState >= 7 || char[i].temp >= 50)){
		if(ifCarried(i)){
			char[char[i].carriedBy].vy = 0;
			char[char[i].carriedBy].vx = 0;
			putDown(char[i].carriedBy);
		}
		char[i].pcharState = char[i].charState;
		checkButton2(i,true);
		fallOff(i);
		char[i].deathTimer = 20;
		levelChar["char"+i].leg1.leg.gotoAndStop(50);
		levelChar["char"+i].leg2.leg.gotoAndStop(50);
		levelChar["char"+i].charBody.gotoAndStop(8+Math.ceil(char[i].dire/2));
		clearTint(i);
		if(char[i].temp >= 50) levelChar["char"+i].fire.gotoAndStop(2);
	}
}
function blinkDeath(i:Number){
	if(char[i].deathTimer%6 <= 2){
		levelChar["char"+i]._alpha = 30;
	}else{
		levelChar["char"+i]._alpha = 100;
	}
}
function endDeath(i:Number){
	putDown(i);
	char[i].temp = 0;
	levelChar["char"+i]._visible = false;
	levelChar["char"+i].fire.gotoAndStop(1);
	char[i].charState = 1;
	deathCount++;
	saveGame();
	if(i == control) changeControl();
}
function setMovieClipCoordinates(x2:Number,y2:Number){
	x = Math.floor(x2);
	y = Math.floor(y2);
	levelShadow._x = x;
	levelShadow._y = y;
	levelStill._x = x;
	levelStill._y = y;
	levelActive._x = x;
	levelActive._y = y
	levelActive2._x = x;
	levelActive2._y = y;
	levelActive3._x = x;
	levelActive3._y = y;
	levelChar._x = x;
	levelChar._y = y;
	HPRCBubble._x = x;
	HPRCBubble._y = y;
	bg._x = x/3;
	bg._y = y/3;
	if(bgXScale > bgYScale){
		bg._y -= Math.max(0,(bgXScale*5.4-540)/2);
	}else if(bgYScale > bgSScale){
		bg._x -= Math.max(0,(bgYScale*9.6-960)/2);
	}
}
function setCamera(){
	if(levelWidth <= 32){
		cameraX = levelWidth*15-480;
	}else{
		if(char[control].x-cameraX < 384){
			cameraX = Math.min(Math.max(cameraX+(char[control].x-384-cameraX)*0.12,0),levelWidth*30-960);
		}else if(char[control].x-cameraX >= 576){
			cameraX = Math.min(Math.max(cameraX+(char[control].x-576-cameraX)*0.12,0),levelWidth*30-960);
		}
	}
	if(levelHeight <= 18){
		cameraY = levelHeight*15-270;
	}else{
		if(char[control].y-cameraY < 216){
			cameraY =  Math.min(Math.max(cameraY+(char[control].y-216-cameraY)*0.12,0),levelHeight*30-540);
		}else if(char[control].y-cameraY >= 324){
			cameraY =  Math.min(Math.max(cameraY+(char[control].y-324-cameraY)*0.12,0),levelHeight*30-540);
		}
	}
}
function near(c1:Number, c2:Number){
	var yDist = (char[c2].y-23)-(char[c1].y-char[c1].h2/2);
	return (Math.abs(yDist) <= char[c2].h/2+char[c1].h2/2 && Math.abs(char[c1].x+xOff2(c1)-char[c2].x) < 50);
}
function near2(c1:Number, c2:Number){
	var yDist = (char[c2].y-23)-(char[c1].y-char[c1].h2/2);
	return (Math.abs(yDist) <= 20 && Math.abs(char[c1].x+xOff2(c1)-char[c2].x) < 50);
}
function land(i:Number, y:Number, vy:Number){
	char[i].y = y;
	if(char[i].weight2 <= 0){
		char[i].vy = -Math.abs(vy);
	}else{
		char[i].vy = vy;
		char[i].onob = true;
	}
}
function land2(i:Number, y:Number){
	char[control].landTimer = 0;
	stopCarrierY(i,y,false);
}
function nextDeadPerson(i:Number, dire:Number){
	i2 = (i+dire+charCount)%charCount;
	while(char[i2].charState != 1){
		i2 = (i2+dire+charCount)%charCount;
	}
	return i2;
}
function numberOfDead(){
	var count:Number = 0;
	for(var i:Number = 0; i < charCount; i++){
		if(char[i].charState == 1) count++;
	}
	return count;
}
function recoverCycle(i:Number, dire:Number){
	var attempts = 0;
	var dire2 = dire;
	if(dire == 0) dire2 = 1;
	recover2 = (recover2+dire2+charCount)%charCount;
	while((char[recover2].charState != 1 || char[recover2].pcharState <= 6) && attempts < 10){
		recover2 = (recover2+dire2+charCount)%charCount;
		attempts++;
	}
	if(attempts == 10){
		HPRCBubble.charImage.gotoAndPlay(5);
		recover = false;
		recover2 = 0;
	}else{
		if(numberOfDead() == 1){
			HPRCBubble.charImage.gotoAndStop(3);
			HPRCBubble.charImage.anim.charBody.gotoAndStop(char[recover2].id+1);
		}else{
			HPRCBubble.charImage.gotoAndStop(4);
			if(dire == 0){
				HPRCBubble.charImage.anim.gotoAndStop(1);
			}else{
				HPRCBubble.charImage.anim.gotoAndPlay(dire*8+10);
			}
			HPRCBubble.charImage.anim.charBody.gotoAndStop(char[recover2].id+1);
			HPRCBubble.charImage.anim.charBody1.gotoAndStop(char[nextDeadPerson(recover2,-1)].id+1);
			HPRCBubble.charImage.anim.charBody2.gotoAndStop(char[nextDeadPerson(recover2,1)].id+1);
		}
	}
}
function setBody(i:Number){
	var legX:Number;
	var skew:Array = [0,0];
	if(ifCarried(i) && cornerHangTimer == 0){
		for(var z:Number = 1; z <= 2; z++){
			levelChar["char"+i]["leg"+z].gotoAndStop(Math.floor(char[i].dire/2+0.5));
			levelChar["char"+i]["leg"+z].leg.gotoAndStop(51);
		}
		offSetLegs(i,60);
	}else if(char[i].dire%2 == 0 && char[i].onob){
		if(char[i].standingOn >= 0){
			var j:Number = char[i].standingOn;
			for(var z:Number = 1; z <= 2; z++){
				levelChar["char"+i]["leg"+z].gotoAndStop(char[i].dire/2);
				legX = char[i].x+levelChar["char"+i]["leg"+z]._x;
				if(legX >= char[j].x+char[j].w){
					skew[z-1] = char[j].x+char[j].w-legX;
				}else if(legX <= char[j].x-char[j].w){
					skew[z-1] = char[j].x-char[j].w-legX;
				}
			}
		}else if(char[i].fricGoal == 0){
			for(var z:Number = 1; z <= 2; z++){
				levelChar["char"+i]["leg"+z].gotoAndStop(char[i].dire/2);
				legX = char[i].x+levelChar["char"+i]["leg"+z]._x;
				if(!safeToStandAt(legX,char[i].y+1)){
					var s1:Boolean = safeToStandAt(legX-30,char[i].y+1);
					var s2:Boolean = safeToStandAt(legX+30,char[i].y+1);
					if(s1 && (!s2 || legX%30-(z-1.5)*10 < 30-legX%30) && !horizontalProp(i,-1,1,char[i].x-15,char[i].y)){
						skew[z-1] = -legX%30;
					}else if(s2 && !horizontalProp(i,1,1,char[i].x+15,char[i].y)){
						skew[z-1] = 30-legX%30;
					}
				}else{
					skew[z-1] = 0;
				}
			}
		}
		if(skew[1]-skew[0] >= 41){
			skew[0] = skew[1];
			skew[1] -= 3;
		}
		var c:Number = (3-char[i].dire);
		if(skew[0] > skew[1] && skew[1] >= 0){
			levelChar["char"+i].leg1.leg.gotoAndStop(toFrame(skew[0]*c));
			levelChar["char"+i].leg2.leg.gotoAndStop(toFrame(skew[0]*c));
		}else if(skew[0] > skew[1] && skew[0] <= 0){
			levelChar["char"+i].leg1.leg.gotoAndStop(toFrame(skew[1]*c));
			levelChar["char"+i].leg2.leg.gotoAndStop(toFrame(skew[1]*c));
		}else if(skew[0] < 0 && skew[1] > 0){
			levelChar["char"+i].leg1.leg.gotoAndStop(toFrame(skew[0]*c));
			levelChar["char"+i].leg2.leg.gotoAndStop(toFrame(skew[1]*c));
		}else if(skew[1] > 0 && skew[0] == 0){
			levelChar["char"+i].leg1.leg.gotoAndStop(25+23*(3-char[i].dire));
			levelChar["char"+i].leg2.leg.gotoAndStop(25+23*(3-char[i].dire));
		}else if(skew[0] < 0 && skew[1] == 0){
			levelChar["char"+i].leg1.leg.gotoAndStop(25-23*(3-char[i].dire));
			levelChar["char"+i].leg2.leg.gotoAndStop(25-23*(3-char[i].dire));
		}else{
			levelChar["char"+i].leg1.leg.gotoAndStop(1);
			levelChar["char"+i].leg2.leg.gotoAndStop(1);
		}
	}else{
		for(var z:Number = 1; z <= 2; z++){
			levelChar["char"+i]["leg"+z].gotoAndStop(Math.floor(char[i].dire/2+0.5));
			if(char[i].submerged >= 1 && !char[i].onob){
				levelChar["char"+i]["leg"+z].leg.gotoAndStop(52);
			}else{
				levelChar["char"+i]["leg"+z].leg.gotoAndStop(50-char[i].onob);
			}
		}
		if(char[i].dire%2 == 1 && char[i].onob) offSetLegs(i,28);
		if(char[i].submerged >= 1 && !char[i].onob) offSetLegs(i,20);
	}
	if(cutScene == 1 && dialogueChar[currentLevel][cutSceneLine] == i){
		levelChar["char"+i].charBody.gotoAndStop(Math.ceil(char[i].dire/2)*2);
	}else{
		if(i == control && recoverTimer >= 1){
			if(char[i].x-(char[HPRC2].x-33) < 25){
				levelChar["char"+i].charBody.gotoAndStop(Math.ceil(char[i].dire/2)+12);
			}else{
				levelChar["char"+i].charBody.gotoAndStop(Math.ceil(char[i].dire/2)+10);
			}
			drawCrankingArms(i);
		}else if(char[i].carry){
			levelChar["char"+i].charBody.gotoAndStop(Math.ceil(char[i].dire/2)+6);
		}else if(!char[i].onob && !ifCarried(i)){
			levelChar["char"+i].charBody.gotoAndStop(Math.ceil(char[i].dire/2)+4);
			var frame:Number = Math.round(Math.min(4-char[i].vy,15));
		}else{
			levelChar["char"+i].charBody.gotoAndStop(char[i].dire);
		}
	}
}
function setTint(i:Number){
	myColor = new Color(levelChar["char"+i]);
	myColorTransform = new Object();
	var t:Number = char[i].temp;
	if(char[i].temp > 50) t = 0;
	myColorTransform = {rb:t*5.12,ra:100-t,ba:100-t,ga:100-t};
	myColor.setTransform(myColorTransform);
}
function clearTint(i:Number){
	myColor = new Color(levelChar["char"+i]);
	myColorTransform = new Object();
	myColorTransform = {rb:0,ra:100,ba:100,ga:100};
	myColor.setTransform(myColorTransform);
}
function toFrame(i:Number){
	return Math.min(Math.max(Math.round(i+25),2),48);
}
function offSetLegs(i:Number, duration:Number){
	levelChar["char"+i].leg2.leg.leg.gotoAndPlay((levelChar["char"+i].leg1.leg.leg._currentframe+(duration/2-1))%duration+1);
}
function drawCrankingArms(i:Number){
	levelChar["char"+i].charBody.arm1.clear();
	levelChar["char"+i].charBody.arm1.lineStyle(2,0x000000,100);
	levelChar["char"+i].charBody.arm1.moveTo(0,0);
	var x:Number = -levelChar["char"+i].charBody._x-levelChar["char"+i].charBody.arm1._x
	+(levelChar["char"+HPRC2]._x-levelChar["char"+i]._x)+levelChar["char"+HPRC2].charBody._x+levelChar["char"+HPRC2].charBody.crank._x*0.288+10*Math.cos(Math.PI*recoverTimer/15-0.2);
	var y:Number = -levelChar["char"+i].charBody._y-levelChar["char"+i].charBody.arm1._y+(levelChar["char"+HPRC2]._y-levelChar["char"+i]._y)+
	levelChar["char"+HPRC2].charBody._y+levelChar["char"+HPRC2].charBody.crank._y*0.288+10*Math.sin(Math.PI*recoverTimer/15-0.2);
	levelChar["char"+i].charBody.arm1.lineTo(x,y);
	levelChar["char"+i].charBody.arm1.lineStyle(5,0x000000,100);
	levelChar["char"+i].charBody.arm1.lineTo(x,y);
	levelChar["char"+i].charBody.arm1.lineTo(x,y+1);
	levelChar["char"+i].charBody.arm2.clear();
	levelChar["char"+i].charBody.arm2.lineStyle(2,0x000000,100);
	levelChar["char"+i].charBody.arm2.moveTo(0,0);
	var x:Number = -levelChar["char"+i].charBody._x-levelChar["char"+i].charBody.arm2._x
	+(levelChar["char"+HPRC2]._x-levelChar["char"+i]._x)+levelChar["char"+HPRC2].charBody._x+levelChar["char"+HPRC2].charBody.crank._x*0.288+20*Math.cos(Math.PI*recoverTimer/15-0.2);
	var y:Number = -levelChar["char"+i].charBody._y-levelChar["char"+i].charBody.arm2._y+(levelChar["char"+HPRC2]._y-levelChar["char"+i]._y)+
	levelChar["char"+HPRC2].charBody._y+levelChar["char"+HPRC2].charBody.crank._y*0.288+20*Math.sin(Math.PI*recoverTimer/15-0.2);
	levelChar["char"+i].charBody.arm2.lineTo(x,y);
	levelChar["char"+i].charBody.arm2.lineStyle(5,0x000000,100);
	levelChar["char"+i].charBody.arm2.lineTo(x,y);
	levelChar["char"+i].charBody.arm2.lineTo(x,y+1);
}
function inter(a:Number, b:Number, x:Number){
	return a+(b-a)*x;
}
function drawMenu(){
	_root.attachMovie("menuMovieClip","menuMovieClip",0);
	menuMovieClip.menuLevelCreatorGray.gotoAndStop(2);
	menuMovieClip.menuLevelViewerGray.gotoAndStop(2);
	var started:Boolean = true;
	if(bfdia5b.data.levelProgress == undefined || bfdia5b.data.levelProgress == 0) started = false;
	if(!started) menuMovieClip.menuContGameGray.gotoAndStop(2);
	menuMovieClip.menuNewGame.onRelease = function(){
		if(started){
			menuMovieClip.menuNewGame._x += 1000;
			menuMovieClip.menuNewGame2._x -= 1000;
		}else{
			beginNewGame();
		}
	}
	menuMovieClip.menuNewGame2.yes.onRelease = function(){
		beginNewGame();
	}
	menuMovieClip.menuNewGame2.no.onRelease = function(){
		menuMovieClip.menuNewGame._x -= 1000;
		menuMovieClip.menuNewGame2._x += 1000;
	}
	menuMovieClip.menuContGame.onRelease = function(){
		if(started){
			_root.menuMovieClip.removeMovieClip();
			drawLevelMap();
		}	
	}
	menuMovieClip.menuWatch.onRelease = function(){
		getURL("http://www.youtube.com/watch?v=4q77g4xo9ic","_blank");
	}
	menuMovieClip.menuLevelCreator.onRelease = function(){
		//_root.menuMovieClip.removeMovieClip();
		//drawLevelCreator();
	}
}
function beginNewGame(){
	clearVars();
	saveGame();
	_root.menuMovieClip.removeMovieClip();
	drawLevelMap();
}
function drawLevelMap(){
	cameraY = 0;
	cameraX = 0;
	_root.attachMovie("levelMap","levelMap",2,{_x:0,_y:0});
	_root.attachMovie("levelMapBorder","levelMapBorder",3);
	levelMap.layoutButton.onRelease = function(){
		_root.levelMap.removeMovieClip();
		_root.levelMapBorder.removeMovieClip();
		drawLayoutEditor();
	}
	if(bfdia5b.data.timerMod.config.timingMethod == "prev"){
		levelMap.prevTimeButton._y += 200;
		levelMap.bestTimeButton._y -= 200;
	}
	levelMap.prevTimeButton.onRelease = function(){
		levelMap.prevTimeButton._y -= 200;
		levelMap.bestTimeButton._y += 200;
		bfdia5b.data.timerMod.config.timingMethod = "best";
		bfdia5b.flush();
	}
	levelMap.bestTimeButton.onRelease = function(){
		levelMap.prevTimeButton._y += 200;
		levelMap.bestTimeButton._y -= 200;
		bfdia5b.data.timerMod.config.timingMethod = "prev";
		bfdia5b.flush();
	}
	levelMapBorder.goBack.onRelease = function(){
		_root.levelMap.removeMovieClip();
		_root.levelMapBorder.removeMovieClip();
		menuScreen = 0;
	}
	levelMapBorder.muteButton2.onRelease = function(){
		if(musicSound.getVolume() == 100){
			musicSound.setVolume(0);
		}else{
			musicSound.setVolume(100);
		}
	}
	levelMapBorder.qualButton.onRelease = function(){
		if(_quality == "HIGH"){
			_quality = "LOW";
			levelMapBorder.qualMovie.gotoAndPlay(2);
		}else{
			_quality = "HIGH";
			levelMapBorder.qualMovie.gotoAndPlay(61);
		}
	}
	levelMap.text1.text = "x "+coins;
	levelMap.text2.text = toHMS(timer);
	levelMap.text3.text = addCommas(deathCount);
	if(levelProgress >= 1){
		levelMap.text4.text = "Minimal deaths to complete level "+levelProgress+":";
		levelMap.text5.text = mdao[levelProgress-1];
		levelMap.text6.text = "Unnecessary deaths:"
		levelMap.text7.text = addCommas(deathCount-mdao[levelProgress-1]);
	}
	for(var i:Number = 0; i < 133; i++){
		var j:Number = i;
		if(j >= 100) j+=19;
		levelMap.attachMovie("levelButton","levelButton"+i,i,{_x:(j%8)*110+45, _y:Math.floor(j/8)*50+160});
		if(gotCoin[i]){
			levelMap["levelButton"+i].gotoAndStop(4);
		}else if(levelProgress == i){
			levelMap["levelButton"+i].gotoAndStop(2);
		}else if(levelProgress > i){
			levelMap["levelButton"+i].gotoAndStop(3);
		}else{
			levelMap["levelButton"+i].gotoAndStop(1);
		}
		levelMap["levelButton"+i].id = i;
		if(i >= 100){
			levelMap["levelButton"+i].textie.text = "B"+numberToText(i-99,false);
		}else{
			levelMap["levelButton"+i].textie.text = numberToText(i+1,true);
		}
		levelMap["levelButton"+i].onRollOver = function(){
			if(this.id <= levelProgress) levelMap["levelButton"+this.id].mov.gotoAndStop(2);
			if(this.id < levelProgress && transitionType != 2){
				if(bfdia5b.data.timerMod.config.timingMethod == "prev" && bfdia5b.data.timerMod.prev[this.id]){
					levelMap["levelButton" + this.id].textie.text = "";
					levelMap["levelButton" + this.id].bestTime.text = toHMS2(bfdia5b.data.timerMod.prev[this.id]);
				}else if(bfdia5b.data.timerMod.config.timingMethod != "prev" && best[this.id]){
					levelMap["levelButton" + this.id].textie.text = "";
					levelMap["levelButton" + this.id].bestTime.text = toHMS2(best[this.id]);
				}
			}
		}
		levelMap["levelButton"+i].onRollOut = function(){
			clearInterval(clearTimeInterval);
			clearTime = 10000;
			levelMap["levelButton" + this.id]._alpha = 100;
			levelMap["levelButton"+this.id].mov.gotoAndStop(1);
			if(this.id < levelProgress && transitionType != 2){
				if(this.id >= 100) levelMap["levelButton" + this.id].textie.text = "B" + numberToText(this.id - 99, false);
				else levelMap["levelButton" + this.id].textie.text = numberToText(this.id + 1, true);
				levelMap["levelButton" + this.id].bestTime.text = "";
			}
		}
		levelMap["levelButton"+i].onReleaseOutside = function(){
			clearInterval(clearTimeInterval);
			clearTime = 10000;
			levelMap["levelButton" + this.id]._alpha = 100;
			levelMap["levelButton"+this.id].mov.gotoAndStop(1);
			if(this.id < levelProgress && transitionType != 2){
				if(this.id >= 100) levelMap["levelButton" + this.id].textie.text = "B" + numberToText(this.id - 99, false);
				else levelMap["levelButton" + this.id].textie.text = numberToText(this.id + 1, true);
				levelMap["levelButton" + this.id].bestTime.text = "";
			}
		}
		levelMap["levelButton"+i].onPress = function(){
			if(this.id <= levelProgress) levelMap["levelButton"+this.id].mov.gotoAndStop(3);
			if (bfdia5b.data.timerMod.config.timingMethod != "prev" && best[this.id]){
				var startPress = getTimer();
				clearTimeInterval = setInterval(clearTimer, 100, this.id, startPress);
			}
		}
		levelMap["levelButton"+i].onRelease = function(){
			if(this.id <= levelProgress && clearTime > 6500){
				playLevel(this.id);
				_root.levelMap.removeMovieClip();
				_root.levelMapBorder.removeMovieClip();
				white._alpha = 100;
			}
			clearInterval(clearTimeInterval);
			clearTime = 10000;
			levelMap["levelButton" + this.id]._alpha = 100;
		}
	}
	if(transitionType == 2){
		levelMap["levelButton" + currentLevel].textie.text = "";
		levelMap["levelButton" + currentLevel].bestTime.text = toHMS2(prev[currentLevel]);
		levelMap["levelButton" + currentLevel]._alpha = 50;
		setTimeout(function() {
			transitionType = 1;
			if(levelMap["levelButton" + currentLevel].mov._currentframe != 2){
				levelMap["levelButton" + currentLevel].textie.text = numberToText(currentLevel + 1, true);
				levelMap["levelButton" + currentLevel].bestTime.text = "";
				levelMap["levelButton" + currentLevel]._alpha = 100;
			}
		}, 500);
	}
	menuScreen = 2;
}
var clearTime = 10000;
var clearTimeInterval;
function clearTimer(buttonid, pressTime){
	clearTime -= (getTimer() - pressTime);
	levelMap["levelButton" + buttonid]._alpha = clearTime / 100;
	if (clearTime <= 0){
		best[buttonid] = undefined;
		bfdia5b.data.timerMod.best[buttonid] = undefined;
		bfdia5b.flush();
		levelMap["levelButton" + buttonid].textie.text = numberToText(buttonid + 1, true);
		levelMap["levelButton" + buttonid].bestTime.text = "";
		levelMap["levelButton" + buttonid]._alpha = 100;
		clearInterval(clearTimeInterval);
	}
}
function drawLayoutEditor(){
	var keyListener = new Object();
	keyListener.onKeyDown = function(){
		if(Key.isDown(82)){
			bfdia5b.data.timerMod.config.showTimer = true;
			bfdia5b.data.timerMod.config.showKeys = true;
			_root.levelButtons.levelTimer._x = bfdia5b.data.timerMod.config.levelTimer[0] = 4;
			_root.levelButtons.levelTimer._y = bfdia5b.data.timerMod.config.levelTimer[1] = 3;
			_root.levelButtons.levelTimer._xscale = bfdia5b.data.timerMod.config.levelTimerScale[0] = 70;
			_root.levelButtons.levelTimer._yscale = bfdia5b.data.timerMod.config.levelTimerScale[1] = 70;
			_root.levelButtons.levelTimer._alpha = bfdia5b.data.timerMod.config.levelTimerOpacity = 60;
			_root.levelButtons.levelKeys._x = bfdia5b.data.timerMod.config.levelKeys[0] = 695;
			_root.levelButtons.levelKeys._y = bfdia5b.data.timerMod.config.levelKeys[1] = 3;
			_root.levelButtons.levelKeys._xscale = bfdia5b.data.timerMod.config.levelKeysScale[0] = 60;
			_root.levelButtons.levelKeys._yscale = bfdia5b.data.timerMod.config.levelKeysScale[1] = 60;
			_root.levelButtons.levelKeys._alpha = bfdia5b.data.timerMod.config.levelKeysOpacity = 45;
		} else if(_root.levelButtons.levelTimer._x <= _xmouse && _xmouse <= _root.levelButtons.levelTimer._x + _root.levelButtons.levelTimer._width &&
		   _root.levelButtons.levelTimer._y <= _ymouse && _ymouse <= _root.levelButtons.levelTimer._y + _root.levelButtons.levelTimer._height){
			var timerOffset2X = _root.levelButtons.levelTimer._xmouse, timerOffset2Y = _root.levelButtons.levelTimer._ymouse;
			if (Key.isDown(38)) _root.levelButtons.levelTimer._xscale = _root.levelButtons.levelTimer._yscale += 5;
			else if (Key.isDown(40) && _root.levelButtons.levelTimer._xscale > 10) _root.levelButtons.levelTimer._xscale = _root.levelButtons.levelTimer._yscale -= 5;
			if (Key.isDown(39) && _root.levelButtons.levelTimer._alpha <= 95) bfdia5b.data.timerMod.config.levelTimerOpacity += 5;
			else if (Key.isDown(37) && _root.levelButtons.levelTimer._alpha > 10) bfdia5b.data.timerMod.config.levelTimerOpacity -= 5;
			_root.levelButtons.levelTimer._x = _xmouse - _root.levelButtons.levelTimer._xscale / 100 * timerOffset2X;
			_root.levelButtons.levelTimer._y = _ymouse - _root.levelButtons.levelTimer._yscale / 100 * timerOffset2Y;
			bfdia5b.data.timerMod.config.levelTimer[0] = _root.levelButtons.levelTimer._x;
			bfdia5b.data.timerMod.config.levelTimer[1] = _root.levelButtons.levelTimer._y;
			bfdia5b.data.timerMod.config.levelTimerScale[0] = _root.levelButtons.levelTimer._xscale;
			bfdia5b.data.timerMod.config.levelTimerScale[1] = _root.levelButtons.levelTimer._yscale;
			_root.levelButtons.levelTimer._alpha = bfdia5b.data.timerMod.config.levelTimerOpacity;
			bfdia5b.flush();
		} else if(_root.levelButtons.levelKeys._x <= _xmouse && _xmouse <= _root.levelButtons.levelKeys._x + _root.levelButtons.levelKeys._width &&
		   _root.levelButtons.levelKeys._y <= _ymouse && _ymouse <= _root.levelButtons.levelKeys._y + _root.levelButtons.levelKeys._height){
			var keysOffset2X = _root.levelButtons.levelKeys._xmouse, keysOffset2Y = _root.levelButtons.levelKeys._ymouse;
			if (Key.isDown(38)) _root.levelButtons.levelKeys._xscale = _root.levelButtons.levelKeys._yscale += 5;
			else if (Key.isDown(40) && _root.levelButtons.levelKeys._xscale > 10) _root.levelButtons.levelKeys._xscale = _root.levelButtons.levelKeys._yscale -= 5;
			if (Key.isDown(39) && _root.levelButtons.levelKeys._alpha <= 95) bfdia5b.data.timerMod.config.levelKeysOpacity += 5;
			else if (Key.isDown(37) && _root.levelButtons.levelKeys._alpha > 10) bfdia5b.data.timerMod.config.levelKeysOpacity -= 5;
			_root.levelButtons.levelKeys._x = _xmouse - _root.levelButtons.levelKeys._xscale / 100 * keysOffset2X;
			_root.levelButtons.levelKeys._y = _ymouse - _root.levelButtons.levelKeys._yscale / 100 * keysOffset2Y;
			bfdia5b.data.timerMod.config.levelKeys[0] = _root.levelButtons.levelKeys._x;
			bfdia5b.data.timerMod.config.levelKeys[1] = _root.levelButtons.levelKeys._y;
			bfdia5b.data.timerMod.config.levelKeysScale[0] = _root.levelButtons.levelKeys._xscale;
			bfdia5b.data.timerMod.config.levelKeysScale[1] = _root.levelButtons.levelKeys._yscale;
			_root.levelButtons.levelKeys._alpha = bfdia5b.data.timerMod.config.levelKeysOpacity;
			bfdia5b.flush();
		}
	}
	Key.addListener(keyListener);

	_root.attachMovie("levelButtons","levelButtons",9);
	_root.levelButtons.levelTimer._x = bfdia5b.data.timerMod.config.levelTimer[0] || 4;
	_root.levelButtons.levelTimer._y = bfdia5b.data.timerMod.config.levelTimer[1] || 3;
	_root.levelButtons.levelTimer._xscale = bfdia5b.data.timerMod.config.levelTimerScale[0] || 70;
	_root.levelButtons.levelTimer._yscale = bfdia5b.data.timerMod.config.levelTimerScale[1] || 70;
	_root.levelButtons.levelTimer._alpha = bfdia5b.data.timerMod.config.levelTimerOpacity || 60;
	_root.levelButtons.levelKeys._x = bfdia5b.data.timerMod.config.levelKeys[0] || 695;
	_root.levelButtons.levelKeys._y = bfdia5b.data.timerMod.config.levelKeys[1] || 3;
	_root.levelButtons.levelKeys._xscale = bfdia5b.data.timerMod.config.levelKeysScale[0] || 60;
	_root.levelButtons.levelKeys._yscale = bfdia5b.data.timerMod.config.levelKeysScale[1] || 60;
	_root.levelButtons.levelKeys._alpha = bfdia5b.data.timerMod.config.levelKeysOpacity || 45;

	_root.levelButtons.levelKeys.useHandCursor = true;
	_root.levelButtons.levelKeys.zKey.keyText.text = "z";
	_root.levelButtons.levelKeys.rKey.keyText.text = "r";
	_root.levelButtons.levelKeys.spaceKey.keyText.text = "[Y to hide]";
	_root.levelButtons.levelKeys.spaceKey.keyText.textColor = 0xFFFFFF;
	_root.levelButtons.levelKeys.leftArrowKey.keyText.text = "←";
	_root.levelButtons.levelKeys.upArrowKey.keyText.text = "↑";
	_root.levelButtons.levelKeys.rightArrowKey.keyText.text = "→";
	_root.levelButtons.levelKeys.downArrowKey.keyText.text = "↓";
	_root.levelButtons.levelKeys.enterKey.returnArrow._alpha = 100;
	_root.levelButtons.levelMapButton.onRelease = function(){
		_root.levelButtons.removeMovieClip();
		Key.removeListener(keyListener);
		drawLevelMap();
	}
	_root.levelButtons.textie.text = "Drag to organize; R to reset";
	menuScreen = 6;

	var timerPress = keysPress = false;
	var timerOffsetX = timerOffsetY = keysOffsetX = keysOffsetY = 0;
	
	_root.levelButtons.levelTimer.onRollOver = function(){
		_root.levelButtons.levelTimer._alpha = 3/4 * bfdia5b.data.timerMod.config.levelTimerOpacity;
		_root.levelButtons.useHandCursor = true;
	}
	_root.levelButtons.levelTimer.onRollOut = _root.levelButtons.levelTimer.onReleaseOutside = function(){
		_root.levelButtons.levelTimer._alpha = bfdia5b.data.timerMod.config.levelTimerOpacity;
		_root.levelButtons.useHandCursor = false;
		timerPress = false;
	}
	_root.levelButtons.levelTimer.onPress = function(){
		_root.levelButtons.levelTimer._alpha = 1/2 * bfdia5b.data.timerMod.config.levelTimerOpacity;
		timerOffsetX = _root.levelButtons.levelTimer._xmouse;
		timerOffsetY = _root.levelButtons.levelTimer._ymouse;
		timerPress = true;
	}
	_root.levelButtons.levelTimer.onMouseMove = function(){
		if(timerPress){
			_root.levelButtons.levelTimer._x = _xmouse - _root.levelButtons.levelTimer._xscale / 100 * timerOffsetX;
			_root.levelButtons.levelTimer._y = _ymouse - _root.levelButtons.levelTimer._yscale / 100 * timerOffsetY;
		}
	}
	_root.levelButtons.levelTimer.onRelease = function(){
		_root.levelButtons.levelTimer._alpha = 3/4 * bfdia5b.data.timerMod.config.levelTimerOpacity;
		timerPress = false;
		bfdia5b.data.timerMod.config.levelTimer[0] = _root.levelButtons.levelTimer._x;
		bfdia5b.data.timerMod.config.levelTimer[1] = _root.levelButtons.levelTimer._y;
		bfdia5b.flush();
	}

	_root.levelButtons.levelKeys.onRollOver = function(){
		_root.levelButtons.levelKeys._alpha = 3/4 * bfdia5b.data.timerMod.config.levelKeysOpacity;
		_root.levelButtons.useHandCursor = true;
	}
	_root.levelButtons.levelKeys.onRollOut = _root.levelButtons.levelKeys.onReleaseOutside = function(){
		_root.levelButtons.levelKeys._alpha = bfdia5b.data.timerMod.config.levelKeysOpacity;
		_root.levelButtons.useHandCursor = false;
		keysPress = false;
	}
	_root.levelButtons.levelKeys.onPress = function(){
		_root.levelButtons.levelKeys._alpha = 1/2 * bfdia5b.data.timerMod.config.levelKeysOpacity;
		keysOffsetX = _root.levelButtons.levelKeys._xmouse;
		keysOffsetY = _root.levelButtons.levelKeys._ymouse;
		keysPress = true;
	}
	_root.levelButtons.levelKeys.onMouseMove = function(){
		if(keysPress){
			_root.levelButtons.levelKeys._x = _xmouse - _root.levelButtons.levelKeys._xscale / 100 * keysOffsetX;
			_root.levelButtons.levelKeys._y = _ymouse - _root.levelButtons.levelKeys._yscale / 100 * keysOffsetY;
		}
	}
	_root.levelButtons.levelKeys.onRelease = function(){
		_root.levelButtons.levelKeys._alpha = 3/4 * bfdia5b.data.timerMod.config.levelKeysOpacity;
		keysPress = false;
		bfdia5b.data.timerMod.config.levelKeys[0] = _root.levelButtons.levelKeys._x;
		bfdia5b.data.timerMod.config.levelKeysY[1] = _root.levelButtons.levelKeys._y;
		bfdia5b.flush();
	}

}
function addCommas(i:Number){
	var iStr:String = String(i);
	var iStr2:String = "";
	var len:Number = iStr.length;
	for(var j:Number = 0; j < len; j++){
		if((len-j)%3 == 0 && j != 0) iStr2 += ",";
		iStr2 += iStr.charAt(j);
	}
	return iStr2;
}
function calcDist(i:Number){
	return Math.sqrt(Math.pow(char[i].x-locations[2]*30+15,2)+Math.pow(char[i].y-char[i].h/2-locations[3]*30+15,2));
}
function drawLevelCreator(){
	_root.attachMovie("levelCreator","levelCreator",0,{_x:0,_y:0});
	levelCreator.createEmptyMovieClip("grid",100);
	levelCreator.createEmptyMovieClip("tiles",98);
	levelCreator.createEmptyMovieClip("rectSelect",99);
	menuScreen = 5;
	selectedTab = 0;
	levelWidth = 32;
	tool = 0;
	levelHeight = 18;
	clearMyWholeLevel();
	drawLCGrid();
	fillTilesTab();
	charCount2 = 0;
	charCount = 0;
	setEndGateLights();
	LCEndGateX = -1;
	LCEndGateY = -1;
	levelCreator.sideBar.tab1.gotoAndStop(1);
	for(var i:Number = 0; i < 10; i++){
		levelCreator.tools["tool"+i].gotoAndStop(2);
	}
	levelCreator.tools.tool9.gotoAndStop(1);
}
function setTool(i:Number){
	levelCreator.tools["tool"+tool].gotoAndStop(2);
	tool = i;
	if(tool == 2 || tool == 5){
		clearRectSelect();
	}
	levelCreator.tools["tool"+tool].gotoAndStop(1);
}
function clearRectSelect(){
	levelCreator.rectSelect.clear();
	LCRect = [-1,-1,-1,-1];
}
function fillTilesTab(){
	levelCreator.sideBar.tab4.createEmptyMovieClip("tiles",1);
	for(var i:Number = 0; i < tileCount; i++){
		levelCreator.sideBar.tab4.tiles.attachMovie("LEtile3","tile"+i,i,{_x:(i%5)*60+15,_y:Math.floor(i/5)*60+55});
		levelCreator.sideBar.tab4.tiles["tile"+i].gotoAndStop(i+1);
	}
	levelCreator.sideBar.tab4.attachMovie("burst1","selector",0,{_x:30,_y:70, _xscale:100,_yscale:75});
	setSelectedTile(1000);
}
function setSelectedTile(i:Number){
	selectedTile = i;
	var x:Number = (i%5)*60+30;
	var y:Number = Math.floor(i/5)*60+70;
	levelCreator.sideBar.tab4.selector._x = x;
	levelCreator.sideBar.tab4.selector._y = y;
}
function setEndGateLights(){
	levelCreator.sideBar.tab4.tiles.tile6.light.gotoAndStop(charCount+1);
	if(LCEndGateX >= 0){
		levelCreator.tiles["tileX"+LCEndGateX+"Y"+LCEndGateY].light.gotoAndStop(charCount+1);
	}
}
function clearMyWholeLevel(){
	myLevel = new Array(3);
	for(var i:Number = 0; i < 3; i++){
		clearMyLevel(i);
	}
}
function clearMyLevel(i:Number){
	myLevel[i] = new Array(levelHeight);
	for(var j:Number = 0; j < levelHeight; j++){
		myLevel[i][j] = new Array(levelWidth);
		for(var k:Number = 0; k < levelWidth; k++){
			myLevel[i][j][k] = 0;
		}
	}
}
function drawLCGrid(){
	scale = Math.min(640/levelWidth,460/levelHeight);
	levelCreator.grid.lineStyle(scale/9,0,50);
	for(var i:Number = 0; i <= levelWidth; i++){
		levelCreator.grid.moveTo(330-scale*levelWidth/2+i*scale,240-scale*levelHeight/2);
		levelCreator.grid.lineTo(330-scale*levelWidth/2+i*scale,240+scale*levelHeight/2);
	}
	for(var i:Number = 0; i <= levelHeight; i++){
		levelCreator.grid.moveTo(330-scale*levelWidth/2,240-scale*levelHeight/2+i*scale);
		levelCreator.grid.lineTo(330+scale*levelWidth/2,240-scale*levelHeight/2+i*scale);
	}
	addLCTiles();
	updateLCTiles();
}
function clearLCGrid(){
	levelCreator.grid.clear();
	removeLCTiles();
}
function addLCTiles(){
	for(var y:Number = 0; y < levelHeight; y++){
		for(var x:Number = 0; x < levelWidth; x++){
			var x2:Number = 330-scale*levelWidth/2+x*scale;
			var y2:Number = 240-scale*levelHeight/2+y*scale;
			levelCreator.tiles.attachMovie("LEtile2","tileX"+x+"Y"+y,y*levelWidth+x,{_x:x2,_y:y2,_xscale:scale*100/30,_yscale:scale*100/30});
			levelCreator.tiles["tileX"+x+"Y"+y].gotoAndStop(myLevel[1][y][x]+1);
		}
	}
}
function removeLCTiles(){
	for(var y:Number = 0; y < levelHeight; y++){
		for(var x:Number = 0; x < levelWidth; x++){
			levelCreator.tiles["tileX"+x+"Y"+y].removeMovieClip();
		}
	}
}
function updateLCtiles(){
	for(var y:Number = 0; y < levelHeight; y++){
		for(var x:Number = 0; x < levelWidth; x++){
			levelCreator.tiles["tileX"+x+"Y"+y].gotoAndStop(myLevel[1][y][x]+1);
		}
	}
}
function fillTile(x:Number,y:Number,after:Number,before:Number){
	var rc:Array = [[x,y]];
	while(rc.length >= 1){
		for(var i:Number = 0; i < 4; i++){
			if((i == 3 && x == levelWidth-1) || (i == 2 && x == 0) ||
				(i == 1 && y == levelHeight-1) || (i == 0 && y == 0)){
			}else{
				var x2:Number = rc[0][0]+cardinal[i][0];
				var y2:Number = rc[0][1]+cardinal[i][1];
				if(myLevel[1][y2][x2] == before){
					rc.push([x2,y2]);
					myLevel[1][y2][x2] = after;
					levelCreator.tiles["tileX"+x2+"Y"+y2].gotoAndStop(after+1);
				}
			}
		}
		rc.shift();
	}
}
function setSelectedTab(i:Number){
	selectedTab = i;
	if(i == 0){
		setTexties();
	}else{
		setTexties2();
	}
}
function setTexties(){
	for(var i:Number = 1; i <= 3; i++){
		levelCreator.sideBar.tab1["textie"+i].selectable = true;
	}
}
function setTexties2(){
	for(var i:Number = 1; i <= 3; i++){
		levelCreator.sideBar.tab1["textie"+i].selectable = false;
	}
}
function setUndo(){
	LCSwapLevelData(1,0);
	undid = false;
	levelCreator.tools.tool9.gotoAndStop(1);
}
function undo(){
	LCSwapLevelData(1,2);
	LCSwapLevelData(0,1);
	LCSwapLevelData(2,0);
	if(undid){
		levelCreator.tools.tool9.gotoAndStop(1);
	}else{
		levelCreator.tools.tool9.gotoAndStop(2);
	}
	undid = !undid;
}
function LCSwapLevelData(a:Number,b:Number){
	myLevel[b] = new Array(myLevel[a].length);
	for(var y:Number = 0; y < levelHeight; y++){
		myLevel[b][y] = new Array(myLevel[a][0].length);
		for(var x:Number = 0; x < levelWidth; x++){
			myLevel[b][y][x] = myLevel[a][y][x];
			if(b == 1) levelCreator.tiles["tileX"+x+"Y"+y].gotoAndStop(myLevel[b][y][x]+1);
		}
	}
}
function drawLCRect(x1:Number, y1:Number, x2:Number, y2:Number){
	levelCreator.rectSelect.clear();
	levelCreator.rectSelect.lineStyle(1,0,0);
	levelCreator.rectSelect.beginFill(0xFFFF00,50);
	levelCreator.rectSelect.moveTo(x1*scale+(330-scale*levelWidth/2),y1*scale+(240-scale*levelHeight/2));
	levelCreator.rectSelect.lineTo((x2+1)*scale+(330-scale*levelWidth/2),y1*scale+(240-scale*levelHeight/2));
	levelCreator.rectSelect.lineTo((x2+1)*scale+(330-scale*levelWidth/2),(y2+1)*scale+(240-scale*levelHeight/2));
	levelCreator.rectSelect.lineTo(x1*scale+(330-scale*levelWidth/2),(y2+1)*scale+(240-scale*levelHeight/2));
	levelCreator.rectSelect.lineTo(x1*scale+(330-scale*levelWidth/2),y1*scale+(240-scale*levelHeight/2));
	levelCreator.rectSelect.endFill();
}
function closeToEdgeY(){
	var y2:Number = ((_ymouse-(240-scale*levelHeight/2))/scale)%1;
	return (Math.abs(y2-0.5) > 0.25);
}
function closeToEdgeX(){
	var x2:Number = ((_xmouse-(330-scale*levelWidth/2))/scale)%1;
	return (Math.abs(x2-0.5) > 0.25);
}
function playLevel(i:Number){
	if(i == levelProgress){
		playMode = 0;
	}else if(i < levelProgress){
		playMode = 1;
	}
	currentLevel = i;
	wipeTimer = 30;
	_root.attachMovie("csBubble","csBubble",8);
	_root.createEmptyMovieClip("HPRCBubble",7);
	_root.createEmptyMovieClip("levelChar",5);
	addTileMovieClips();
	_root.attachMovie("bg","bg",0);
	levelStill.cacheAsBitmap = true;
	levelStill.cacheAsBitmap = true;
	levelShadow.cacheAsBitmap = true;
	bg.cacheAsBitmap = true;
	menuScreen = 3;
	_root.attachMovie("levelButtons","levelButtons",9);
	toSeeCS = true;
	transitionType = 1;
	resetLevel();
	levelButtons.levelMapButton.onRelease = function(){
		timer += levelTimer2;
		saveGame();
		exitLevel();
	}
	levelButtons.levelTimer._x = bfdia5b.data.timerMod.config.levelTimer[0] || 4;
	levelButtons.levelTimer._y = bfdia5b.data.timerMod.config.levelTimer[1] || 3;
	levelButtons.levelTimer._xscale = bfdia5b.data.timerMod.config.levelTimerScale[0] || 70;
	levelButtons.levelTimer._yscale = bfdia5b.data.timerMod.config.levelTimerScale[1] || 70;
	levelButtons.levelTimer._alpha = bfdia5b.data.timerMod.config.levelTimerOpacity || 60;
	levelButtons.levelKeys._x = bfdia5b.data.timerMod.config.levelKeys[0] || 695;
	levelButtons.levelKeys._y = bfdia5b.data.timerMod.config.levelKeys[1] || 3;
	levelButtons.levelKeys._xscale = bfdia5b.data.timerMod.config.levelKeysScale[0] || 60;
	levelButtons.levelKeys._yscale = bfdia5b.data.timerMod.config.levelKeysScale[1] || 60;
	levelButtons.levelKeys._alpha = bfdia5b.data.timerMod.config.levelKeysOpacity || 45;
	if(best[i]) levelButtons.levelTimer.bestTime.text = toHMS2(best[i]);
	levelButtons.levelKeys.zKey.keyText.text = "z";
	levelButtons.levelKeys.rKey.keyText.text = "r";
	levelButtons.levelKeys.leftArrowKey.keyText.text = "←";
	levelButtons.levelKeys.upArrowKey.keyText.text = "↑";
	levelButtons.levelKeys.rightArrowKey.keyText.text = "→";
	levelButtons.levelKeys.downArrowKey.keyText.text = "↓";
	levelButtons.levelKeys.enterKey.returnArrow._alpha = 100;
}
function addTileMovieClips(){
	_root.createEmptyMovieClip("levelActive3",6);
	_root.createEmptyMovieClip("levelActive2",4);
	_root.createEmptyMovieClip("levelShadow",3);
	_root.createEmptyMovieClip("levelActive",2);
	_root.createEmptyMovieClip("levelStill",1);
}
function removeTileMovieClips(){
	_root.levelActive.removeMovieClip();
	_root.levelStill.removeMovieClip();
	_root.levelActive2.removeMovieClip();
	_root.levelActive3.removeMovieClip();
	_root.levelShadow.removeMovieClip();
}
function exitLevel(){
	_root.csBubble.removeMovieClip();
	 removeTileMovieClips();
	_root.levelChar.removeMovieClip();
	_root.bg.removeMovieClip();
	_root.levelButtons.removeMovieClip();
	drawLevelMap();
}
function mouseOnGrid(){
	return (_xmouse >= 330-scale*levelWidth/2 && _xmouse <= 330+scale*levelWidth/2 &&
			_ymouse >= 240-scale*levelHeight/2 && _ymouse <= 240+scale*levelHeight/2);
}
function mouseOnScreen(){
	return (_xmouse < 660 && _ymouse < 480);
}
var selectedTab:Number = 0;
var power:Number = 1;
var jumpPower:Number = 11;
var qPress:Boolean = false;
var upPress:Boolean = false;
var csPress:Boolean = false;
var downPress:Boolean = false;
var leftPress:Boolean = false;
var rightPress:Boolean = false;
var recover:Boolean = false;
var recover2:Number = 0;
var recoverTimer:Number = 0;
var HPRC2:Number = 0;
var cornerHangTimer:Number = 0;
var goal = 0;
var charsAtEnd:Number = 0;
var qPressTimer:Number = 0;
var transitionType:Number = 1;
var char:Array = new Array(1);

var currentLevel:Number = -1;
var control:Number = 0;
var wipeTimer:Number = 30;
var cutScene:Number = 0;
var cutSceneLine:Number = 0;

var bubWidth:Number = 500;
var bubHeight:Number = 100;
var bubMargin:Number = 40;
var charDepth:Number = 0;

var levelWidth:Number = 0;
var levelHeight:Number = 0;
var cameraX:Number = 0;
var cameraY:Number = 0;
var menuScreen = 0;
var myLevel:Array;
var scale:Number = 20;
var tool:Number = 0;
var selectedTile:Number = 0;
var mouseIsDown:Boolean = false;
var LCEndGateX:Number = 0;
var LCEndGateY:Number = 0;
var cardinal:Array = [[0,-1],[0,1],[-1,0],[1,0]];
var diagonal:Array = [[-1,-1],[1,-1],[1,1],[-1,1]];
var diagonal2:Array = [[0,2],[0,3],[1,2],[1,3]];
var undid:Boolean = false;
var LCRect:Array = [-1,-1,-1,-1];
var levelTimer:Number = 0;
var levelTimer2:Number = 0;
var bgXScale:Number = 0;
var bgYscale:Number = 0;
var stopX:Number = 0;
var stopY:Number = 0;
var toBounce:Boolean = false;
var toSeeCS:Boolean = true;

var tPress = false, yPress = false;

_root.attachMovie("white","white",10,{_alpha:0});
onEnterFrame = function(){
	if(wipeTimer != 30) levelTimer2 += 1000 / 60; // we're adding 1000ms to the timer every 60 frames because 60fps
	if(menuScreen != 6) levelButtons.levelTimer.timer.text = toHMS2(levelTimer2);
	else levelButtons.levelTimer.timer.text = "[T to hide]";
	

	if(!best[currentLevel] && menuScreen != 6) levelButtons.levelTimer.bestTime.text = toHMS2(levelTimer2);
	else if (menuScreen == 6) levelButtons.levelTimer.bestTime.text = "[↑/↓ to scale]";
	if (menuScreen != 6) levelButtons.levelTimer.totalTime.text = toHMS(timer + levelTimer2);
	else levelButtons.levelTimer.totalTime.text = "[←/→ opacity]";

	levelButtons.levelTimer._visible = bfdia5b.data.timerMod.config.showTimer;
	levelButtons.levelKeys._visible = bfdia5b.data.timerMod.config.showKeys;
	if(Key.isDown(84) && !tPress){
		tPress = true;
		levelButtons.levelTimer._visible = !levelButtons.levelTimer._visible;
		bfdia5b.data.timerMod.config.showTimer = !bfdia5b.data.timerMod.config.showTimer;
		bfdia5b.flush();
	} else if(!Key.isDown(84)) tPress = false;
	if(Key.isDown(89) && !yPress){
		yPress = true;
		levelButtons.levelKeys._visible = !levelButtons.levelKeys._visible;
		bfdia5b.data.timerMod.config.showKeys = !bfdia5b.data.timerMod.config.showKeys;
		bfdia5b.flush();
	} else if(!Key.isDown(89)) yPress = false;

	levelButtons.levelKeys.zKey.gotoAndStop(2 - !Key.isDown(90));
	levelButtons.levelKeys.rKey.gotoAndStop(2 - !Key.isDown(82));
	levelButtons.levelKeys.spaceKey.gotoAndStop(2 - !Key.isDown(32));
	levelButtons.levelKeys.leftArrowKey.gotoAndStop(2 - !Key.isDown(37));
	levelButtons.levelKeys.upArrowKey.gotoAndStop(2 - !Key.isDown(38));
	levelButtons.levelKeys.rightArrowKey.gotoAndStop(2 - !Key.isDown(39));
	levelButtons.levelKeys.downArrowKey.gotoAndStop(2 - !Key.isDown(40));
	levelButtons.levelKeys.enterKey.gotoAndStop(2 - !(Key.isDown(13) || Key.isDown(16)));
	levelButtons.levelKeys.enterKey2.gotoAndStop(2 - !(Key.isDown(13) || Key.isDown(16)));

	if(menuScreen == 0){
		drawMenu();
		menuScreen = 1;
	}
	if(menuScreen == 2){
		if(_xmouse < 587 || _ymouse < 469){
			if(_ymouse <= 180){
				cameraY = Math.min(Math.max(cameraY-(180-_ymouse)*0.1,0),1080);
			}else if(_ymouse >= 360){
				cameraY = Math.min(Math.max(cameraY+(_ymouse-360)*0.1,0),1080);
			}
			levelMap._y = -cameraY;
		}
	}
	if(menuScreen == 3 || menuScreen == 4){
		if(wipeTimer == 30){
			if(transitionType == 0){ //resetting preexisting level
				timer += levelTimer2;
				resetLevel();
			}else{
				if(menuScreen == 4 && charsAtEnd >= charCount2){ //beat the level!
					if(gotThisCoin && !gotCoin[currentLevel]){
						gotCoin[currentLevel] = true;
						coins++;
					}
					timer += levelTimer2;
					best[currentLevel] = Math.min(best[currentLevel] || Infinity, levelTimer2);
					prev[currentLevel] = levelTimer2;
					if(playMode == 0){
						currentLevel++;
						levelProgress = currentLevel;
						resetLevel();
					}else{
						exitLevel();
					}
					saveGame();
				}
			}
		}
		if(menuScreen == 3) menuScreen = 4;
		if(cutScene == 1 || cutScene == 2){
			if(Key.isDown(Key.ENTER) || Key.isDown(Key.SHIFT)){
				if(!csPress && cutScene == 1){
					cutSceneLine++;
					if(cutSceneLine >= dialogueChar[currentLevel].length){
						endCutScene();
					}else{
						displayLine(currentLevel,cutSceneLine);
					}
				}
				csPress = true;
			}else{
				csPress = false;
				if(cutScene == 2) cutScene = 3;
			}
		}else{
			if(levelChar["char"+control].burst._currentframe == 2) levelChar["char"+control].burst.play();
			if(recover){
				char[control].justChanged = 2;
				if(recoverTimer == 0){
					if(Key.isDown(Key.LEFT)){
						if(!leftPress) recoverCycle(HPRC2,-1);
						leftPress = true;
					}else{
						leftPress = false;
					}
					if(Key.isDown(Key.RIGHT)){
						if(!rightPress) recoverCycle(HPRC2,1);
						rightPress = true;
					}else{
						rightPress = false;
					}
				}
			}else{
				if(cornerHangTimer == 0){
					if(Key.isDown(Key.LEFT)){
						char[control].moveHorizontal(-power);
					}else if(Key.isDown(Key.RIGHT)){
						char[control].moveHorizontal(power);
					}
				}
				if(!Key.isDown(Key.LEFT) && !Key.isDown(Key.RIGHT)) char[control].stopMoving();
			}
			if(Key.isDown(Key.UP)){
				if(!upPress){
					if(recover && recoverTimer == 0){
						recoverTimer = 60;
						char[recover2].charState = 2;
						char[recover2].x = char[HPRC1].x;
						char[recover2].y = char[HPRC1].y-20;
						char[recover2].vx = 0;
						char[recover2].vy = -1;
						levelChar["char"+recover2]._x = char[recover2].x;
						levelChar["char"+recover2]._y = char[recover2].y;
						levelChar["char"+recover2].charBody.gotoAndStop(4);
						levelChar["char"+recover2]._visible = true;
						if(char[recover2].id == 5){
							levelChar["char"+recover2].leg1._visible = true;
							levelChar["char"+recover2].leg2._visible = true;
						}
						levelChar["char"+recover2].leg1.gotoAndStop(2);
						levelChar["char"+recover2].leg2.gotoAndStop(2);
						levelChar["char"+recover2]._alpha = 100;
						HPRCBubble.charImage.gotoAndStop(1);
						goal = Math.round(char[HPRC1].x/30)*30;
					}else if(char[control].id != 2 && !recover && char[control].deathTimer >= 30){
						if(char[control].carry){
							putDown(control);
							charThrow(control);
						}else{
							for(var i = 0; i < charCount; i++){
								if(i != control && near(control, i) && char[i].charState >= 6 && char[control].standingOn != i &&
								onlyMovesOneBlock(i, control)){
									if(char[i].carry) putDown(i);
									if(ifCarried(i)) putDown(char[i].carriedBy);
									char[control].carry = true;
									char[control].carryObject = i;
									levelChar["char"+i].swapDepths(charDepth+charCount*2-control*2+1);
									char[i].carriedBy = control;
									char[i].weight2 = char[i].weight;
									char[control].weight2 = char[i].weight+char[control].weight;
									rippleWeight(control, char[i].weight2, 1);
									fallOff(i);
									aboveFallOff(i);
									char[i].justChanged = 2;
									char[control].justChanged = 2;
									if(char[i].submerged == 1) char[i].submerged = 0;
									if(char[i].onob && char[control].y-char[i].y > yOff(i)){
										char[control].y = char[i].y+yOff(i);
										char[control].onob = false;
										char[i].onob = true;
									}
									break;
								}
							}
						}
					}
				}
				upPress = true;
			}else{
				upPress = false;
			}
			if(Key.isDown(Key.DOWN)){
				if(!downPress){
					if(char[control].carry){
						putDown(control);
					}else{
						if(recover){
							if(recoverTimer == 0){
								recover = false;
								HPRCBubble.charImage.gotoAndStop(1);
							}
						}else{
							if(near2(control, HPRC2) && char[control].id != 2 && char[control].onob){
								char[control].stopMoving();
								if(char[control].x >= char[HPRC2].x-33){
									char[control].dire = 2;
								}else{
									char[control].dire = 4;
								}
								recover = true;
								recover2 = charCount-1;
								recoverCycle(HPRC2,0);
								break;
							}
						}
					}
				}
				downPress = true;
			}else{
				downPress = false;
			}
			if(Key.isDown(90)){
				if(!qPress && !recover){
					changeControl();
					qTimer = 6;
				}
				qPress = true;
			}else{
				qPress = false;
			}
			if(Key.isDown(Key.SPACE)){
				if((char[control].onob || char[control].submerged == 3) && char[control].landTimer > 2 && !recover){
					if(char[control].submerged == 3){
						char[control].swimUp(0.14/char[control].weight2);
					}else{
						char[control].jump(-jumpPower);
					}
					char[control].onob = false;
					fallOff(control);
				}
			}else{
				char[control].landTimer = 80;
			}
		}
		if(Key.isDown(82) && wipeTimer == 0){
			wipeTimer = 1;
			transitionType = 0;
			if(cutScene == 1) csBubble.gotoAndPlay(17);
		}
		locations[4] = 1000;
		for(var i:Number = 0; i < charCount; i++){
			if(char[i].charState >= 5){
				char[i].landTimer++;
				if(char[i].carry && char[char[i].carryObject].justChanged < char[i].justChanged) char[char[i].carryObject].justChanged = char[i].justChanged;
				if(char[i].standingOn == -1){
					if(char[i].onob){
						if(char[i].charState >= 5){
							char[i].fricGoal = onlyConveyorsUnder(i);
						}
					}
				}else{
					char[i].fricGoal = char[char[i].standingOn].vx;
				}
				char[i].applyForces(char[i].weight2, (control == i), jumpPower*0.7);
				if(char[i].deathTimer >= 30) char[i].charMove();
				if(char[i].id == 3){
					if(char[i].temp > 50){
						levelChar["char"+i].fire.gotoAndStop(2);
						for(var j:Number = 0 ; j < charCount; j++){
							if(char[j].charState >= 5 && j != i){
								if(Math.abs(char[i].x-char[j].x) < char[i].w+char[j].w && char[j].y > char[i].y-char[i].h && char[j].y < char[i].y+char[j].h){
									char[j].heated = 2;
									heat(j);
								}
							}
						}
					}else{
						levelChar["char"+i].fire.gotoAndStop(1);
					}
				}
			}else if(char[i].charState >= 3){
				var section = Math.floor(levelTimer/char[i].speed)%(startLocations[currentLevel][i][6].length-2);
				char[i].vx = cardinal[startLocations[currentLevel][i][6][section+2]][0]*(30/char[i].speed);
				char[i].vy = cardinal[startLocations[currentLevel][i][6][section+2]][1]*(30/char[i].speed);
				char[i].px = char[i].x;
				char[i].py = char[i].y;
				char[i].charMove();
			}
			if(char[i].charState == 3 || char[i].charState == 5){
				for(var j:Number = 0 ; j < charCount; j++){
					if(char[j].charState >= 7 && j != i){
						if(Math.abs(char[i].x-char[j].x) < char[i].w+char[j].w && char[j].y > char[i].y-char[i].h && char[j].y < char[i].y+char[j].h){
							startDeath(j);
						}
					}
				}
			}
			if(char[i].justChanged >= 1){
				if(char[i].standingOn >= 1){
					if(char[char[i].standingOn].charState == 4) char[i].justChanged = 2;
				}
				if(char[i].stoodOnBy.length >= 1){
					for(var j:Number = 0; j < char[i].stoodOnBy.length; j++){
						char[char[i].stoodOnBy[j]].y = char[i].y-char[i].h;
						char[char[i].stoodOnBy[j]].vy = char[i].vy;
					}
				}else if(!char[i].carry && char[i].submerged >= 2){
					char[i].weight2 = char[i].weight-0.16;
				}
				if(char[i].charState >= 5 && !ifCarried(i)){
					if(char[i].vy > 0 || (char[i].vy == 0 && char[i].vx != 0)) landOnObject(i);
					if(char[i].vy < 0 && (char[i].charState == 4 || char[i].charState == 6) && !ifCarried(i)) objectsLandOn(i);
				}
			}
			if(char[i].charState >= 7 && char[i].charState != 9 && !gotThisCoin){
				var dist:Number = calcDist(i);
				if(dist < locations[4]){
					locations[4] = dist;
					locations[5] = i;
				}
			}
		}
		var alph;
		if(!gotThisCoin) alph = 140-locations[4]*0.7;
		if(gotCoin[currentLevel]) alph = Math.max(alph,30);
		levelActive["tileX"+locations[2]+"Y"+locations[3]]._alpha = alph;
		for(var i:Number = 0 ; i < charCount; i++){
			if(char[i].vy != 0 || char[i].vx != 0 || char[i].x != char[i].px || char[i].py != char[i].y) char[i].justChanged = 2;
			if(char[i].charState == 2){
				recoverTimer--;
				var trans = (60-recoverTimer)/60;
				levelChar["char"+i]._yscale = trans*100;
				levelChar["char"+i]._x = inter(char[HPRC1].x,goal,trans)
				if(recoverTimer <= 0){
					recoverTimer = 0;
					recover = false;
					char[recover2].dire = 4;
					char[recover2].charState = char[recover2].pcharState;
					char[recover2].deathTimer = 30;
					char[recover2].x = goal;
					char[recover2].px = char[recover2].x;
					char[recover2].py = char[recover2].y;
					char[recover2].justChanged = 2;
					checkDeath(i);
				}
			}else if(char[i].justChanged >= 1 && char[i].charState >= 5){
				for(var y:Number = Math.floor((char[i].y-char[i].h)/30); y <= Math.floor(char[i].y/30); y++){
					for(var x:Number = Math.floor((char[i].x-char[i].w)/30); x <= Math.floor((char[i].x+char[i].w-0.01)/30); x++){
						if(blockProperties[thisLevel[y][x]][11] >= 1 && blockProperties[thisLevel[y][x]][11] <= 12){
							if(Math.floor(char[i].x/30) == x){
								var rot:Number = (char[i].x-Math.floor(char[i].x/30)*30-15)*5;
								if((rot < levelActive2["tileX"+x+"Y"+y].lever._rotation && char[i].vx < 0) ||
									(rot > levelActive2["tileX"+x+"Y"+y].lever._rotation && char[i].vx > 0)){
									if((rot < 0 && levelActive2["tileX"+x+"Y"+y].lever._rotation > 0) ||
									(rot > 0 && levelActive2["tileX"+x+"Y"+y].lever._rotation < 0)){
										leverSwitch((blockProperties[thisLevel[y][x]][11]-1)%6);
									}
									levelActive2["tileX"+x+"Y"+y].lever._rotation = rot;
								}
							}
						}
					}
				}
				checkButton2(i,false);
				if(ifCarried(i)){
					char[i].vx = char[char[i].carriedBy].vx;
					char[i].vy = char[char[i].carriedBy].vy;
					if(char[char[i].carriedBy].x+xOff(i) >= char[i].x+20){
						char[i].x += 20;
					}else if(char[char[i].carriedBy].x+xOff(i) <= char[i].x-20){
						char[i].x -= 20;
					}else{
						char[i].x = char[char[i].carriedBy].x+xOff(i);
					}
					if(char[char[i].carriedBy].y-yOff(i) >= char[i].y+20){
						char[i].y += 20;
					}else if(char[char[i].carriedBy].y-yOff(i) <= char[i].y-20){
						char[i].y -= 20;
					}else{
						char[i].y = char[char[i].carriedBy].y-yOff(i);
					}
					char[i].dire = Math.ceil(char[char[i].carriedBy].dire/2)*2;
				}
				if(char[i].standingOn >= 0){
					char[i].y = char[char[i].standingOn].y-char[char[i].standingOn].h;
					char[i].vy = char[char[i].standingOn].vy;
				}
				stopX = 0;
				stopY = 0;
				toBounce = false;
				if(newTileHorizontal(i,1)){
					if(horizontalType(i,1,8) && char[i].charState == 10) startCutScene();
					if(horizontalProp(i,1,7,char[i].x,char[i].y) && char[i].charState >= 7){
						startDeath(i);
					}else if(char[i].x > char[i].px && horizontalProp(i,1,3,char[i].x,char[i].y)){
						stopX = 1;
					}
				}
				if(newTileHorizontal(i,-1)){
					if(horizontalType(i,-1,8) && char[i].charState == 10) startCutScene();
					if(horizontalProp(i,-1,6,char[i].x,char[i].y) && char[i].charState >= 7){
						startDeath(i);
					}else if(char[i].x < char[i].px && horizontalProp(i,-1,2,char[i].x,char[i].y)){
						stopX = -1;
					}
				}
				if(newTileDown(i)){
					if(verticalType(i,1,8,false) && char[i].charState == 10) startCutScene();
					if(verticalType(i,1,13,true)){
						toBounce = true;
					}else if(verticalProp(i,1,5,char[i].px,char[i].y) && char[i].charState >= 7){
						startDeath(i);
					}else if(char[i].y > char[i].py && verticalProp(i,1,1,char[i].px,char[i].y)){
						stopY = 1;
					}
				}
				if(newTileUp(i)){
					if(verticalType(i,-1,8,false) && char[i].charState == 10) startCutScene();
					if(verticalProp(i,-1,4,char[i].x,char[i].y) && char[i].charState >= 7){
						startDeath(i);
					}else if(char[i].y < char[i].py && verticalProp(i,-1,0,char[i].px,char[i].y)){
						stopY = -1;
					}
				}
				if(stopX != 0 && stopY != 0){//two coordinates changed at once! Make sure snags don't happen
					var y:Number;
					if(stopY == 1) y = Math.floor(char[i].y/30)*30;
					if(stopY == -1) y = Math.ceil((char[i].y-char[i].h)/30)*30+char[i].h;
					if(!horizontalProp(i,stopX,stopX/2+2.5,char[i].x,y)){
						stopX = 0; //prevent horizontal snag
					}else{
						var x:Number;
						if(stopX == 1) x = Math.floor((char[i].x+char[i].w)/30)*30-char[i].w;
						if(stopX == -1)x = Math.ceil((char[i].x-char[i].w)/30)*30+char[i].w;
						if(!verticalProp(i,stopY,stopY/2+0.5,x,char[i].y)){
							stopY = 0; //prevent vertical snag
						}
					}
				}
				if(stopX != 0){
					char[i].fricGoal = 0;
					if(char[i].submerged >= 2){
						var j:Number = i;
						if(ifCarried(i)) j = char[i].carriedBy;
						if(char[j].dire%2 == 1){
							char[j].swimUp(0.14/char[j].weight2);
							if(char[j].standingOn >= 0) fallOff(i);
							char[j].onob = false;
						}
					}
					if(char[i].id == 5) startDeath(i);
					if(stopX == 1){
						var x:Number = Math.floor((char[i].x+char[i].w)/30)*30-char[i].w;
					}else if(stopX == -1){
						var x:Number = Math.ceil((char[i].x-char[i].w)/30)*30+char[i].w;
					}
					char[i].x = x;
					char[i].vx = 0;
					stopCarrierX(i,x);
				}
				if(stopY != 0){
					if(stopY == 1){
						var y:Number = Math.floor(char[i].y/30)*30;
						if(!ifCarried(i)) cornerHangTimer = 0;
						fallOff(i);
						land(i, y, 0);
						land2(i, y);
						checkButton(i);
					}else if(stopY == -1){
						if(char[i].id == 5) startDeath(i);
						if(char[i].id == 3 && char[i].temp > 50) char[i].temp = 0;
						var y:Number = Math.ceil((char[i].y-char[i].h)/30)*30+char[i].h;
						char[i].y = y;
						char[i].vy = 0;
						bumpHead(i);
						if(ifCarried(i)){
							bumpHead(char[i].carriedBy);
						}
					}
					stopCarrierY(i,y,(stopY == 1));
				}
				if(newTileHorizontal(i,1) || newTileHorizontal(i,-1)){
					if(verticalType(i,1,13,true)) toBounce = true;
					if(horizontalProp(i,1,14,char[i].x,char[i].y) || horizontalProp(i,-1,14,char[i].x,char[i].y)) submerge(i);
					if(horizontalType(i,1,15) || horizontalType(i,-1,15)) char[i].heated = 1;
					checkButton(i);
				}
				if(newTileUp(i)){
					if(verticalProp(i,-1,14,char[i].x,char[i].y)) submerge(i);
					if(verticalType(i,-1,15,false)) char[i].heated = 1;
				}
				if(newTileDown(i)){
					if(verticalProp(i,1,14,char[i].x,char[i].y)) submerge(i);
					if(verticalType(i,1,15,false)) char[i].heated = 1;
				}
				if(char[i].submerged >= 2 && char[i].standingOn >= 0 && char[i].weight2 < 0) fallOff(i);
				if(char[i].submerged >= 2) unsubmerge(i);
				if(char[i].heated >= 1){
					heat(i);
				}else if(char[i].id != 3 || char[i].temp <= 50){
					if(char[i].temp >= 0){
						char[i].temp-=char[i].heatSpeed;
						char[i].justChanged = 2;
					}else{
						char[i].temp = 0;
					}
				}
				if(char[i].heated == 2) char[i].heated = 0;
				if(char[i].standingOn >= 0){
					var j:Number = char[i].standingOn;
					if(Math.abs(char[i].x-char[j].x) >= char[i].w+char[j].w || ifCarried(j)){
						fallOff(i);
					}
				}else{
					if(char[i].onob){
						if(!ifCarried(i) && char[i].standingOn == -1) char[i].y = Math.round(char[i].y/30)*30;
						if(!verticalProp(i,1,1,char[i].x,char[i].y)){
							char[i].onob = false;
							aboveFallOff(i);
							if(ifCarried(i)) cornerHangTimer = 0;
						}
						if(char[i].charState >= 7 && verticalProp(i,1,5,char[i].x,char[i].y)) startDeath(i);
					}
				}
			}
			if(char[i].charState >= 5){
				char[i].px = char[i].x;
				char[i].py = char[i].y;
				if(char[i].justChanged >= 1 && char[i].charState >= 5){
					if(toBounce) bounce(i);
					getCoin(i);
				}
				if(char[i].deathTimer < 30){
					if(char[i].id == 5 && char[i].deathTimer >= 7){
						char[i].deathTimer = 6;
						levelChar["char"+i].leg1._visible = false;
						levelChar["char"+i].leg2._visible = false;
					}
					char[i].deathTimer--;
					blinkDeath(i);
					if(char[i].deathTimer <= 0) endDeath(i);
				}else if(char[i].charState >= 7 && (char[i].justChanged >= 1 || levelTimer == 0)){
					setBody(i);
				}
				if(i == HPRC2){
					 if(!recover){
						levelChar["char"+i].charBody.textie.text = "";
					}else if(recoverTimer == 0){
						levelChar["char"+i].charBody.textie.text = "enter name";
					}else if(recoverTimer > 40){
						levelChar["char"+i].charBody.textie.text = names[char[recover2].id];
					}else if(recoverTimer > 10){
						levelChar["char"+i].charBody.textie.text = "Keep going";
					}else{
						levelChar["char"+i].charBody.textie.text = "Done";
					}
					levelChar["char"+i].charBody.crank._rotation = recoverTimer*12;
					if(!recover && HPRCBubble.charImage._currentframe <= 2){
						if(near(control, i) && numberOfDead() >= 1 && char[control].id != 2){
							HPRCBubble.charImage.gotoAndStop(2);
						}else{
							HPRCBubble.charImage.gotoAndStop(1);
						}
					}
				}
				if(char[i].y > levelHeight*30+160 && char[i].charState >= 7) startDeath(i);
				if(char[i].charState == 10 && char[i].justChanged >= 1){
					if(Math.abs(char[i].x-(locations[0]*30)) <= 30 && Math.abs(char[i].y-(locations[1]*30+10)) <= 50){
						if(!char[i].atEnd){
							charsAtEnd++;
							levelActive["tileX"+locations[0]+"Y"+locations[1]].light["light"+charsAtEnd].gotoAndPlay(2);
							if(charsAtEnd >= charCount2){
								wipeTimer = 1;
								if(playMode == 0){
									transitionType = 1;
								}else{
									transitionType = 2;
								}
							}
						}
						char[i].atEnd = true;
					}else{
						if(char[i].atEnd){
							levelActive["tileX"+locations[0]+"Y"+locations[1]].light["light"+charsAtEnd].gotoAndPlay(16);
							charsAtEnd--;
						}
						char[i].atEnd = false;
					}
				}
				if(i == control){
					setCamera();
				}
			}
			if(char[i].charState >= 3){
				if(qTimer > 0 || char[i].justChanged >= 1){
					var littleJump:Number = 0;
					if(i == control && qTimer > 0) littleJump = 9-Math.pow(qTimer-4,2);
					levelChar["char"+i]._x = char[i].x;
					levelChar["char"+i]._y = char[i].y-littleJump;
					if(i == HPRC2){
						HPRCBubble.charImage._x = char[i].x;
						HPRCBubble.charImage._y = char[i].y-78;
					}
					if(char[i].deathTimer >= 30) setTint(i);
				}
				char[i].justChanged--;
			}
		}
		qTimer--;
		var x:Number = -cameraX;
		var y:Number = -cameraY;
		if(wipeTimer < 60){
			x += (Math.random()-0.5)*(30-Math.abs(wipeTimer-30));
			y += (Math.random()-0.5)*(30-Math.abs(wipeTimer-30));
		}
		if(char[control].temp > 0 && char[control].temp <= 50){
			x += (Math.random()-0.5)*char[control].temp*0.2;
			y += (Math.random()-0.5)*char[control].temp*0.2;
		}
		setMovieClipCoordinates(x,y);
		levelTimer++;
	}
	if(menuScreen == 5){
		var x:Number = Math.floor((_xmouse-(330-scale*levelWidth/2))/scale);
		var y:Number = Math.floor((_ymouse-(240-scale*levelHeight/2))/scale);
		if(mouseIsDown){
			if(selectedTab == 3){
				if(tool <= 1 && mouseOnGrid()){
					var i:Number;
					if(tool == 1){
						var i:Number = 0;
					}else{
						var i:Number = selectedTile;
					}
					if(i >= 0 && i < tileCount){
						myLevel[1][y][x] = i;
						levelCreator.tiles["tileX"+x+"Y"+y].gotoAndStop(i+1);
						if(i == 6 && (x != LCEndGateX || y != LCEndGateY)){
							myLevel[1][LCEndGateY][LCEndGateX] = 0;
							levelCreator.tiles["tileX"+LCEndGateX+"Y"+LCEndGateY].gotoAndStop(1);
							LCEndGateX = x;
							LCEndGateY = y;
							setEndGateLights();
						}
					}
				}
			}
			if((tool == 2 || tool == 5) && LCRect[0] != -1){
				if(x != LCRect[2] || y != LCRect[3]){
					LCRect[2] = Math.min(Math.max(x,0),levelWidth-1);
					LCRect[3] = Math.min(Math.max(y,0),levelHeight-1);
					drawLCRect(Math.min(LCRect[0],LCRect[2]),Math.min(LCRect[1],LCRect[3]),Math.max(LCRect[0],LCRect[2]),Math.max(LCRect[1],LCRect[3]));
				}
			}
		}
		if(mouseOnGrid()){
			if(tool == 6){
				levelCreator.rectSelect.clear();
				var y2:Number;
				var y3:Number;
				if(closeToEdgeY()){
					levelCreator.rectSelect.lineStyle(2*scale/9,0x008000,100);
					var y2:Number = Math.round((_ymouse-(240-scale*levelHeight/2))/scale);
					y3 = 0;
				}else{
					levelCreator.rectSelect.lineStyle(2*scale/9,0x800000,100);
					var y2:Number = Math.floor((_ymouse-(240-scale*levelHeight/2))/scale);
					y3 = 0.5;
				}
				levelCreator.rectSelect.moveTo(330-scale*levelWidth/2,240-scale*levelHeight/2+scale*(y2+y3));
				levelCreator.rectSelect.lineTo(330+scale*levelWidth/2,240-scale*levelHeight/2+scale*(y2+y3));
			}else if(tool == 7){
				levelCreator.rectSelect.clear();
				var x2:Number;
				var x3:Number;
				if(closeToEdgeX()){
					levelCreator.rectSelect.lineStyle(2*scale/9,0x008000,100);
					var x2:Number = Math.round((_xmouse-(330-scale*levelWidth/2))/scale);
					x3 = 0;
				}else{
					levelCreator.rectSelect.lineStyle(2*scale/9,0x800000,100);
					var x2:Number = Math.floor((_xmouse-(330-scale*levelWidth/2))/scale);
					x3 = 0.5;
				}
				levelCreator.rectSelect.moveTo(330-scale*levelWidth/2+scale*(x2+x3),240-scale*levelHeight/2);
				levelCreator.rectSelect.lineTo(330-scale*levelWidth/2+scale*(x2+x3),240+scale*levelHeight/2);
			}
		}else if(tool == 6 || tool == 7){
			levelCreator.rectSelect.clear();
		}
		for(var i:Number = 0; i < 6; i++){
			var y:Number = i*40;
			if(i > selectedTab) y+=300;
			if(Math.abs(levelCreator.sideBar["tab"+(i+1)]._y-y) < 0.5){
				levelCreator.sideBar["tab"+(i+1)]._y = y;
			}else{
				levelCreator.sideBar["tab"+(i+1)]._y += (y-levelCreator.sideBar["tab"+(i+1)]._y)*0.2;
			}
		}
	}
	if(levelTimer <= 30 || menuScreen != 4){
		if(wipeTimer >= 30 && wipeTimer <= 60) white._alpha = 220-wipeTimer*4;
	}else{
		white._alpha = 0;
	}
	if(wipeTimer == 29 && menuScreen == 4 && (charsAtEnd >= charCount2 || transitionType == 0)) white._alpha = 100;
	if(wipeTimer >= 60) wipeTimer = 0;
	if(wipeTimer >= 1) wipeTimer++;
}
_root.onMouseDown = function() {
	mouseIsDown = true;
	if(menuScreen == 5){
		if(_xmouse > 660){
			for(var i:Number = 0; i < 6; i++){
				var y:Number = i*40;
				if(i > selectedTab) y+=300;
				if(_ymouse >= y && _ymouse < y+40){
					setSelectedTab(i);
					if(i == 3 && (selectedTile < 0 || selectedTile > tileCount)){
						setTool(0);
						setSelectedTile(1);
					}
					break;
				}
			}
			if(selectedTab == 3){
				var x:Number = Math.floor((_xmouse-660)/60);
				var y:Number = Math.floor((_ymouse-160)/60);
				var i:Number = x+y*5;
				if(i >= 0 && i < tileCount && ((tool != 3 && tool != 2)|| !blockProperties[i][9])){
					setSelectedTile(i);
					if(i >= 1 && tool == 1) setTool(0);
				}
			}else{
				setSelectedTile(1000);
			}
			clearRectSelect();
			
		}else if(Math.abs(_ymouse-510) <= 20 && Math.abs(_xmouse-330) <= 300){
			var i:Number = Math.floor((_xmouse-30)/50);
			if(i != 8){
				if(i >= 9) i--;
				if(i == 9){
					undo();
				}else if(i == 10){
					setUndo();
					clearMyLevel(1);
					updateLCtiles();
					
				}else{
					setTool(i);
					if(tool <= 3){
						setSelectedTab(3);
						if((tool == 3 || tool == 2) && blockProperties[selectedTile][9]) setSelectedTile(1);
					}
				}
			}
			
		}else{
			if(tool != 4 && tool != 5) setUndo();
			var x:Number = Math.floor((_xmouse-(330-scale*levelWidth/2))/scale);
			var y:Number = Math.floor((_ymouse-(240-scale*levelHeight/2))/scale);
			if(mouseOnScreen()){
				if(tool == 2 || tool == 5){
					LCRect[0] = LCRect[2] = Math.min(Math.max(x,0),levelWidth-1);
					LCRect[1] = LCRect[3] = Math.min(Math.max(y,0),levelHeight-1);
				}
			}
			if(mouseOnGrid()){
				if(tool == 3){
					var fillType = myLevel[1][y][x];
					fillTile(x,y,selectedTile,fillType);
				}else if(tool == 4){
					setSelectedTab(3);
					setSelectedTile(myLevel[1][y][x]);
				}else if(tool == 6){
					var sizeChange:Number = 0;
					if(closeToEdgeY() || levelHeight >= 2){
						if(closeToEdgeY()){
							sizeChange = 1;
						}else{
							sizeChange = -1;
						}
						clearLCGrid();
						var y2:Number = Math.round((_ymouse-(240-scale*levelHeight/2))/scale);
						levelHeight += sizeChange;
						myLevel[1] = new Array(levelHeight);
						var y4:Number = 0;
						for(var y3:Number = 0; y3 < levelHeight; y3++){
							if(y3 < y2){
								y4 = y3;
							}else{
								y4 = Math.max(y3-sizeChange,0);
							}
							myLevel[1][y3] = new Array(levelWidth);
							for(var x3:Number = 0; x3 < levelWidth; x3++){
								myLevel[1][y3][x3] = myLevel[0][y4][x3];
							}
						}
						drawLCGrid();
					}
				}else if(tool == 7){
					var x2:Number = ((_xmouse-(330-scale*levelWidth/2))/scale)%1;
					var sizeChange:Number = 0;
					if(closeToEdgeX() || levelWidth >= 2){
						if(closeToEdgeX()){
							sizeChange = 1;
						}else{
							sizeChange = -1;
						}
						clearLCGrid();
						var x2:Number = Math.round((_xmouse-(330-scale*levelWidth/2))/scale);
						levelWidth += sizeChange;
						myLevel[1] = new Array(levelHeight);
						var x4:Number = 0;
						for(var y3:Number = 0; y3 < levelHeight; y3++){
							myLevel[1][y3] = new Array(levelWidth);
							for(var x3:Number = 0; x3 < levelWidth; x3++){
								if(x3 < x2){
									x4 = x3;
								}else{
									x4 = Math.max(x3-sizeChange,0);
								}
								myLevel[1][y3][x3] = myLevel[0][y3][x4];
							}
						}
						drawLCGrid();
					}
				}
			}
		}
	}
}
_root.onMouseUp = function() {
	if(tool == 2){
		for(y:Number = Math.min(LCRect[1],LCRect[3]); y <= Math.max(LCRect[1],LCRect[3]); y++){
			for(x:Number = Math.min(LCRect[0],LCRect[2]); x <= Math.max(LCRect[0],LCRect[2]); x++){
				myLevel[1][y][x] = selectedTile;
				levelCreator.tiles["tileX"+x+"Y"+y].gotoAndStop(selectedTile+1);
			}
		}
		clearRectSelect();
	}
	mouseIsDown = false;
}