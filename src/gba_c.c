
//include
#include "gba1.h"

#define KEY_IN (~(*(hword *) KEY_STATUS) & KEY_ALL)


#define green   0x03E0
#define black   0x0000
#define red     0x001F
#define cian    0x7FE0
#define white   0x7FFF
#define yellow  0x03FF
#define blue    0x7C00

void back();
void black_back();

void pop_g_p(int, int, hword);
void d_edge_g_p(int, int);

void pop_laiser(int, int, hword);
void d_edge_laiser(int, int);
void move_laiser(int, int, hword);
void d_laiser(int, int);

void pop_heart(int, int, hword);

void pop_coin(int, int, int, hword);
void d_edge_coin(int, int);
void move_coin(int, int, int, hword);


/*

*/
void init_timer();
void init_interruption();
void display_time(hword);
void int_handler();
void start_interruption();
void end_interruption();
void key_check();
void timer_on();
void timer_off();
void fil_st();
void ctl_laiser();
void ctl_coins();
void play();
void init_param();

/*    グローバル変数    */

//文字表示用の点の生成
point p;

//文字表示用の座標
hword cx = 0, cy = 0;

//自機の座標を保持する
int x = 90;
int y = 90;

//時間の記録と表示に使う
volatile unsigned short time = 0x0000;
hword tmp = 0;

//乱数を決定し，保持する
int cnt;

//コインの移動用の座標と当たり判定のフラグの配列
int coin_x[] = {200, 200, 200, 200, 200};
int coin_y[] = {80, 40, 50, 120, 60};
int coin_j[] = {0, 0, 0, 0, 0};

//ゲーム終了時等で初期化を行うために使う初期状態で固定されたコインの座標と当たり判定のフラグ
int f_coin_x[] = {200, 200, 200, 200, 200};
int f_coin_y[] = {80, 40, 50, 120, 60};
int f_coin_j[] = {0, 0, 0, 0, 0};

//配列の何番目のコインを使用しているかを保持する（コインは画面に最大1個表示される）
int th_coin = 0;

//獲得したコインの個数を保持する(初期状態で0)
int n_coin = 0;

//残っているハートの個数を保持する(初期状態で4)
int n_heart = 4;

//コインと同様に，レーザーも初期化用の固定の座標とフラグ，移動用の座標とフラグを配列で用意する
int laiser_j[] = {0, 0, 0, 0, 0};
int laiser_x[] = {160, 180, 200, 200, 190};
int laiser_y[] = {30, 60, 90, 120, 140};

int f_laiser_x[] = {160, 180, 200, 200, 190};
int f_laiser_y[] = {30, 60, 90, 120, 140};
int f_laiser_j[] = {0, 0, 0, 0, 0};

//設定画面で使う
hword difficulty = 10;
int col_num = 3;
hword cols[] = {BGR(0x05, 0x05, 0x05), green, red, yellow, BGR(0x0E, 0x00, 0x0E), white};
hword plane_color;


/*      main      */


int main (void){

	hword *ptr;
	/*	GBAのモード3に設定	*/
	ptr = (hword*) 0x04000000;
	*ptr = 0x0F03;


	//背景を黒に変える
	black_back();
    
    

    //ゲームの内容を繰り返す無限ループ
    while(1){

        init_param();
        play();

    }

	return(0);
}


/*      割り込み関連の関数      */


/* 割込みハンドラ */
void int_handler(void) {

	start_interruption();

    /* 文字座標の一時保存 */
	point p0;

    //for文用
    int i;
	
	//タイマ割り込み
	if((*((hword *)0x04000202) & 0x0020) == 0x0020){

        time = *((unsigned short *)0x0400010C);
        
        /*      時間表示      */

		/* 元の文字座標を保存 */
		p0 = p;
	
		/* 右上にタイム表示 */
        locate(18, 1);
        prints("TIME");
		locate(25, 1);
		display_time(time - tmp);



        /*      時間によっての座標移動      */

        //コインのx座標を1減らす
        coin_x[th_coin]--;

        //レーザーのx座標を1減らす
        for(i = 0; i < 5; i++){
            laiser_x[i] = laiser_x[i] - 1;
        }



		/* 表示位置がグローバルなのでキーの位置に戻す必要あり */
		p = p0;
    }

    //キー割り込み
    /*
	if((*((hword *)0x04000202) & 0x1000) == 0x1000){

		// 元の文字座標を保存
		p0 = p;

        // 表示位置がグローバルなのでキーの位置に戻す必要あり
		p = p0;
	}
    */

    end_interruption();
}


