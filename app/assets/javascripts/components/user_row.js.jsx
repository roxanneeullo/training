var UserRow = React.createClass({

  render: function() {
    user = this.props.user
    return (
      <tr>
				<td><div className="card hovercard2">
      			<div className="cardheader">
						</div>
						<div className="avatar"><a href={"/users/"+user.id}><img src={user.thumb_path} /></a>
						</div></div>
				</td>
        <td>{user.first_name}</td>
        <td>{user.last_name}</td>
        <td>{user.position}</td>
        <td>{user.email}</td>
				<td>{user.username}</td>
				<td>{user.department.department_name}</td>
        <td><a className="link" href={"/users/"+user.id}>Show</a></td>
      </tr>
    )
  }
});
