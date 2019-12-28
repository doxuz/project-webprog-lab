@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">

                <div class="card-header">Catalog</div>

                <form class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3" action="{{ URL::to('/search') }}" method="get">
                    <input class="typeahead form-control mr-2" type="text" name="search" placeholder="Search">
                    <input class="btn btn-outline-success my-2 my-sm-0" name="action" type="submit" value="Search">
                </form>

                <table class="table">
                    <tr>
                        <th> Photo</th>
                        <th> Name</th>
                        <th> Description</th>
                        <th> Details</th>
                        <th> Order</th>
                    </tr>

                    @foreach($flowers as $flower)
                        <tr>
                            <td><img src="{{ $flower->flower_pic }}" width="150px" height="150px" alt="foto">  </td>
                            <td> {{ $flower->name }} </td>
                            <td> {{ $flower->description }} </td>
                            <td>
        {{--                        <a href="/member/edit/{{$m->member_id}}">--}}
                                <a href="/">
                                    <input type="submit" value="Details">
                                </a>
                            </td>
                            <td>
                                <a href="/">
                                    <input type="submit" value="Order">
                                </a>
                            </td>
                        </tr>
                    @endforeach

                </table>

                <div class="row">
                    <div class="col-12 d-flex justify-content-center">
                        {{ $flowers->links() }}
                    </div>
                </div>

{{--                <div class="card-header">Dashboard</div>--}}

{{--                <div class="card-body">--}}
{{--                    @if (session('status'))--}}
{{--                        <div class="alert alert-success" role="alert">--}}
{{--                            {{ session('status') }}--}}
{{--                        </div>--}}
{{--                    @endif--}}

{{--                    You are logged in!--}}
{{--                </div>--}}
            </div>
        </div>
    </div>
</div>
@endsection
