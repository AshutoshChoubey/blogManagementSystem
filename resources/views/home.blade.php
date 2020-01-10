@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>
               
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="row">
                    @if(Auth::user()->user_type ==1 )
                <div class="col-sm-4">
                    <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
                        <div class="card-header">Manage Category</div>
                        <div class="card-body">
                            <h5 class="card-title">Create category</h5>
                            <p class="card-text">If You want to manage Category Please<a href="{{ url('/admin/category')}}"> click Here</a> </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                        <div class="card text-white bg-secondary mb-3" style="max-width: 18rem;">
                        <div class="card-header">Blog Management System</div>
                        <div class="card-body">
                            <h5 class="card-title">Blog</h5>
                            <p class="card-text">If you want to add blog then <a href="{{ url('/blog')}}">click here.</></p>
                        </div>
                        </div>
                        </div>
                        
                        @else
                <div class="col-sm-4">
                        <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
                        <div class="card-header">Welcome</div>
                        <div class="card-body">
                            <h5 class="card-title">Contact Us</h5>
                            <p class="card-text">Please contact Us for accessing protected resources.</p>
                        </div>
                        </div>
                        </div>
                        @endif
                <!-- <div class="col-sm-4">
                        <div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Danger card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        </div>
                        </div> -->
                <!-- <div class="col-sm-4">
                        <div class="card text-white bg-warning mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Warning card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        </div>
                        </div>
                <div class="col-sm-4">
                        <div class="card text-white bg-info mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Info card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                        </div>
                        </div> -->
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
