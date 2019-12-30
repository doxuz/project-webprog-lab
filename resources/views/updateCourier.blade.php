@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('Update Courier') }}</div>

                    <div class="card-body">
                        <form method="POST" action="{{ URL::to('/updateCourier/'.$courier->id) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Courier Name') }}</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control" name="name" value="" placeholder="{{ $courier->name }}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="cost" class="col-md-4 col-form-label text-md-right">{{ __('Shipping Cost') }}</label>

                                <div class="col-md-6">
                                    <input id="cost" type="text" class="form-control" name="cost" value="" placeholder="{{ $courier->cost }}">
                                </div>
                            </div>

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Update') }}
                                    </button>
                                </div>
                            </div>
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
    </div>
@endsection
