# YAML Serializer

## How to use
```
public class Person{

    public String name;
    public Date birthdate;
    public List<YamlTest.Address> addresses;
    public List<String> roles;
    public YamlTest.ContactDetail contactDetail;
}

public class Address{

    public String street;
    public Boolean primary;

    public Address(String street, Boolean primary){
        this.street = street;
        this.primary = primary;
    }
}

public class ContactDetail{
    
    public String email;
    public String phone;

    public ContactDetail(String email, String phone){
        this.email = email;
        this.phone = phone;
    }
}
```

```
Person person = new Person();
person.name = 'Sam Smith';
person.birthdate = Date.newInstance(1990, 2, 10);
person.roles = new List<String> { 'read', 'write' };
person.addresses = new List<Address>{ 
    new Address('123 Road', true),
    new Address('456 Street', false)
};
person.contactDetail = new ContactDetail('sam@test.com', '0221230987');
```

`    
String yamlString = YAML.serialize( person );
`

### Output
```
name: Sam Smith
birthdate: 1990-02-10
roles:
  - read
  - write
contactDetail:
  phone: 0221230987
  email: sam@test.com
addresses:
  -
    street: 123 Road
    primary: true
  -
    street: 456 Street
    primary: false
```