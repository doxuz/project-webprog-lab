@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Flower Details</div>

                    <table class="table">
                        <tr>
                            <th> Photo </th>
                            <th> Name </th>
                            <th> Description </th>
                            <th> Price </th>
                            <th> Stock </th>
                        </tr>

                            <tr>
                                <td><img src="{{ URL::to($flower->flower_pic) }}" width="150px" height="150px" alt="foto">  </td>
                                <td> {{ $flower->name }} </td>
                                <td> {{ $flower->description }} </td>
                                <td> Rp. {{ $flower->price }} </td>
                                <td> {{ $flower->stock }} </td>
                            </tr>

                    </table>
                    <form class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3" action="{{ URL::to('/update/'.$flower->id) }}" method="put">
                        {{csrf_field()}}
                        <input class="typeahead form-control mr-2" type="text" name="quantity" placeholder="Quantity">
                        <input class="btn btn-outline-success my-2 my-sm-0" name="action" type="submit" value="Add to cart">
                    </form>

                    <ul>
                        @foreach($errors->all() as $err)
                            <li> {{ $err }} </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
@endsection