//割り込み開始時の操作
void start_interruption(){
    /* 全割込み禁止 */
	*((hword *)0x04000208) = 0x0000;
}

//割り込み終了時の操作をまとめたもの
void end_interruption(){
    /*割り込み要因クリア*/

    /*
    if(*((hword *)0x04000202) & 0x1020 == 0x1020){
        //タイマとキー両方
        *((hword *)0x04000202) = 0x1020;
    }
    else 

    if(*((hword *)0x04000202) & 0x0020 == 0x0020){  */
        //タイマの割り込み要因クリア
        *((hword *)0x04000202) = 0x0020;
    /*
    }
    else if(*((hword *)0x04000202) & 0x1000 == 0x1000){
        //キーのみ
        *((hword *)0x04000202) = 0x1000;
    }
    */

	/* 全割込み許可 */
	*((hword *)0x04000208) = 0x0001;
}

//割り込み初期化
void init_interruption(){
    /*キーの割り込み発生と発生モード設定*/
    /*
    *((hword *)0x04000132) = 0x43FF;
    */

	/*タイマ2割込み許可 */
	*((hword *)0x04000200) = 0x0020;

	/* 全割込み許可 */
	*((hword *)0x04000208) = 0x0001;
}


/*      タイマ関連の関数        */


//タイマ初期化
void init_timer(void) {
	
	/* タイマ制御レジスタ */
	*((hword *)0x04000100) = 0xFFFF - 1678 + 1;
	*((hword *)0x04000104) = 0xFFFF - difficulty + 1;
	*((hword *)0x04000108) = 0xFFFF - 10 + 1;
	*((hword *)0x0400010C) = 0x0000;

	/* タイマ設定レジスタ */
	*((hword *)0x04000102) = 0x0000;	// 初期状態でタイマ停止
	*((hword *)0x04000106) = 0x0084;	// カスケード接続
	*((hword *)0x0400010A) = 0x00C4;	// タイマ2割込み発生
	*((hword *)0x0400010E) = 0x0084;
}

//タイマの開始
void timer_on(){
	*((hword *)0x04000102) = 0x0080;
}

//タイマの停止
void timer_off(){	
	*((hword *)0x04000102) = 0x0000;
}

//パラメータの初期化
void init_param(){
    int i;

    //Aボタンが押されるまで待機し，押されると1~5の乱数を作成して
    //「PRESS A」の表示を消し，
    //ゲーム内容を初期化してからbreakする無限ループ
    while(1){
            
        //初期説明
        locate(2, 2);
        prints("Collect 4 coins");
        locate(2, 4);
        prints("But Avoid laisers");

        locate(12,9);
        prints("PRESS_A");
            

        while(KEY_IN != KEY_A){
            //1~5の乱数を生成
            cnt++;
            if(cnt > 5){
                cnt = 1;
            }
        }
        while(KEY_IN == KEY_A)

        black_back();

        //色の選択
        locate(2, 2);
        prints("Select color");
        locate(2, 4);
        prints("With L and R button");
        locate(2, 6);
        prints("You can change color");
        locate(5, 9);
        prints("PRESS_A to fix color");

        //色の決定まで
        while(KEY_IN != KEY_A){
            switch(KEY_IN){
                case KEY_L:
                    while(KEY_IN == KEY_L){}
                    col_num--;
                    if(col_num < 0){
                        col_num = 5;
                    }
                break;

                case KEY_R:
                    while(KEY_IN == KEY_R){}
                    col_num++;
                    if(col_num > 5){
                        col_num = 0;
                    }
                    break;
            }
            pop_g_p(120, 120, cols[col_num]);
        }
        while(KEY_IN == KEY_A)
        plane_color = cols[col_num];
        black_back();
        
        locate(2,2);
        prints("Select game mode");
        locate(2, 4);
        prints("START button  normal mode ");
        locate(2, 6);
        prints("SELECT button  easy mode");

        while(1){
            //normal
            if(KEY_IN == KEY_START){
                while(KEY_IN == KEY_START){}
                difficulty = 10;
                break;
            }
            //easy
            else if(KEY_IN == KEY_SELECT){
                while(KEY_IN == KEY_SELECT){}
                difficulty = 100;
                break;
            }
        }

        //タイマ設定
        init_timer();
        //割り込み設定
        init_interruption();
        

        //背景をシアンに変える
        back();
        //ステータス部分を黒くする
        fil_st();


        //タイマオン
        timer_on();


        //先ほど作成した1~5の乱数を利用してゲームのパラメータを初期化
        for(i = 0; i < n_heart; i++){
            pop_heart(14 * (i + 1), 10, red);
        }
        pop_g_p(x, y, plane_color);
        for (i = 0; i < 5; i++){
            laiser_j[i] = f_laiser_j[i];
            laiser_x[i] = f_laiser_x[i] + cnt * i;
            laiser_y[i] = f_laiser_y[i] + cnt * i;
            coin_j[i] = f_coin_j[i];
            coin_x[i] = f_coin_x[i] + cnt;
            coin_y[i] = f_coin_y[i] + cnt;
        }
        break;
    }
}

