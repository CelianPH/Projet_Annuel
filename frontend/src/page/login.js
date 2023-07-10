import { Component } from "react"; 
import { Form, Button } from "react-bootstrap"; 
import "../css/login.css";

export default class LoginForm extends Component {
  state = {
    rememberMe: false, 
    user: '', 
    pass: ''
  }; 

  handleChange = e => {
    const input = e.target; 
    const value = (input.type === 'checkbox') ? input.checked : input.value; 

    this.setState({ [input.name]: value }); 
  }; 

  handleFormSubmit = () => {
    const { rememberMe, user, pass } = this.state; 
    localStorage.setItem('rememberMe', rememberMe); 
    localStorage.setItem('user', rememberMe ? user : ''); 
    localStorage.setItem('pass', rememberMe ? pass : ''); // I could add some hashing with Bcrypt.js later.... 
  }; 

  componentDidMount() {
    const rememberMe = localStorage.getItem('rememberMe') === 'true'; 
    const user = rememberMe ? localStorage.getItem('user') : ''; 
    const pass = rememberMe ? localStorage.getItem('pass') : ''; 
    this.setState({ rememberMe, user, pass }); 
  }

  render() {
    return (
      <div class="app html body">
        <h2>Login</h2>
        <Form onSubmit={this.handleFormSubmit}>
          <Form.Group controlId="formBasicEmail">
            <Form.Control name="user" type="email" placeholder="Email" value={this.state.user} onChange={this.handleChange} />
            <Form.Text className="text-muted text-left">
              We'll never share your email with anyone else.
            </Form.Text>
          </Form.Group>

          <Form.Group controlId="formBasicPassword">
            <Form.Control name="pass" type="password" placeholder="Password" value={this.state.pass} onChange={this.handleChange} />
            <Form.Text className="text-muted text-left">
              Beware that password is in no way protected. 
            </Form.Text>
          </Form.Group>
          <Form.Group>
            <Button className="w-100" variant="info" type="submit">
              Login
            </Button>
          </Form.Group>
          <Form.Group controlId="formBasicCheckbox">
            <Form.Check name="rememberMe" type="checkbox" label="Remember Me" checked={this.state.rememberMe} onChange={this.handleChange} />
            <a className="text-info" href="#">Forgot password?</a> 
          </Form.Group>
        </Form>
      </div> 
    ); 
  }
}