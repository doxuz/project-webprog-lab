@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Manage Flowers</div>

                    <a href="/insertFlower" class="btn">
                        <input type="submit" value="Insert Flower" class="btn btn-success">
                    </a>

                    <form class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3" action="{{ URL::to('/searchManage') }}" method="get">
                        <input class="typeahead form-control mr-2" type="text" name="search" placeholder="Search">
                        <input class="btn btn-outline-success my-2 my-sm-0" name="action" type="submit" value="Search">
                    </form>

                    <table class="table">
                        <tr>
                            <th> Photo </th>
                            <th> Name </th>
                            <th> Description </th>
                            <th> Update </th>
                            <th> Delete </th>
                        </tr>

                        @foreach($flowers as $flower)
                            <tr>
                                <td><img src="{{ $flower->flower_pic }}" width="150px" height="150px" alt="foto">  </td>
                                <td> {{ $flower->name }} </td>
                                <td> {{ $flower->description }} </td>
                                <td>
                                    <a href="/editFlower/{{ $flower->id }}">
                                        <input type="submit" value="Update" class="btn btn-secondary">
                                    </a>
                                </td>
                                <td>
                                    <form method="post" action="{{ URL::to('/deleteFlower/'.$flower->id) }}">
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
                            {{ $flowers->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