//ゲーム本編
void play(){
    //ゲームが始まる
    while (1){

        //終了条件
        if(n_coin == 4 || n_heart == 0){

            //タイマを止める
            timer_off();

            //コインの獲得数が4つになる
            //you win
            if(n_coin == 4){
                black_back();

                /* 右上にタイム表示 */
                locate(18, 1);
                prints("TIME");
		        locate(25, 1);
        		display_time(time - tmp);

                //locate
                locate(12, 7);
                prints("YOU_WIN");
                    
                //locate
                locate(12, 11);
                prints("PRESS_A");
                    

                while(KEY_IN != KEY_A){
                    //Aボタンが押されるのを待つ
                    //押されたら文字の表示を消す
                }
                while(KEY_IN == KEY_A)
                    

                black_back();
            }
            //ダメージが4回になり，ハートの保持数が0になる
            //you lose
            else if(n_heart == 0){
                black_back();

                /* 右上にタイム表示 */
                locate(18, 1);
                prints("TIME");
	            locate(25, 1);
            	display_time(time - tmp);

                //locate
                locate(12, 7);
                prints("YOU_LOSE");
                
                //locate
                locate(12, 11);
                prints("PRESS_A");
                    

                while(KEY_IN != KEY_A){
                    //Aボタンが押されるのを待つ
                    //押されたら文字の表示を消す
                }
                while(KEY_IN == KEY_A)

                black_back();

            }

            //乱数や出現コインの番号，獲得コイン数，ハート保持数の初期化
            cnt = 0;
            th_coin = 0;
            n_coin = 0;
            n_heart = 4;
            
            //新規に時間を計測するための処理
            tmp = time;
            
            break;
        }

        //流れてくるものの処理を行う
        ctl_laiser();
        ctl_coins();
            
        //自機のキー入力に対する処理
        key_check();     

    }
}

//コインの制御
void ctl_coins(){
    //自機とコインとの距離が一定以上あり，
    //かつコインの当たり判定フラグが立っていない場合
    if(distance(x, y, coin_x[th_coin], coin_y[th_coin]) == 0 && coin_j[th_coin] == 0){
        move_coin(coin_x[th_coin], coin_y[th_coin], 4, yellow);
    }
    //自機とコインの距離が一定以下の場合
    else{
        //コインの当たり判定のフラグが立っていない
        //つまり，初めて自機との距離が一定以下になったとき
        if(coin_j[th_coin] == 0){
            //流れているコインを消し，
            //獲得したコインを画面上部のステータスに表示する
            pop_coin(coin_x[th_coin], coin_y[th_coin], 6, cian);
            n_coin++;
            pop_coin(80 + 10 * (n_coin - 1), 10, 4, yellow);
        }
        //コインの当たり判定のフラグを立てる
        coin_j[th_coin]++;
        th_coin++;
        if(th_coin == 6){
            th_coin = 0;
        }
    }
    
    //コインのx座標が0になった場合
    if(coin_x[th_coin] == 0){
        //コインを消し，適当な位置に再定義を行う
        pop_coin(coin_x[th_coin], coin_y[th_coin], 5, cian);
        coin_x[th_coin] = 200;
        if(coin_y[th_coin] + 40 < 160){
            coin_y[th_coin] = coin_y[th_coin] + 40;
        }
        else if(coin_y[th_coin] - 140 > 20) {
            coin_y[th_coin] = coin_y[th_coin] - 140;
        }
        else{
            coin_y[th_coin] = coin_y[th_coin] - 10;
        }
    }
}

