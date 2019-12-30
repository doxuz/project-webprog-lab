@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <div class="card-header">Manage Users</div>

                    <table class="table">
                        <tr>
                            <th> Picture </th>
                            <th> Name </th>
                            <th> Email </th>
                            <th> Phone </th>
                            <th> Gender </th>
                            <th> Address </th>
                            <th> Action </th>
                        </tr>

                        @foreach($users as $user)
                            <tr>
                                <td><img src="{{ $user->profile_pic }}" width="150px" height="150px" alt="foto">  </td>
                                <td> {{ $user->name }} </td>
                                <td> {{ $user->email }} </td>
                                <td> {{ $user->phone }} </td>
                                <td> {{ $user->gender }} </td>
                                <td> {{ $user->address }} </td>
                                <td>
                                    <a href="/editUser/{{ $user->id }}">
                                        <input type="submit" value="Update" class="btn btn-secondary">
                                    </a>
                                    <form method="post" action="{{ URL::to('/deleteUser/'.$user->id) }}">
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
                            {{ $users->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
