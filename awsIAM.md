[back](./readme.md)

# Setting up AWS IAM

To get an `AWS_ACCESS_KEY_ID`, you need to create an AWS Identity and Access Management (IAM) user and generate access keys for that user. Here are the general steps to obtain an `AWS_ACCESS_KEY_ID`:

## 1. Sign in to the AWS Management Console:

 * Go to the AWS Management Console.
 * Sign in with your AWS account credentials.


## 2. Open the IAM Console:

 * In the AWS Management Console, navigate to the "Services" menu and select "IAM" under the "Security, Identity, & Compliance" section.

## 3. Create a New IAM User:

 * In the IAM dashboard, click on "Users" in the left navigation pane.
 * Click the "Add user" button.
 * Enter a username for the new user.
 * Choose the type of access: "Programmatic access" (to get access keys) and/or "AWS Management Console access" (for console access).
 * Set permissions for the user (attach policies).
 * Click through the rest of the steps, and create the user.


## 4. Note the Access Key ID:

 * After creating the user, you will see a confirmation screen. On this screen, take note of the Access key ID provided. This is your `AWS_ACCESS_KEY_ID`.


## 5. Generate and Download the Secret Access Key:

 * On the confirmation screen, you can download the .csv file that contains the Secret access key. Keep this file secure. If you don't download it, you will need to create a new access key if you lose the secret.

--- 

Now, you have both the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. These credentials should be treated with care, and it's crucial to keep them secure. Never share your credentials publicly or hardcode them directly into your applications. Instead, use mechanisms like environment variables or AWS credential files to manage these credentials.

Additionally, consider granting the minimum required permissions to the IAM user by attaching policies that provide access to specific AWS services and resources. This follows the principle of least privilege, enhancing security by limiting unnecessary access.