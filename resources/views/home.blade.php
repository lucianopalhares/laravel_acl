@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="row">
                        <div class="col-md-12">
                            @forelse($posts as $post)
                                <h4>Title: {{$post->title}}</h4>

                                <p>{{$post->description}}</p>

                                <p><b>Autor: {{$post->user->name}}</b></p>

                                <br>
                                <a href="{{url('/post/'.$post->id.'/update')}}" class="btn btn-primary">Editar</a>
                            @empty
                                <button class="btn btn-danger" disabled="disabled">Sem dados</button>
                            @endforelse
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
