var PostRow = React.createClass({

  render: function() {
    post = this.props.post
    return (
			<div className="row">
				<div className="col-md-3">
					<a href={"/users/"+post.user.id}><img src={post.thumb_path} /></a>
				</div>
				<div className="col-md-9">		
					<h3>{post.user.first_name}</h3>
					<h4>{post.user.department.department_name}</h4>
					<h5>{post.created_at}</h5>
					<p>{post.content}</p>
					<hr/>
				</div>
			</div>
    )
  }
});
