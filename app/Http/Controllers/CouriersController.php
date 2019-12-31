<?php

namespace App\Http\Controllers;

use App\Courier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CouriersController extends Controller
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
        $couriers = DB::table('couriers')->paginate(10);
        return view('manageCouriers', compact('couriers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('insertCourier');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'min:3'],
            'cost' => ['required', 'numeric' ,'min:3000'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $couriers = new Courier();

        $couriers->name = $request->name;
        $couriers->cost = $request->cost;
        $couriers->save();

        return redirect()->action('CouriersController@index');
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
        $courier = Courier::find($id);
        return view('updateCourier',compact('courier'));
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
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'min:3'],
            'cost' => ['required', 'numeric' ,'min:3000'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $couriers = Courier::find($id);

        $couriers->name = $request->name;
        $couriers->cost = $request->cost;
        $couriers->save();

        return redirect()->action('CouriersController@index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $courier = Courier::find($id);
        $courier->delete();

        return redirect()->action('CouriersController@index');
    }

    //    SEARCH COURIER
    public function search(Request $request)
    {
        $couriers = DB::table('couriers')
            ->where("name","LIKE","%{$request->input('search')}%")
            ->paginate(10);
        return view('manageCouriers', compact('couriers'));
    }
}
