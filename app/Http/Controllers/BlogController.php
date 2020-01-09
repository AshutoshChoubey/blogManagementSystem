<?php

namespace App\Http\Controllers;

use App\blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
Use App\User;
Use Illuminate\Support\Facades\Auth;


class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $user=User::find(2);
       
        // $user->roles()->attach(1);
        // dd(Auth::user()->id);
        // dd($user);
        return view('addblog');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|unique:blogs|max:255',
            'keywords' => 'required',
            'category' => 'required',
            'photo' => 'required',
            'description' => 'required',
            'post' => 'required',
            'file' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect('blog')
                        ->withErrors($validator)
                        ->withInput();
        }

        if ($request->file('photo')) {
            $filenameWithExt = $request->file('photo')->getClientOriginalName();
            $file = $request->file('photo');
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);          
            $extension = $request->file('photo')->getClientOriginalExtension();
            $photoName = $filename.'_'.time().'.'.$extension; 
                if (file_exists(public_path('/uploads/blogPhoto/',$photoName))) {
                    return redirect('blog')
                        ->withInput();
                } else {
                     $file->move(public_path('uploads/blogPhoto/'), $photoName);
                } 
            }
            if ($request->file('file')) {
                $filenameWithExt = $request->file('file')->getClientOriginalName();
                $file = $request->file('file');
                $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);          
                $extension = $request->file('file')->getClientOriginalExtension();
                $photoName = $filename.'_'.time().'.'.$extension; 
                    if (file_exists(public_path('/uploads/blogFile/',$photoName))) {
                        return redirect('blog')
                        ->withInput();
                    } else {
                         $file->move(public_path('uploads/blogFile/'), $photoName);
                    } 
                }
                $input = $request->except(['_token']);
           
                $blogObj = new Blog($input);
        
                if($blogObj->save())
                {
                    $request->session()->flash('message.level', 'success');
                    $request->session()->flash('message.content', ' Added Successfully!');
                }
                else{
                    $request->session()->flash('message.level', 'error');
                    $request->session()->flash('message.content', 'There are Some Issue!');
                }
                return redirect('blog')->withInput();
    

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function show(blog $blog)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function edit(blog $blog)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, blog $blog)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function destroy(blog $blog)
    {
        //
    }
}
