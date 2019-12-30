@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Transaction History</div>

                    @foreach($carts as $cart)

                        <label for="transaction_id" class="pr-2">Transaction ID: {{ $cart->id }} </label>
                        <label for="transaction_date" class="pr-2">Transaction Date: {{ $cart->date }} </label>
                        <label for="user_name" class="pr-2">Name: {{ $cart->name }} </label>
                        <label for="courier" class="pr-2">Courier: {{ $cart->courier }} </label>

                        <table class="table">
                            <tr>
                                <th> Picture </th>
                                <th> Name </th>
                                <th> Quantity </th>
                                <th> Price </th>
                            </tr>

                            @foreach($cart_items as $cart_item)
                                <tr>
                                    @if($cart->id == $cart_item->cart_history_id)
                                        <td><img src="{{ URL::to($cart_item->flower_pic) }}" width="150px" height="150px" alt="foto">  </td>
                                        <td> {{ $cart_item->name }} </td>
                                        <td> {{ $cart_item->quantity }} </td>
                                        <td> Rp. {{ $cart_item->price }} </td>
                                    @endif
                                </tr>
                            @endforeach

                        </table>

                        <div class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3">
                            <label for="total_label" class="pr-2">Total Price </label>
                            <label for="total_price" class="pr-2">Rp. {{ $cart->total }} </label>
                        </div>

                    @endforeach

                </div>
            </div>
        </div>
    </div>
@endsection
