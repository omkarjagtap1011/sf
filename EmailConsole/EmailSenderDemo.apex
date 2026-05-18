public class EmailSenderDemo {

    // Method WITHOUT attachment
    public static void sendEmailWithoutAttachment(String emailId) {

        // Create email object
        Messaging.SingleEmailMessage mail =
            new Messaging.SingleEmailMessage();

        // Recipient email address
        mail.setToAddresses(
            new String[] { emailId }
        );

        // Email subject
        mail.setSubject('Test Email From Salesforce');

        // Email body
        mail.setPlainTextBody(
            'Hello, this is a test email sent from Apex.'
        );

        // Send email
        Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail }
        );

        System.debug('Email sent without attachment.');
    }



    // Method WITH attachment
    public static void sendEmailWithAttachment(String emailId) {

        // Create email object
        Messaging.SingleEmailMessage mail =
            new Messaging.SingleEmailMessage();

        // Recipient email address
        mail.setToAddresses(
            new String[] { emailId }
        );

        // Subject
        mail.setSubject('Email With Attachment');

        // Body
        mail.setPlainTextBody(
            'Hello, this email contains an attachment.'
        );



        // Create attachment object
        Messaging.EmailFileAttachment attachment =
            new Messaging.EmailFileAttachment();

        // File name
        attachment.setFileName('sample.txt');

        // File content
        attachment.setBody(
            Blob.valueOf(
                'This is the attachment content.'
            )
        );

        // File type
        attachment.setContentType('text/plain');



        // Attach file to email
        mail.setFileAttachments(
            new Messaging.EmailFileAttachment[] {
                attachment
            }
        );



        // Send email
        Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail }
        );

        System.debug('Email sent with attachment.');
    }
}

// Implementation

EmailSenderDemo.sendEmailWithoutAttachment('omkarjagtap1011@gmail.com');

EmailSenderDemo.sendEmailWithAttachment('omkarjagtap1011@gmail.com');