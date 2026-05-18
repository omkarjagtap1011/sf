public class EmailController {

    // Variables for form fields
    public String recipient {get; set;}
    public String subject {get; set;}
    public String body {get; set;}

    // Method to send email
    public void sendEmail() {

        // Validate Email Address
        if(recipient == null || !recipient.contains('@')) {

            ApexPages.addMessage(
                new ApexPages.Message(
                    ApexPages.Severity.ERROR,
                    'Invalid Email Address'
                )
            );

            return;
        }

        try {

            // Create Email Message
            Messaging.SingleEmailMessage mail =
                new Messaging.SingleEmailMessage();

            // Recipient
            mail.setToAddresses(
                new String[] { recipient }
            );

            // Subject
            mail.setSubject(subject);

            // Email Body
            mail.setPlainTextBody(body);

            // OPTIONAL ATTACHMENT
            Messaging.EmailFileAttachment attach =
                new Messaging.EmailFileAttachment();

            attach.setFileName('sample.txt');

            attach.setBody(
                Blob.valueOf('This is sample attachment')
            );

            attach.setContentType('text/plain');

            // Attach File
            mail.setFileAttachments(
                new Messaging.EmailFileAttachment[] { attach }
            );

            // Send Email
            Messaging.sendEmail(
                new Messaging.SingleEmailMessage[] { mail }
            );

            // Success Message
            ApexPages.addMessage(
                new ApexPages.Message(
                    ApexPages.Severity.CONFIRM,
                    'Email Sent Successfully'
                )
            );

        }
        catch(Exception e) {

            ApexPages.addMessage(
                new ApexPages.Message(
                    ApexPages.Severity.ERROR,
                    e.getMessage()
                )
            );
        }
    }
}