public class BankAccountManagement {

    // =========================
    // CREATE ACCOUNT
    // =========================
    public static void createAccount(
        String accNo,
        String custName,
        Decimal balance,
        String accType
    ) {

        Bank_Account__c b = new Bank_Account__c();

        b.Name = accNo;
        b.Customer_Name__c = custName;
        b.Balance__c = balance;
        b.Account_Type__c = accType;

        insert b;

        System.debug('Account Created Successfully');
    }



    // =========================
    // DISPLAY ACCOUNTS
    // =========================
    public static void displayAccounts() {

        List<Bank_Account__c> accList = [

            SELECT Id,
                   Name,
                   Customer_Name__c,
                   Balance__c,
                   Account_Type__c

            FROM Bank_Account__c
        ];

        System.debug('===== ACCOUNT LIST =====');

        for(Bank_Account__c b : accList) {

            System.debug(
                'Account No: ' + b.Name +
                ' | Customer: ' + b.Customer_Name__c +
                ' | Balance: ' + b.Balance__c +
                ' | Type: ' + b.Account_Type__c
            );
        }
    }



    // =========================
    // DEPOSIT MONEY
    // =========================
    public static void depositAmount(
        String accNo,
        Decimal amount
    ) {

        Bank_Account__c b = [

            SELECT Id,
                   Balance__c

            FROM Bank_Account__c
            WHERE Name = :accNo
            LIMIT 1
        ];

        b.Balance__c = b.Balance__c + amount;

        update b;

        System.debug('Amount Deposited Successfully');
    }



    // =========================
    // WITHDRAW MONEY
    // =========================
    public static void withdrawAmount(
        String accNo,
        Decimal amount
    ) {

        Bank_Account__c b = [

            SELECT Id,
                   Balance__c

            FROM Bank_Account__c
            WHERE Name = :accNo
            LIMIT 1
        ];

        if(b.Balance__c >= amount) {

            b.Balance__c = b.Balance__c - amount;

            update b;

            System.debug('Withdrawal Successful');

        } else {

            System.debug('Insufficient Balance');
        }
    }



    // =========================
    // UPDATE ACCOUNT TYPE
    // =========================
    public static void updateAccountType(
        String accNo,
        String newType
    ) {

        Bank_Account__c b = [

            SELECT Id,
                   Account_Type__c

            FROM Bank_Account__c
            WHERE Name = :accNo
            LIMIT 1
        ];

        b.Account_Type__c = newType;

        update b;

        System.debug('Account Type Updated');
    }



    // =========================
    // DELETE ACCOUNT
    // =========================
    public static void deleteAccount(
        String accNo
    ) {

        Bank_Account__c b = [

            SELECT Id

            FROM Bank_Account__c
            WHERE Name = :accNo
            LIMIT 1
        ];

        delete b;

        System.debug('Account Deleted Successfully');
    }
}

// Implementation 

BankAccountManagement.createAccount(
    'ACC101',
    'Rahul Sharma',
    5000,
    'Savings'
);

BankAccountManagement.displayAccounts();

BankAccountManagement.depositAmount(
    'ACC101',
    2000
);

BankAccountManagement.withdrawAmount(
    'ACC101',
    1000
);

BankAccountManagement.updateAccountType(
    'ACC101',
    'Current'
);

BankAccountManagement.deleteAccount(
    'ACC101'
);