var UserList = React.createClass({

  render: function() {
    return (
      <div>
        <table className="table table-striped">
          <thead>
            <tr>
							<th>Avatar</th>
              <th>First name</th>
              <th>Last name</th>
              <th>Position</th>
              <th>Email</th>
							<th>Username</th>
							<th>Department</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {this.props.users.map(function(user, i){
              return <UserRow key={i} user={user}/>
            })}
          </tbody>
        </table>
      </div>
    );
  }
});
