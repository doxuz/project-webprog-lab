<?php

namespace App\Http\Controllers;

use App\Cart_history;
use App\Cart_item_history;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartHistoriesController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        Verify only admin can access
        $this->middleware('auth');
        $this->middleware('admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $carts = DB::table('cart_histories')
            ->join('users','cart_histories.user_id', '=', 'users.id')
            ->join('couriers','cart_histories.courier_id', '=', 'couriers.id')
            ->select(
                'cart_histories.id as id',
                'cart_histories.date as date',
                'users.name as name',
                'couriers.name as courier',
                'cart_histories.total_price as total'
            )->get();

        $cart_items = DB::table('cart_items_histories')
            ->join('flowers','cart_items_histories.flower_id', '=', 'flowers.id')
            ->get();

        return view('history', compact('carts', 'cart_items'));
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
