@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('Update Flower') }}</div>

                    <div class="card-body">
                        <form method="POST" action="{{ URL::to('/updateFlower/'.$flower->id) }}" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Flower Name') }}</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control" name="name" value="" placeholder="{{ $flower->name }}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="price" class="col-md-4 col-form-label text-md-right">{{ __('Flower Price') }}</label>

                                <div class="col-md-6">
                                    <input id="price" type="text" class="form-control" name="price" value="" placeholder="{{ $flower->price }}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="stock" class="col-md-4 col-form-label text-md-right">{{ __('Flower Stock') }}</label>

                                <div class="col-md-6">
                                    <input id="stock" type="text" class="form-control" name="stock" value="" placeholder="{{ $flower->stock }}">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="type" class="col-md-4 col-form-label text-md-right">{{ __('Flower Type') }}</label>

                                <div class="col-md-6">
                                    <select name="type" class="form-control" style="width: 150px">
                                        @foreach($types as $type)
                                            <option value="{{$type->id}}">{{$type->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-md-4 col-form-label text-md-right">{{ __('Description') }}</label>

                                <div class="col-md-6">
                                    <textarea name="description" id="description" cols="30" rows="10" placeholder="{{ $flower->description }}"></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="image" class="col-md-4 col-form-label text-md-right">{{ __('Image') }}</label>

                                <div class="col-md-6">
                                    <input type="file" name="image" id="image">
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
