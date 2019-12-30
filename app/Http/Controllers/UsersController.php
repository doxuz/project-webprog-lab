<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('admin')->only(['index','edit','adminUpdate','destroy']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = DB::table('users')->paginate(10);
        return view('manageUsers', compact('users'));
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
    public function show()
    {
        $user = User::find(Auth::user()->id);
        return view('profile', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        return view('updateUser', compact('user'));
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
            'name' => ['required', 'string'],
            'email' => ['required', 'email', 'unique:users'],
            'phone' => ['required', 'digits_between:8,12'],
            'gender' => ['required'],
            'address' => ['required', 'min:10'],
            'image' => ['required', 'mimes:jpeg,png,jpg'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $user = User::find($id);
        $user->email = $request->email;
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->gender = $request->gender;
        $user->address = $request->address;

        $file = $request->file('image');
        $filename = $file->getClientOriginalName();
        $path = $file->move('uploads', $filename);

        $user->profile_pic = $path;
        $user->save();

        return redirect()->action('UsersController@show');
    }

    public function adminUpdate(Request $request, $id)
    {
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string'],
            'email' => ['required', 'email', 'unique:users'],
            'phone' => ['required', 'digits_between:8,12'],
            'gender' => ['required'],
            'address' => ['required', 'min:10'],
            'image' => ['required', 'mimes:jpeg,png,jpg'],
        ]);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation->errors());
        }

        $user = User::find($id);
        $user->email = $request->email;
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->gender = $request->gender;
        $user->address = $request->address;

        $file = $request->file('image');
        $filename = $file->getClientOriginalName();
        $path = $file->move('uploads', $filename);

        $user->profile_pic = $path;
        $user->save();

        return redirect()->action('UsersController@index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::find($id);
        $user->delete();

        return redirect()->action('UsersController@index');
    }
}
