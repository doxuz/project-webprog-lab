<?php

namespace App\Http\Controllers;

use App\Cart;
use App\Cart_item;
use App\Courier;
use App\Flower;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CartsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $flowers = DB::table('cart_items')
            ->join('flowers','cart_items.flower_id', '=', 'flowers.id')
            ->join('carts','cart_items.cart_id', '=', 'carts.id')
            ->where('user_id','=', Auth::user()->id)
            ->get();

        $couriers = Courier::all();

        return view('cart',compact('flowers','couriers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
//        Validate quantity more than 0 and below the amount in stock
        $flower = Flower::find($id);
        $validation = Validator::make($request->all(), [
            'quantity' => ['required', 'integer', 'min:1', 'max:'.$flower->stock]
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

//        Update flower stock
        $flower->stock -= $request->quantity;
        $flower->save();

//        Find user's cart
        $user_id = Auth::user()->id;
        $cart = DB::table('carts')
            ->where('user_id','LIKE', $user_id)
            ->get();

//        If the user has no cart yet
        if ($cart == '[]') {
            $cart = new Cart();
            $cart->user_id = $user_id;
            $cart->courier_id = null;
            $cart->total_price = 0;
            $cart->save();
        }

//        Find user's flower
        $cart_item = DB::table('cart_items')
            ->where([
                ['cart_id', '=', $cart->first()->id],
                ['flower_id', '=', $id]
            ])->get();

//        If the flower that wanted to be added does not exist yet
        if ($cart_item == '[]') {
            $cart_item = new Cart_item();
            $cart_item->cart_id = $cart->first()->id;
            $cart_item->flower_id = $id;
            $cart_item->quantity = $request->quantity;
            $cart_item->save();
        } else {
//            If it exist update the quantity
            $updated_quantity = $cart_item->first()->quantity + $request->quantity;
            DB::table('cart_items')
                ->where([
                    ['cart_id', '=', $cart->first()->id],
                    ['flower_id', '=', $id]
                ])->update(['quantity' => $updated_quantity]);
        }

//        Calculate total price
        $total = DB::table('cart_items')
            ->join('flowers','cart_items.flower_id', '=', 'flowers.id')
            ->where('cart_id','=', $cart->first()->id)
            ->sum(DB::raw('price * quantity'));

//        Update total price
        DB::table('carts')
            ->where('user_id','LIKE', $user_id)
            ->update(['total_price' => $total]);

        return redirect()->back();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
//        Recalculate stock
        $flower = Flower::find($id);

        $stock = DB::table('cart_items')
            ->join('carts','cart_items.cart_id', '=', 'carts.id')
            ->where('user_id','=', Auth::user()->id)
            ->where('flower_id','=',$id)
            ->get();

//        Update stock
        $flower->stock += $stock->first()->quantity;
        $flower->save();

        DB::table('cart_items')
            ->join('carts','cart_items.cart_id', '=', 'carts.id')
            ->where('user_id','=', Auth::user()->id)
            ->where('flower_id','=',$id)
            ->delete();

//        Recalculate total price
        $cart = DB::table('cart_items')
            ->join('carts','cart_items.cart_id', '=', 'carts.id')
            ->where('user_id','=', Auth::user()->id)
            ->get();

        $total = DB::table('cart_items')
            ->join('flowers','cart_items.flower_id', '=', 'flowers.id')
            ->where('cart_id','=', $cart->first()->cart_id)
            ->sum(DB::raw('price * quantity'));

//        Update total price
        DB::table('carts')
            ->where('user_id','LIKE', Auth::user()->id)
            ->update(['total_price' => $total]);

        return redirect()->action('CartsController@index');

    }

    // CREATE CART IF IT DOESNT EXIST OR ADD ITEMS TO CART IF IT ALREADY EXIST
    public function add($id)
    {
//        If stock is empty then return, else update stock
        $flower = Flower::find($id);
        if ($flower->stock < 1) {
            return redirect('/home');
        } else {
            $flower->stock -= 1;
            $flower->save();
        }

//        Find user's cart
        $user_id = Auth::user()->id;
        $cart = DB::table('carts')
            ->where('user_id','LIKE', $user_id)
            ->get();

//        If the user has no cart yet
        if ($cart == '[]') {
            $cart = new Cart();
            $cart->user_id = $user_id;
            $cart->courier_id = null;
            $cart->total_price = 0;
            $cart->save();
        }

//        Find user's flower
        $cart_item = DB::table('cart_items')
            ->where([
                ['cart_id', '=', $cart->first()->id],
                ['flower_id', '=', $id]
            ])->get();

//        If the flower that wanted to be added does not exist yet
        if ($cart_item == '[]') {
            $cart_item = new Cart_item();
            $cart_item->cart_id = $cart->first()->id;
            $cart_item->flower_id = $id;
            $cart_item->quantity = 1;
            $cart_item->save();
        } else {
//            If it exist update the quantity
            $updated_quantity = $cart_item->first()->quantity + 1;
            DB::table('cart_items')
                ->where([
                    ['cart_id', '=', $cart->first()->id],
                    ['flower_id', '=', $id]
                ])->update(['quantity' => $updated_quantity]);
        }

//        Calculate total price
        $total = DB::table('cart_items')
            ->join('flowers','cart_items.flower_id', '=', 'flowers.id')
            ->where('cart_id','=', $cart->first()->id)
            ->sum(DB::raw('price * quantity'));

//        Update total price
        DB::table('carts')
            ->where('user_id','LIKE', $user_id)
            ->update(['total_price' => $total]);

        return redirect('/home');
    }
}
