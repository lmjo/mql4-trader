input double TakeProfit     = 20;
input double Lots           = 0.01;
input double TrailingStop   = 30;
input double MACDOpenLevel  = 3;
input double MACDCloseLevel = 2;

input int    MATrendPeriod  =26;



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
{
    EventSetTimer(1) ;
    return(INIT_SUCCEEDED) ;
}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{

    EventKillTimer();

}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void onTimer()
  {
   double MacdCurrent,MacdPrevious;
   double SignalCurrent,SignalPrevious;
   double MaCurrent,MaPrevious;
   int    cnt,ticket,total;



   MacdCurrent  = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
   MacdPrevious = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1);

   SignalCurrent =  iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,0);
   SignalPrevious = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_SIGNAL,1);
   
   MaCurrent  = iMA(NULL,0,MATrendPeriod,0,MODE_EMA,PRICE_CLOSE,0);
   MaPrevious = iMA(NULL,0,MATrendPeriod,0,MODE_EMA,PRICE_CLOSE,1);


   Comment( MacdCurrent, " ", MacdPrevious ) ;

  }
