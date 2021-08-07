
void OnTick()
  {
//---
   string signal = "";
   
   
   double ForceIndexValue = iForce(_Symbol,_Period,13,MODE_SMA,PRICE_CLOSE,0);
   double LastForceIndexValue = iForce(_Symbol,_Period,13,MODE_SMA,PRICE_CLOSE,13);
   
   double K0 = iStochastic(_Symbol,_Period,5,3,3,MODE_SMA,0,MODE_MAIN,0);
   double D0 = iStochastic(_Symbol,_Period,5,3,3,MODE_SMA,0,MODE_SIGNAL,0);
   double K1 = iStochastic(_Symbol,_Period,5,3,3,MODE_SMA,0,MODE_MAIN,1);
   double D1 = iStochastic(_Symbol,_Period,5,3,3,MODE_SMA,0,MODE_SIGNAL,1);
   
   
   if(K0<20 && D0<20)if((D0<K0 && D1>K1)||(LastForceIndexValue<0 && ForceIndexValue>0))(signal = "buy");
   if(K0>80 && D0>80)if((D0>K0 && D1<K1)||(LastForceIndexValue>0 && ForceIndexValue<0))(signal = "sell");
   
   
      

  
   if(signal=="buy" && OrdersTotal()==0)(OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-450*_Point,Ask+150*_Point,NULL,0,0,Green));
   if(signal=="sell" && OrdersTotal()==0)(OrderSend(_Symbol,OP_SELL,0.10,Ask,3,Ask+450*_Point,Ask-150*_Point,NULL,0,0,Red));
   
   Comment("The current signal is: ",signal); 
  }
//+------------------------------------------------------------------+
