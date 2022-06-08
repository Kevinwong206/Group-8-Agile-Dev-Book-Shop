<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CartItem;
use App\Models\User;
use App\Models\Stock;
use Session;
use DB;

class HomeController extends Controller
{
    public function shoppingCartView(Request $request){
        if(Session::has('userId')){
            return view("shoppingCart");
        }else{
            return redirect()->route('LoginUser');
        }
    }

    public function getUserAddress(Request $request){
        if(Session::has('userId')){
            $userID = Session::get('userId');
            $user = User::find($userID);
            return $user;
        }
        
        return null;
    }

    /* public function processCart(Request $request)
    {
        if(Session::has('userId')){
            //Initial value
            $initialPrice = Session::get('priceItem');
            $initialItemCount = Session::get('numItem');
            $userID = Session::get('userId');
            //Get value
            $selectedPrice = $request->addButton;
            $ISBNValue=$request->bookISBN;

            //Sum value
            $newPrice = $initialPrice + $selectedPrice;
            $newItemCount = $initialItemCount + 1;

            //Update session
            $request->session() -> put('numItem',$newItemCount);
            $request->session() -> put('priceItem',$newPrice);

            $data = array('qty' => $newItemCount, 'price' => $newPrice);
            $data = json_encode($data);
            
            //Upload to database 
            //check if the book exists for the user already
            if(CartItem::where('userID',$userID)->where('ISBN13',$ISBNValue)->exists()){
                $existingValue = CartItem::select('qty')->where('userID',$userID) ->Where('ISBN13',$ISBNValue) ->get();
                $existingValue = preg_replace('/[^0-9]/','',$existingValue);
                $updatedNumValue =$existingValue+1;
                CartItem::where('userID',$userID) ->Where('ISBN13',$ISBNValue) -> update(['qty' => $updatedNumValue]);
            }
            else{
                $cartItem = new CartItem();
                $cartItem->userID = $userID;
                $cartItem->ISBN13 = $ISBNValue;
                $cartItem->qty = 1;
                $res = $cartItem->save();
            }

            //Update Header
            return redirect()->route('addCart');
        }
        else{
            return redirect()->route('LoginUser');
        }
    } */

    public function processCart(Request $request)
    {
        if(Session::has('userId')){
            //Initial value
            $initialPrice = Session::get('priceItem');
            $initialItemCount = Session::get('numItem');
            $userID = Session::get('userId');
            // Get ISBN13
            $ISBN13 = $request->bookISBN;

            // Get stock data
            $stock = Stock::find($ISBN13);

            //Sum value
            $newPrice = $initialPrice + $stock->retailPrice;
            $newItemCount = $initialItemCount + 1;

            //Update session
            $request->session() -> put('numItem',$newItemCount);
            $request->session() -> put('priceItem',$newPrice);
            
            //Upload to database 
            //check if the book exists for the user already
            if(CartItem::where('userID',$userID)->where('ISBN13',$ISBN13)->exists()){
                $existingValue = CartItem::select('qty')->where('userID',$userID) ->Where('ISBN13',$ISBN13) ->get();
                $existingValue = preg_replace('/[^0-9]/','',$existingValue);
                $updatedNumValue =$existingValue+1;
                CartItem::where('userID',$userID) ->Where('ISBN13',$ISBN13) -> update(['qty' => $updatedNumValue]);
            }
            else{
                $cartItem = new CartItem();
                $cartItem->userID = $userID;
                $cartItem->ISBN13 = $ISBN13;
                $cartItem->qty = 1;
                $res = $cartItem->save();
            }

            // put cart data in array to be returned
            $data = array('qty' => $newItemCount, 'price' => $newPrice);
            $data = json_encode($data);
            
            return $data;
        }
    }
}

//add to database and get value of user id