<?php

class OrderAction extends Action{
    
 private function generatebtntype($state)
    {
        switch($state){
        case 'created': return 'pay';
        case 'payed': return 'refund';
        case 'shipping': return 'confirm_receipt';
        default: return null;
        }
    }
    public function showorders(){
        $username=$_SESSION['uid'];
        if($username===null)
        {   
           $this->display();
            return;
        }
        
        $orders=D('Orders');
        $ordergoods=D('OrderGoods');
        $userorders= $orders->searchidbyname($username);
        $keywords=$this->_get('keywords');
        $condition['keywords']=$keywords;
        for($i=0;$i<count($userorders);$i++)
            $useroid[$i]=$userorders[$i]['ID'];
        $condition['userorders']=$useroid;
        $searchResult=$ordergoods->searchbyname($condition);//搜索类似商品名称的订单，结果可能大于1
        $orderresult=null;
        for($i=0;$i<count($searchResult);$i++)
        {
            $orderresult[$i]=$orders->findorderbyid($searchResult[$i]['OID']);
            $goodsresult=$ordergoods->searchbyid($orderresult[$i]['ID']);
            $orderresult[$i]['goods']=$goodsresult;
            $orderresult[$i]['size']=count($goodsresult);
            $state=$this->generatebtntype($orderresult[$i]['STATE']);
                $orderresult[$i]['buttontype']=$state;
            $orderresult[$i]['href']='/index.php/Order/'.$state;
        }
        $this->assign('myorders',$orderresult);
        $this->assign('keywords',$keywords);
        $this->display();

    }

    /*shopping cart gives us goodsid and amounts*/
    public function createorder($cartinfo){
           
        $orders=D('Orders');
        $ordergoods=D('OrderGoods');
        $flag1=$orders->create($orderinfo);
        //$flag2=$ordergoods->($goodsinfo);
        if($flag1&&$flag2)
             ;
             $this->display();
    }
     public function pay() {}
     public function refund(){}
     public function confirm_receipt(){}
}
