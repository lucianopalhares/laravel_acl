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
                                @can('view_post',$post)
                                    <p>Title: {{$post->title}}</p>
                                    <p>{{$post->description}}</p>
                                    <p>Autor: {{$post->user->name}}</p>
                                    @can('edit_post',$post)
                                        <a href="{{url('/home/'.$post->id.'/update')}}">Editar</a>
                                    @endcan
                                @endcan
                                <hr>
                            @empty
                                <p>No posts</p>
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
