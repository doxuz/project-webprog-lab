@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Manage Couriers</div>

                    <a href="/insertCourier" class="btn">
                        <input type="submit" value="Insert Couriers" class="btn btn-success">
                    </a>

                    <form class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3" action="{{ URL::to('/searchCourier') }}" method="get">
                        <input class="typeahead form-control mr-2" type="text" name="search" placeholder="Search">
                        <input class="btn btn-outline-success my-2 my-sm-0" name="action" type="submit" value="Search">
                    </form>

                    <table class="table">
                        <tr>
                            <th> Name </th>
                            <th> Cost </th>
                            <th> Update </th>
                            <th> Delete </th>
                        </tr>

                        @foreach($couriers as $courier)
                            <tr>
                                <td> {{ $courier->name }} </td>
                                <td> Rp. {{ $courier->cost }} </td>
                                <td>
                                    <a href="/editCourier/{{ $courier->id }}">
                                        <input type="submit" value="Update" class="btn btn-secondary">
                                    </a>
                                </td>
                                <td>
                                    <form method="post" action="{{ URL::to('/deleteCourier/'.$courier->id) }}">
                                        {{csrf_field()}}
                                        {{ method_field('DELETE') }}
                                        <input type="submit" value="Delete" class="btn btn-danger">
                                    </form>
                                </td>
                            </tr>
                        @endforeach

                    </table>

                    <div class="row">
                        <div class="col-12 d-flex justify-content-center">
                            {{ $couriers->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
