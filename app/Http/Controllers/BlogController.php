<?php

namespace App\Http\Controllers;

use App\blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
Use App\User;
Use App\category;
Use Illuminate\Support\Facades\Auth;
Use DB; 


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
            $blog = DB::table('blogs')->join('categories', 'categories.id', '=', 'blogs.category')->select('categories.categoryname','blogs.*')->where('categoryname', 'LIKE', '%' .  $keyword . '%' )
            ->orWhere ( 'title', 'LIKE', '%' .  $keyword . '%')
            ->orWhere ( 'keywords', 'LIKE', '%' .  $keyword . '%')
            ->where('blogs.deleted_at','=',null)
            ->latest()->paginate($perPage); 
        } else {
            $blog = DB::table('blogs')->join('categories', 'categories.id', '=', 'blogs.category')->select('categories.categoryname','blogs.*')->where('blogs.deleted_at','=',null)->latest()->paginate($perPage);
        }
        // dd($blog->category);

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
            'photo' => 'mimes:jpg,jpeg,bmp,png,gif,svg|max:2048',
            'description' => 'required',
            'post' => 'required',
            // 'file' => 'required',
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
        $input = $request->except(['_token','photo','file']);
        $blogObj = new Blog($input);
        if ($request->photo) {
           
            $photoNmaeWithExt = $request->photo->getClientOriginalName();
            $photo = $request->photo;
            $photoName = pathinfo($photoNmaeWithExt, PATHINFO_FILENAME);          
            $photoExtension = $request->photo->getClientOriginalExtension();
            $finalPhotoName = $photoName.'_'.time().'.'.$photoExtension; 
                // if (!file_exists(public_path('/uploads/blogPhoto/',$finalPhotoName))) {
                    // return redirect('blog/create')
                    //     ->withInput();
                    $photo->move(public_path('uploads/blogPhoto/'), $finalPhotoName);
                    $blogObj->photo=$finalPhotoName;
                // } 
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
                    // if (!file_exists(public_path('/uploads/blogFile/',$finalFileName))) {
                        $file->move(public_path('uploads/blogFile/'), $finalFileName);
                        $blogObj->file=$finalFileName;
                        // return redirect('blog/create')
                        // ->withInput();
                    // } 
                    // else {
                    //      $file->move(public_path('uploads/blogFile/'), $finalFileName);
                    // } 
                }
                
           
                
               
                
                $blogObj->author=Auth::user()->name;
                $blogObj->author_email=Auth::user()->email;
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

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $article = blog::where('slug', $slug)->firstOrFail()->toArray();
        $viewData['categoryName']=category::find($article['category'])->categoryname;
        return view('article',$viewData)->with($article);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $blogDetails = blog::findOrFail($id)->toArray();
        // $getFormAutoFillup = blog::whereId($id)->first()->toArray();
        $categoryForSelect=category::all();
        // dd($getFormAutoFillup);
        return view('addblog',['categoryForSelect' => $categoryForSelect])->with($blogDetails);;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\blog  $blog
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:255',
            'keywords' => 'required',
            'category' => 'required',
            'photo' => 'mimes:jpg,jpeg,bmp,png,gif,svg|max:2048',
            'description' => 'required',
            'post' => 'required',
            // 'file' => 'required',
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
        $requestData = $request->except(['_token','photo','file']);
        // $requestData = $request->all();
        
        $blogData = blog::findOrFail($request->id);
        

        if ($request->photo) {
           
            $photoNmaeWithExt = $request->photo->getClientOriginalName();
            $photo = $request->photo;
            $photoName = pathinfo($photoNmaeWithExt, PATHINFO_FILENAME);          
            $photoExtension = $request->photo->getClientOriginalExtension();
            $finalPhotoName = $photoName.'_'.time().'.'.$photoExtension; 
                // if (!file_exists(public_path('/uploads/blogPhoto/',$finalPhotoName))) {
                    // return redirect('blog/create')
                    //     ->withInput();
                    $photo->move(public_path('uploads/blogPhoto/'), $finalPhotoName);
                    $requestData['photo']=$finalPhotoName;
                // } 
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
                    // if (!file_exists(public_path('/uploads/blogFile/',$finalFileName))) {
                        $file->move(public_path('uploads/blogFile/'), $finalFileName);
                        $requestData['file']=$finalFileName;
                        // return redirect('blog/create')
                        // ->withInput();
                    // } 
                    // else {
                    //      $file->move(public_path('uploads/blogFile/'), $finalFileName);
                    // } 
                }
               
           
             
                
                // $blogObj->author=Auth::user()->name;
                // $blogObj->author_email=Auth::user()->email;
                if($blogData->update($requestData))
                {
                    $request->session()->flash('message.level', 'success');
                    $request->session()->flash('message.content', ' Updated Successfully!');
                }
                else{
                    $request->session()->flash('message.level', 'error');
                    $request->session()->flash('message.content', 'There are Some Issue!');
                }
                return redirect()->back();
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
    public function publisedList()
    {
       $publishedBlogList= blog::where('published','=',1)->orderby('created_at','desc')->paginate(10);
        return view('publishedBlogList',['bloglists'=>$publishedBlogList,'title'=>'Blog list']);
    }
    public function blogPublished(Request $request,$id)
    {
        $publishedUpdate = $request->published;
        // $requestData = $request->all();
        if($publishedUpdate==1)
        {
            $publishedUpdate=0; 
        }
        else{
            $publishedUpdate=1; 
        }
        // dd($publishedUpdate);
        $blogData = blog::findOrFail($id);
        if($blogData->update(['published'=>$publishedUpdate]))
        {
            $request->session()->flash('message.level', 'success');
            $request->session()->flash('message.content', ' Updated Successfully!');
        }
        else{
            $request->session()->flash('message.level', 'error');
            $request->session()->flash('message.content', 'There are Some Issue!');
        }
        return redirect()->back();
    }
}
