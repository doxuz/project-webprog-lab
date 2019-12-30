@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Manage Flower Types</div>

                    <a href="/insertFlowerType" class="btn">
                        <input type="submit" value="Insert Flower Type" class="btn btn-success">
                    </a>

                    <form class="form-inline my-2 my-lg-0 d-flex justify-content-center pt-3 pb-3" action="{{ URL::to('/searchType') }}" method="get">
                        <input class="typeahead form-control mr-2" type="text" name="search" placeholder="Search">
                        <input class="btn btn-outline-success my-2 my-sm-0" name="action" type="submit" value="Search">
                    </form>

                    <table class="table">
                        <tr>
                            <th> Name </th>
                            <th> Update </th>
                            <th> Delete </th>
                        </tr>

                        @foreach($flowerTypes as $flower)
                            <tr>
                                <td> {{ $flower->name }} </td>
                                <td>
                                    <a href="/editFlowerType/{{ $flower->id }}">
                                        <input type="submit" value="Update" class="btn btn-secondary">
                                    </a>
                                </td>
                                <td>
                                    <form method="post" action="{{ URL::to('/deleteFlowerType/'.$flower->id) }}">
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
                            {{ $flowerTypes->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
