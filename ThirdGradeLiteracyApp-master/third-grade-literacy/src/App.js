import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { Switch, Redirect, Route } from 'react-router';
import { BrowserRouter, Link } from 'react-router-dom';

import logo from './logo.svg';
import './App.css';


import Login from './components/Login';
import Register from './components/Register';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {}
  }
  render() {
    return (

      <BrowserRouter>
          <Switch>
            <Route path='/login' component={Login} />
            <Route path='/register' component={Register} />
          </Switch>
      </BrowserRouter>
    );
  }
}

export default App;
