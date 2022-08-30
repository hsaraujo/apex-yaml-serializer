@IsTest
private class YamlTest {

    @IsTest
    static void givenAnObjectThenSerializeTest(){

        YamlTest.Person person = new YamlTest.Person();
        person.name = 'Sam Smith';
        person.birthdate = Date.newInstance(1990, 2, 10);
        person.roles = new List<String> { 'read', 'write' };
        person.addresses = new List<YamlTest.Address>{ 
            new YamlTest.Address('123 Road', true),
            new YamlTest.Address('456 Street', false)
        };
        person.contactDetail = new YamlTest.ContactDetail('sam@test.com', '0221230987');

        Test.startTest();

        String str = YAML.serialize(person);

        Test.stopTest();

        System.assert(str.contains('roles:\n'));
        System.assert(str.contains('- read\n'));
        System.assert(str.contains('- write\n'));

        System.assert(str.contains('name: Sam Smith\n'));
        System.assert(str.contains('birthdate: 1990-02-10\n'));

        System.assert(str.contains('contactDetail:\n'));
        System.assert(str.contains('email: sam@test.com'));
        System.assert(str.contains('phone: 0221230987'));

        System.assert(str.contains('addresses:\n'));
        System.assert(str.contains('-\n'));
        System.assert(str.contains('street: 123 Road\n'));
        System.assert(str.contains('primary: true\n'));
        System.assert(str.contains('street: 456 Street\n'));
        System.assert(str.contains('primary: false\n'));
    }

    @IsTest
    static void givenAListThenSerializeTest(){

        YamlTest.Person person = new YamlTest.Person();
        person.name = 'Sam Smith';
        person.birthdate = Date.newInstance(1990, 2, 10);
        person.roles = new List<String> { 'read', 'write' };
        person.addresses = new List<YamlTest.Address>{ 
            new YamlTest.Address('123 Road', true),
            new YamlTest.Address('456 Street', false)
        };
        person.contactDetail = new YamlTest.ContactDetail('sam@test.com', '0221230987');

        YamlTest.Person person2 = new YamlTest.Person();
        person2.name = 'Charles Lord';
        person2.birthdate = Date.newInstance(1993, 11, 7);
        person2.roles = new List<String> { 'edit', 'delete' };
        person2.addresses = new List<YamlTest.Address>{ 
            new YamlTest.Address('123 Avenue', true),
            new YamlTest.Address('456 Street', false)
        };
        person2.contactDetail = new YamlTest.ContactDetail('charles@test.com', '0221230456');

        List<YamlTest.Person> persons = new List<YamlTest.Person>{
            person, person2
        };

        Test.startTest();

        String str = YAML.serialize(persons);

        Test.stopTest();

        System.assert(str.startsWith('-\n'));
        System.assert(str.contains('roles:\n'));
        System.assert(str.contains('- read\n'));
        System.assert(str.contains('- write\n'));

        System.assert(str.contains('name: Sam Smith\n'));
        System.assert(str.contains('birthdate: 1990-02-10\n'));

        System.assert(str.contains('contactDetail:\n'));
        System.assert(str.contains('email: sam@test.com'));
        System.assert(str.contains('phone: 0221230987'));

        System.assert(str.contains('addresses:\n'));
        System.assert(str.contains('-\n'));
        System.assert(str.contains('street: 123 Road\n'));
        System.assert(str.contains('primary: true\n'));
        System.assert(str.contains('street: 456 Street\n'));
        System.assert(str.contains('primary: false\n'));

        
        System.assert(str.contains('roles:\n'));
        System.assert(str.contains('- edit\n'));
        System.assert(str.contains('- delete\n'));

        System.assert(str.contains('name: Charles Lord\n'));
        System.assert(str.contains('birthdate: 1993-11-07\n'));

        System.assert(str.contains('contactDetail:\n'));
        System.assert(str.contains('email: charles@test.com'));
        System.assert(str.contains('phone: 0221230456'));

        System.assert(str.contains('addresses:\n'));
        System.assert(str.contains('-\n'));
        System.assert(str.contains('street: 123 Avenue\n'));
        System.assert(str.contains('primary: true\n'));
        System.assert(str.contains('street: 456 Street\n'));
        System.assert(str.contains('primary: false\n'));
    }

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

}
