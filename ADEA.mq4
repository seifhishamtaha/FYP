
void OnTick()
  {
//---
   string signal = "";
   
   
   double MovingAverage =iMA(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE,0);
   
   double IADValue = iAD(_Symbol,_Period,0);
   
   double LastADValue = iAD(_Symbol,_Period,10);
   
   
   
   
   if(Ask>MovingAverage)if(IADValue>LastADValue)(signal="buy");
   if(Bid<MovingAverage)if(IADValue<LastADValue)(signal="sell");
   
   if (signal=="buy" && OrdersTotal()==0)
   (OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-450*_Point,Ask+150*_Point,NULL,0,0,Green));
   
   if (signal=="sell" && OrdersTotal()==0)
   (OrderSend(_Symbol,OP_SELL,0.10,Ask,3,Ask+450*_Point,Ask-150*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal);
  }
//+------------------------------------------------------------------+
