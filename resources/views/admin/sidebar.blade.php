<div class="col-md-3">
    <div class="card">
        <div class="card-header">
            Sidebar
        </div>

        <div class="card-body">
            <ul class="nav" role="tablist">
                <li role="presentation">
                    <a href="{{ url('/admin') }}">
                        Dashboard
                    </a>
                </li>
            </ul>
                @if(Auth::user()->user_type ==1 )
                <ul class="nav" role="tablist">
                    <li role="presentation">
                        <a href="{{ url('admin/category') }}">
                            Category
                        </a>
                    </li>
                </ul>
                    <ul class="nav" role="tablist">
                    <li role="presentation">
                        <a href="{{ url('/blog') }}">
                            Blog
                        </a>
                    </li>
                    </ul>
                    <ul class="nav" role="tablist">
                    <li role="presentation">
                        <a href="{{ url('/admin/user-type') }}">
                            User Type
                        </a>
                    </li>
                    </ul>
                 @endif
            </ul>
        </div>
    </div>
</div>
