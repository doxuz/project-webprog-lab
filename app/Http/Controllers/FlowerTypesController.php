<?php

namespace App\Http\Controllers;

use App\Flower_type;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use vendor\project\StatusTest;

class FlowerTypesController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // Verify only admin can access
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
        $flowerTypes = DB::table('flower_types')->paginate(10);
        return view('manageFlowerTypes', compact('flowerTypes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('insertFlowerType');
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
            'name' => ['required', 'min:4', 'unique:flower_types'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $flowerTypes = new Flower_type();
        $flowerTypes->name = $request->name;
        $flowerTypes->save();

        return redirect()->action('FlowerTypesController@index');

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
        $flowerType = Flower_type::find($id);
        return view('updateFlowerType', compact('flowerType'));
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
            'name' => ['required', 'min:4', 'unique:flower_types'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $flowerTypes = Flower_type::find($id);
        $flowerTypes->name = $request->name;
        $flowerTypes->save();

        return redirect()->action('FlowerTypesController@index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $flowerType = Flower_type::find($id);
        $flowerType->delete();

        return redirect()->action('FlowerTypesController@index');
    }

//    SEARCH FLOWER TYPE
    public function search(Request $request)
    {
        $flowerTypes = DB::table('flower_types')
            ->where("name","LIKE","%{$request->input('search')}%")
            ->paginate(10);
        return view('manageFlowerTypes', compact('flowerTypes'));
    }

}
