var NewsfeedPost = React.createClass({	
  render: function() {
    return (
     <div className="container">
			<div className="row">
  			<div className="col-lg-12">
    			<h1 className="page-header">Newsfeed
      			<small>Posts</small>
      		</h1>
    		</div>
 		 	</div>
 		 	<div className="container">
      		{this.props.posts.map((post, i) => {
        		return( <PostRow current_user={this.props.current_user} key={i} post={post}/>
						);
      		})}
			</div>
		</div>
    )
  }
});