//レーザの制御
void ctl_laiser(){
    int i;
    //レーザー5本の処理
    for(i = 0; i < 5; i++){
        //自機との距離が一定以上あり，
        //かつレーザーの当たり判定フラグが立っていない場合
        if(distance(x, y ,laiser_x[i], laiser_y[i]) == 0 && laiser_j[i] == 0){
            //レーザーを表示し，次の処理のためにエッジだけ消す
            move_laiser(laiser_x[i], laiser_y[i], yellow);
        }

        //自機との距離が一定以下の場合
        else{
            //レーザーの当たり判定のフラグが立っていない
            //つまり，初めて自機との距離が一定以下になったとき
            if(laiser_j[i] == 0){
                //レーザーとハートを消す
                d_laiser(laiser_x[i], laiser_y[i]);
                pop_heart(14 * (n_heart), 10, black);
                n_heart--;
            }
            //レーザーの当たり判定フラグを立てる
            laiser_j[i]++;
        }

        //レーザーが画面右端に到達した場合
        if(laiser_x[i] == 0){
            //レーザーを消し，適当なスタート位置に再定義を行う
            d_laiser(laiser_x[i], laiser_y[i]);
            laiser_x[i] = f_laiser_x[i];
            if(laiser_y[i] + i * 20 < 160){
                laiser_y[i] = laiser_y[i] + i * 20;
            }
            else if(laiser_y[i] - i * 30 > 20) {
                laiser_y[i] = laiser_y[i] -  i * 30;
            }
            else if(laiser_y[i] - i * 40 > 20){
                laiser_y[i] = laiser_y[i] - i * 40;
            }
            else{
                laiser_y[i] = laiser_y[i] - i * 10;
            }
        }
    }
}

//ステータス部分の背景
void fil_st(){
    hword i, j;
    for(j = 0; j < 20; j++){
        for(i = 0; i < 240; i++){
            draw_point(i, j, black);
        }
    }
}

//memcpy
char *memcpy(char *dest, char *src, int count){
	int i;
	
	for(i = 0; i < count; i++){
		*dest++ = *src++;
	}
	return dest;
}

//経過時間の表示
void display_time(hword val) {
	
	byte char_data[] = "0123456789";
	byte buf[6];
	hword tmp;
	int i;
	
	/* 入力値valの桁数(i+1)設定 (i=3の場合4桁表示)*/
	i = 4;

	/* 文字列の最後にNULLコード挿入 */
	buf[i+1] = 0;
	
	/* 最下位桁の文字（10で割った余り）を挿入し，入力値を10で割る */
	for(; i >= 0; i--) {
		buf[i] = char_data[mod(val, 10)];
		val = div(val, 10);
	}
	
	/* 文字列全体を表示 */
	prints(buf);
	
	return;
}

//キー入力に対しての処理
void key_check(){
    
	switch (KEY_IN) {
		case KEY_L: 	
            break;

		case KEY_R: 	
            break;

		case KEY_DOWN: 	
            if(y + 1 < 150){
                //現在表示されている自機のエッジだけを背景色に戻す
                d_edge_g_p(x, y);
                y = y + 1;
                pop_g_p(x, y, plane_color);
            }
            break;

		case KEY_UP: 	
            if(30 < y - 1){
                //現在表示されている自機のエッジだけを背景色に戻す
                d_edge_g_p(x, y);
                y = y - 1;
                pop_g_p(x, y, plane_color);
            }
            break;

		case KEY_LEFT: 	
            if(10 < x - 1){
                //現在表示されている自機のエッジだけを背景色に戻す
                d_edge_g_p(x, y);
                x = x - 1;
                pop_g_p(x, y, plane_color);
            }
            break;

		case KEY_RIGHT: 
            if(x + 1 < 230){
                //現在表示されている自機のエッジだけを背景色に戻す
                d_edge_g_p(x, y);
                x = x + 1;
                pop_g_p(x, y, plane_color);
            }
            break;
        
		case KEY_START: 
            
            break;
		case KEY_SELECT:
            break;
		case KEY_B:
            break;
		case KEY_A:
            break;
		default:
            break;
	}
}


/*      基本的な描画に関する関数        */

//コインを動かす
void move_coin(int Xe, int Ye, int R, hword c){
    pop_coin(Xe, Ye, R, c);
    d_edge_coin(Xe, Ye);
}

