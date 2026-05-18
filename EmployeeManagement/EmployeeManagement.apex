public class EmployeeManagement {

    // INSERT Employee
    public static void insertEmployee(
        String empId,
        String name,
        String email,
        Date birthDate,
        String dept
    ) {

        Employee__c e = new Employee__c();

        e.Name = empId;
        e.Emp_Name__c = name;
        e.Email__c = email;
        e.Birth_Date__c = birthDate;
        e.Department__c = dept;

        insert e;

        System.debug('Employee Inserted Successfully');
    }


    // DISPLAY Employees
    public static void displayEmployees() {

        List<Employee__c> empList = [

            SELECT Id,
                   Name,
                   Emp_Name__c,
                   Email__c,
                   Birth_Date__c,
                   Department__c

            FROM Employee__c
        ];

        if(empList.isEmpty()) {

            System.debug('No Employees Found');
            return;
        }

        for(Employee__c e : empList) {

            System.debug(
                'Emp ID: ' + e.Name +
                ' | Name: ' + e.Emp_Name__c +
                ' | Email: ' + e.Email__c +
                ' | Birth Date: ' + e.Birth_Date__c +
                ' | Department: ' + e.Department__c
            );
        }
    }


    // UPDATE Employee
    public static void updateEmployee(
        String empId,
        String newDept
    ) {

        List<Employee__c> empList = [

            SELECT Id,
                   Department__c

            FROM Employee__c
            WHERE Name = :empId
            LIMIT 1
        ];

        if(empList.isEmpty()) {

            System.debug('Employee Not Found');
            return;
        }

        Employee__c e = empList[0];

        e.Department__c = newDept;

        update e;

        System.debug('Employee Updated Successfully');
    }


    // DELETE Employee
    public static void deleteEmployee(
        String empId
    ) {

        List<Employee__c> empList = [

            SELECT Id

            FROM Employee__c
            WHERE Name = :empId
            LIMIT 1
        ];

        if(empList.isEmpty()) {

            System.debug('Employee Not Found');
            return;
        }

        delete empList[0];

        System.debug('Employee Deleted Successfully');
    }
}


// Implementation

EmployeeManagement.insertEmployee(
    'E101',
    'Rahul Sharma',
    'rahul@gmail.com',
    Date.newInstance(1999, 5, 20),
    'IT'
);

EmployeeManagement.displayEmployees();

EmployeeManagement.updateEmployee(
    'E101',
    'HR'
);


EmployeeManagement.deleteEmployee(
    'E101'
);

