<?php

namespace App\Http\Controllers;

use App\Flower;
use App\Flower_type;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class FlowersController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except(['index','search','show']);
        $this->middleware('admin')->only(['manageFlowerIndex','searchManage','create','store','edit','update','destroy']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $flowers = DB::table('flowers')->paginate(10);
        return view('home', compact('flowers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $types = Flower_type::all();
        return view('insertFlower', compact('types'));
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
        'type' => ['required'],
        'price' => ['required', 'numeric', 'min:10000'],
        'description' => ['required', 'between:20,200'],
        'stock' => ['required', 'numeric', 'min:1'],
        'image' => ['required', 'mimes:jpeg,png,jpg'],
    ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $flower = new Flower();
        $flower->name = $request->name;
        $flower->flower_type_id = $request->type;
        $flower->price = $request->price;
        $flower->description = $request->description;
        $flower->stock = $request->stock;

        $file = $request->file('image');
        $filename = $file->getClientOriginalName();
        $path = $file->move('uploads', $filename);

        $flower->flower_pic = $path;
        $flower->save();

        return redirect()->action('FlowersController@manageFlowerIndex');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $flower = Flower::find($id);
        return view('details', compact('flower'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $flower = Flower::find($id);
        $types = Flower_type::all();
        return view('updateFlower',compact('flower','types'));
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
            'type' => ['required'],
            'price' => ['required', 'numeric', 'min:10000'],
            'description' => ['required', 'between:20,200'],
            'stock' => ['required', 'numeric', 'min:1'],
            'image' => ['required', 'mimes:jpeg,png,jpg'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $flower = Flower::find($id);
        $flower->name = $request->name;
        $flower->flower_type_id = $request->type;
        $flower->price = $request->price;
        $flower->description = $request->description;
        $flower->stock = $request->stock;

        $file = $request->file('image');
        $filename = $file->getClientOriginalName();
        $path = $file->move('uploads', $filename);

        $flower->flower_pic = $path;
        $flower->save();

        return redirect()->action('FlowersController@manageFlowerIndex');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $flower = Flower::find($id);
        $flower->delete();

        return redirect()->action('FlowersController@manageFlowerIndex');
    }

//    SEARCH FLOWERS
    public function search(Request $request)
    {
        $flowers = DB::table('flowers')
            ->where("name","LIKE","%{$request->input('search')}%")
            ->orWhere("description","LIKE","%{$request->input('search')}%")
            ->paginate(10);
        return view('home', compact('flowers'));
    }

    public function manageFlowerIndex()
    {
        $flowers = DB::table('flowers')->paginate(10);
        return view('manageFlowers', compact('flowers'));
    }

    public function searchManage(Request $request)
    {
        $flowers = DB::table('flowers')
            ->where("name","LIKE","%{$request->input('search')}%")
            ->orWhere("description","LIKE","%{$request->input('search')}%")
            ->paginate(10);
        return view('manageFlowers', compact('flowers'));
    }

}