//コインの右側のエッジのみを背景色に戻す
void d_edge_coin(int Xe, int Ye){
    draw_point(Xe, Ye + 5, cian);
    draw_point(Xe + 1, Ye + 4, cian);
    draw_point(Xe + 2, Ye + 4, cian);
    draw_point(Xe + 3, Ye + 3, cian);
    draw_point(Xe + 4, Ye + 2, cian);
    draw_point(Xe + 4, Ye + 1, cian);
    draw_point(Xe + 5, Ye, cian);
    draw_point(Xe, Ye - 5, cian);
    draw_point(Xe + 1, Ye - 4, cian);
    draw_point(Xe + 2, Ye - 4, cian);
    draw_point(Xe + 3, Ye - 3, cian);
    draw_point(Xe + 4, Ye - 2, cian);
    draw_point(Xe + 4, Ye - 1, cian);
}

//コインを画面に表示する
void pop_coin(int Xe, int Ye, int R, hword color){
    int i;
    int j;
    int x;
    int y;
    
    for(i = Xe - R;i <= Xe + R; i++){
		draw_point(i, Ye, color); 
	}
	
	for(i = Ye - R; i <= Ye + R; i++){
		draw_point(Xe, i, color);
	}
	
	x = Xe + 1;
	y = Ye - R;
	for(j = 1; j <= R; j++){
		while( (x - Xe) * (x - Xe)+ (y - Ye) * (y - Ye) <= R * R ){
			draw_point(x,y, color);
			draw_point(x - 2 * (x - Xe), y, color);
			draw_point(x, y + 2 * (Ye - y), color);
			draw_point(x - 2 * (x - Xe), y + 2 * (Ye - y), color);
			x = x + 1;
		}
		y = y + 1;
		x = Xe + 1;
	}
}

//レーザー全体を背景色に戻す
void d_laiser(int x, int y){
    int i;
    for(i = 0; i < 10; i++){
        draw_point(x + i, y - 1, cian);
        draw_point(x - i, y - 1, cian);
        draw_point(x + i, y, cian);
        draw_point(x - i, y, cian);
        draw_point(x + i, y + 1, cian);
        draw_point(x - i, y + 1, cian);
    }
    draw_point(x - 10, y, cian);
    draw_point(x + 10, y, cian);
}

//レーザーを動かす
void move_laiser(int x, int y, hword c){
    pop_laiser(x, y, c);
    d_edge_laiser(x, y);
}


//背景を黒にする
void black_back(){
    hword *ptr;
    ptr = (hword*) VRAM;
    int i;
    for(i = 0; i < 240 * 160; i++){
        *ptr = black;
		ptr = ptr + 1;
    }
}

//背景をシアンにする
void back(){
    hword *ptr;
    ptr = (hword*) VRAM;
    int i;
    for(i = 0; i < 240 * 160; i++){
        *ptr = cian;
		ptr = ptr + 1;
    }
}

//自機を表示する
void pop_g_p(int x, int y, hword c){
	
	draw_point(x, y, c);
    int i;
	for(i = 0; i < 10; i++){
        draw_point(x - i, y, c);
        draw_point(x + i, y, c);
    }
    draw_point(x + 10, y, c);

    for(i = 0; i < 9; i++){
        draw_point(x - i, y - 1, c);
        draw_point(x + i, y - 1, c);
        draw_point(x + i, y + 1, c);
        draw_point(x - i, y + 1, c);
    }

    draw_point(x - 9, y - 1, c);
    draw_point(x - 9, y + 1, c);

    for(i = 1; i < 11; i++){
        draw_point(x - 2, y + i, c);
        draw_point(x - 2, y - i, c);
    }

    for(i = 1; i < 10; i++){
        draw_point(x - 1, y + i, c);
        draw_point(x - 1, y - i, c);
    }

    for(i = 1; i < 8; i++){
        draw_point(x, y + i, c);
        draw_point(x, y - i, c);
    }

    for(i = 1; i < 5; i++){
        draw_point(x + 1, y + i, c);
        draw_point(x + 1, y - i, c);
        draw_point(x - 3, y + i, c);
        draw_point(x - 3, y - i, c);
        draw_point(x - 9, y + i, c);
        draw_point(x - 9, y - i, c);
    }

    for(i = 1; i < 4; i++){
        draw_point(x - 8, y + i, c);
        draw_point(x - 8, y - i, c);
    }

    draw_point(x - 7, y + 2, c);
    draw_point(x - 7, y - 2, c);
    draw_point(x - 4, y + 2, c);
    draw_point(x - 4, y - 2, c);
    draw_point(x + 2, y + 2, c);
    draw_point(x + 2, y - 2, c);
}

