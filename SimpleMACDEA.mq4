//+------------------------------------------------------------------+
void OnTick()
  {
//---
   string signal = "";
   
   
   double MACD=iMACD(_Symbol,_Period,12,26,9,PRICE_CLOSE,MODE_MAIN,0);
   
   
   if(MACD>0)
   (signal="sell");
   if(MACD<0)
   (signal="buy");
   
   if(signal=="buy" && OrdersTotal()==0)
   (OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-450*_Point,Ask+150*_Point,NULL,0,0,Green));
   if(signal=="sell" && OrdersTotal()==0)
   (OrderSend(_Symbol,OP_SELL,0.10,Ask,3,Ask+450*_Point,Ask-150*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal);
  }
//+------------------------------------------------------------------+
