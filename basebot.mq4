//+------------------------------------------------------------------+
//|                                                      basebot.mq4 |
//|                        Copyright 2021, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
string BotName = "Demo";
int Magic = 2234;
int MaxTrades = 1;

double LotsToTrade = 2;
double StopLoss = -3700;
double ProfitTarget = 280;

int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
  double SMA = iMA(NULL, 0, 250, 0, MODE_SMA, PRICE_CLOSE,0);
  double FMA = iMA(NULL, 0, 145, 0, MODE_SMA, PRICE_CLOSE,0);
  
  int tt = GetTotalOpenTrades();
  Print("*******TT: ",tt);
  if ( GetTotalOpenTrades() < MaxTrades){
      
  
  }
  
  
}




int GetTotalOpenTrades(){
   int TotalTrades = 0;
   for (int t=0; t<OrdersTotal();t++){
      if(OrderSelect(t, SELECT_BY_POS, MODE_TRADES)){
      
         if(OrderSymbol() != Symbol()) continue;
         if(OrderMagicNumber() != Magic) continue;
         if(OrderCloseTime() != 0) continue;
         TotalTrades = (TotalTrades + 1);
      }
   }
   return TotalTrades;
}
