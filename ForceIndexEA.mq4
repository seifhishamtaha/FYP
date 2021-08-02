
void OnTick()
  {
//---
   string signal = "";
   //shift is 5 for old ATR as we calcuclate candle price 5 candles ago
   double ForceIndexValue = iForce(_Symbol,_Period,13,MODE_SMA,PRICE_CLOSE,0);
   double LastForceIndexValue = iForce(_Symbol,_Period,13,MODE_SMA,PRICE_CLOSE,13);
   
   
   
   if(LastForceIndexValue<0 && ForceIndexValue>0)(signal = "buy");
   if(LastForceIndexValue>0 && ForceIndexValue<0)(signal = "sell");
   
      

  
   if(signal=="buy" && OrdersTotal()==0)(OrderSend(_Symbol,OP_BUY,0.10,Ask,3,0,Ask+150*_Point,NULL,0,0,Green));
   if(signal=="sell" && OrdersTotal()==0)(OrderSend(_Symbol,OP_SELL,0.10,Ask,3,0,Ask-150*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal); 
  }
//+------------------------------------------------------------------+
