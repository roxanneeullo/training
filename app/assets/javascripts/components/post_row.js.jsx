var PostRow = React.createClass({
		
  render: function() {
    post = this.props.post
		current_user = this.props.current_user					
		
    return (
			<div className="row">
				<div className="col-md-3">
					<div className="card hovercard">
      			<div className="cardheader">
						</div>
						<div className="avatar">
							<a href={"/users/"+post.user.id}><img src={post.thumb_path} /></a>
						</div>
					</div>
				</div>
				<div className="col-md-9">		
					<h3><a href={"/users/"+post.user.id}> {post.user.first_name} </a></h3>
					<h4><a href={"/departments/"+post.user.department.id}>{post.user.department.department_name}</a></h4>
					<h5>{post.created_at}</h5>
					<p>{post.content}</p>
					
						{current_user.id == post.user.id && <a className="post" href={"/posts/"+post.id} data-confirm="Are you sure you want to delete this post?" data-method="delete" className="btn btn-danger btn-xs"><i className="fa fa-trash-o" aria-hidden="true">
							Delete</i></a>}
						<br/>
					
					<hr/>
					
				</div>
			</div>
    )
  }
});
