var password = document.getElementById("pwd_text")
  , confirm_password = document.getElementById("confirm_pwd_text");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
    document.getElementById('message').innerHTML = 'not matching';
    message.style.backgroundColor = "red";
  } else {
    confirm_password.setCustomValidity('');
    document.getElementById('message').innerHTML = 'matched';
    message.style.backgroundColor = "#4caf50";
  }
}
password.oninput = validatePassword;
confirm_password.oninput = validatePassword;