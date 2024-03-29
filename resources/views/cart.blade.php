@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Cart</div>

                    <table class="table">
                        <tr>
                            <th> Picture </th>
                            <th> Name </th>
                            <th> Quantity </th>
                            <th> Price </th>
                            <th> Action </th>
                        </tr>

                        @foreach($flowers as $flower)
                            <tr>
                                <td><img src="{{ URL::to($flower->flower_pic) }}" width="150px" height="150px" alt="foto">  </td>
                                <td> {{ $flower->name }} </td>
                                <td> {{ $flower->quantity }} </td>
                                <td> Rp. {{ $flower->price }} </td>
                                <td>
                                    <form method="post" action="{{ URL::to('/delete/'.$flower->flower_id) }}">
                                        {{csrf_field()}}
                                        {{ method_field('DELETE') }}
                                        <input type="submit" value="Remove" class="btn btn-danger">
                                    </form>
                                </td>
                            </tr>
                        @endforeach

                    </table>
                    @isset($flower)
                        <form method="get" action="{{ URL::to('/checkout/'.$flowers[0]->cart_id) }}">

                            <div class="form-group d-flex justify-content-center">
                                <label for="courier" class="pr-2">Courier </label>
                                <select name="courier" class="form-control" style="width: 150px">
                                    @foreach($couriers as $courier)
                                        <option value="{{$courier->id}}">{{$courier->name}} - {{$courier->cost}}</option>
                                    @endforeach
                                </select>
                            </div>


                            <div class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3">
                                <label for="total_label" class="pr-2">Total Price </label>
                                <label for="total_price" class="pr-2">Rp. {{ $flowers[0]->total_price }} </label>
                                <input type="submit" value="Checkout" class="btn btn-success">
                            </div>

                        </form>
                    @endisset

                </div>
            </div>
        </div>
    </div>
@endsection
