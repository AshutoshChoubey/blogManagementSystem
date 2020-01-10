<?php

namespace App\Http\Controllers;

use App\blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
Use App\User;
Use App\category;
Use Illuminate\Support\Facades\Auth;


class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $keyword = $request->get('search');
        $perPage = 25;
        $blog=[];
        if (!empty($keyword)) {
            $blog = blog::where('categoryname', 'LIKE', '%' .  $keyword . '%' )->orWhere ( 'categorydescription', 'LIKE', '%' .  $keyword . '%')->latest()->paginate($perPage);
        } else {
            $blog = blog::latest()->paginate($perPage);
        }

        return view('blog.index', compact('blog'));
       
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categoryForSelect=category::all();
        return view('addblog',['categoryForSelect' => $categoryForSelect]);
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
        $categoryForSelect=category::all();

        if ($validator->fails()) {
            // return view('addblog',['categoryForSelect' => $categoryForSelect])->withErrors($validator)
            // ->withInput();
            return redirect()->back()->withInput()->withErrors($validator);
            // return redirect('blog/create')
            //             ->withErrors($validator)
            //             ->withInput();
        }
        $photoName="";
        $finalFileName="";

        if ($request->photo) {
           
            $filenameWithExt = $request->photo->getClientOriginalName();
            $file = $request->photo;
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);          
            $extension = $request->photo->getClientOriginalExtension();
            $photoName = $filename.'_'.time().'.'.$extension; 
                if (!file_exists(public_path('/uploads/blogPhoto/',$photoName))) {
                    // return redirect('blog/create')
                    //     ->withInput();
                    $file->move(public_path('uploads/blogPhoto/'), $photoName);
                } 
                // else {
                //      $file->move(public_path('uploads/blogPhoto/'), $photoName);
                // } 
            }
            if ($request->file) {
                $filenameWithExt = $request->file->getClientOriginalName();
                $file = $request->file;
                $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);          
                $extension = $request->file->getClientOriginalExtension();
                $finalFileName = $filename.'_'.time().'.'.$extension; 
                    if (!file_exists(public_path('/uploads/blogFile/',$finalFileName))) {
                        $file->move(public_path('uploads/blogFile/'), $finalFileName);
                        // return redirect('blog/create')
                        // ->withInput();
                    } 
                    // else {
                    //      $file->move(public_path('uploads/blogFile/'), $finalFileName);
                    // } 
                }
                $input = $request->except(['_token','photo','file']);
           
                $blogObj = new Blog($input);
                $blogObj->photo=$photoName;
                $blogObj->file=$finalFileName;
                if($blogObj->save())
                {
                    $request->session()->flash('message.level', 'success');
                    $request->session()->flash('message.content', ' Added Successfully!');
                }
                else{
                    $request->session()->flash('message.level', 'error');
                    $request->session()->flash('message.content', 'There are Some Issue!');
                }
                return view('addblog',['categoryForSelect' => $categoryForSelect])->with($request->all());
                // return redirect('blog/create',['categoryForSelect' => $categoryForSelect])->withInput();
    

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
    public function destroy($id)
    {
        blog::destroy($id);

        return redirect('/blog')->with('flash_message', 'Blog deleted!');
    }
}