//自機のエッジだけを背景色に戻す
void d_edge_g_p(int x, int y){
    
    int i;
	for(i = 0; i < 5; i++){
        draw_point(x - 9, y + i, cian);
        draw_point(x - 9, y - i, cian);
    }
    for(i = 3; i < 9; i++){
        draw_point(x + i, y + 1, cian);
        draw_point(x + i, y - 1, cian);
    }
    draw_point(x + 9, y, cian);
    draw_point(x + 10, y, cian);

    draw_point(x - 3, y + 4, cian);
    draw_point(x - 3, y + 3, cian);
    draw_point(x - 3, y - 4, cian);
    draw_point(x - 3, y - 3, cian);
    draw_point(x - 4, y + 2, cian);
    draw_point(x - 4, y - 2, cian);

    for(i = 5; i < 7; i++){
        draw_point(x - i, y + 1, cian);
        draw_point(x - i, y - 1, cian);
    }

    draw_point(x - 7, y + 2, cian);
    draw_point(x - 7, y - 2, cian);

    draw_point(x - 8, y + 3, cian);
    draw_point(x - 8, y - 3, cian);

    for(i = 5; i < 11; i++){
        draw_point(x - 2, y + i, cian);
        draw_point(x - 2, y - i, cian);
    }
    draw_point(x - 1, y + 9, cian);
    draw_point(x - 1, y - 9, cian);
    draw_point(x - 1, y + 8, cian);
    draw_point(x - 1, y - 8, cian);

    for(i = 5; i < 8; i++){
        draw_point(x, y + i, cian);
        draw_point(x, y - i, cian);
    }

    draw_point(x + 1, y + 4, cian);
    draw_point(x + 1, y + 3, cian);
    draw_point(x + 1, y - 4, cian);
    draw_point(x + 1, y - 3, cian);
    draw_point(x + 2, y + 2, cian);
    draw_point(x + 2, y - 2, cian);
}

//レーザーを表示する
void pop_laiser(int x, int y, hword c){
    int i;
    for(i = 0; i < 10; i++){
        draw_point(x + i, y - 1, c);
        draw_point(x - i, y - 1, c);
        draw_point(x + i, y, white);
        draw_point(x - i, y, white);
        draw_point(x + i, y + 1, c);
        draw_point(x - i, y + 1, c);
    }
    draw_point(x - 10, y, c);
    draw_point(x + 10, y, c);
}

//レーザーの右側のエッジだけを背景色に戻す
void d_edge_laiser(int x, int y){
    draw_point(x + 9, y - 1, cian);
    draw_point(x + 10, y, cian);
    draw_point(x + 9, y + 1, cian);
    draw_point(x - 10, y, white);
}

//ハートを表示する
void pop_heart(int x, int y, hword c){
    int i;
    //0
    for(i = - 3; i <= 5; i++){
        draw_point(x, y + i, c);
    }
    //1
    for(i = -4; i <= 4; i++){
        draw_point(x + 1, y + i, c);
        draw_point(x - 1, y + i, c);
    }
    //2
    for(i = -5; i <= 3; i++){
        draw_point(x + 2, y + i, c);
        draw_point(x - 2, y + i, c);
    }
    //3
    for(i = -5; i <= 2; i++){
        draw_point(x + 3, y + i, c);
        draw_point(x - 3, y + i, c);
    }
    //4
    for(i = -4; i <= 1; i++){
        draw_point(x + 4, y + i, c);
        draw_point(x - 4, y + i, c);
    }
    //5
    for(i = -3; i <= 0; i++){
        draw_point(x + 5, y + i, c);
        draw_point(x - 5, y + i, c);
    }
    if(c == red){
        //明暗をつける
        draw_point(x - 5, y - 2, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 5, y, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 5, y - 1, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 4, y, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 4, y + 1, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 3, y + 2, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 2, y + 3, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 1, y + 3, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 3, y + 2, BGR(0x1F, 0x0A, 0x0F));
        draw_point(x - 3, y - 4, white);
        draw_point(x - 4, y - 2, white);
        draw_point(x - 3, y - 3, white);
        draw_point(x + 1, y + 4, BGR(0x0F, 0x00, 0x00));
        draw_point(x + 2, y + 3, BGR(0x0F, 0x00, 0x00));
    }
}

//与えられた2点間の距離を計算し，
//一定距離以上があれば，0を返し，
//一定距離以内であれば，1を返す
int distance(int g_x, int g_y, int p_x, int p_y){
    if( (((p_x - g_x) < 20) && (-20 < (p_x - g_x)) ) && ( ((g_y - p_y) < 10) && (-10 < (g_y - p_y)) )) {
        return 1;
    }
    else{
        return 0;
    }
}
