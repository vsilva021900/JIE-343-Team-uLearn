
import React, { Component } from 'react';


class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {};
    }

    render() {
        return (
            <div style={{ width: '100%', height: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', backgroundColor: '#00b5ad'}}>
                <div class="ui card">
                    <div class="ui form content">
                        <div class="field">
                            <label>Username</label>
                            <input type="text" name="first-name" placeholder="Username"></input>
                        </div>
                        <div class="field">
                            <label>Password</label>
                            <input type="text" name="last-name" placeholder="Password"></input>
                        </div>
                        <button class="ui right labeled icon button primary">
                            <i class="hand point right outline icon"></i>
                            Login
                        </button>
                        <a class="ui right labeled icon button primary" href="/register">
                            <i class="hand point right outline icon"></i>
                            Register Here
                        </a>
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;