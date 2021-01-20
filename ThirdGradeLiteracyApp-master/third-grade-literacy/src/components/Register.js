import React, { Component } from 'react';


class Register extends Component {
    constructor(props) {
        super(props);
        this.state = {};
    }

    render() {
        return (
            <div style={{ width: '100%', height: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', backgroundColor: '#00b5ad' }}>
                <div class="ui card">
                    <div class="ui form content">
                        <div class="field">
                            <label>First name</label>
                            <input type="text" name="first-name" placeholder="First name"></input>
                        </div>
                        <div class="field">
                            <label>Last name</label>
                            <input type="text" name="last-name" placeholder="Last name"></input>
                        </div>
                        <div class="field">
                            <label>e-mail</label>
                            <input type="text" name="last-name" placeholder="e-mail"></input>
                        </div>
                        <div class="field">
                            <label>Username</label>
                            <input type="text" name="first-name" placeholder="Username"></input>
                        </div>
                        <div class="field">
                            <label>Password</label>
                            <input type="text" name="last-name" placeholder="Password"></input>
                        </div>
                        <div class="field">
                            <div class="ui checkbox">
                                <input type="checkbox" tabindex="0" class="hidden"></input>
                                <label>I agree to the Terms and Conditions</label>
                            </div>
                        </div>
                        <button class="ui right labeled icon button primary">
                            <i class="hand point right outline icon"></i>
                            Register 
                    </button>
                    </div>
                </div>
            </div>
        );
    }
}

export default Register;