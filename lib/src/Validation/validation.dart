

  emailValidation(value){
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }
  passwordValidation(value){
    if (value.isEmpty) {
      return 'This field is required';
    }
    if (value.length <=6) {
      return null;
    }

  }

