##Sparsh SMTP Extension
SMTP extension is a free e-mail marketing solution that supports all main SMTP-providers to solve issues like spamming, HTML/Plain-text in emails and many others.

##Support: 
version - 2.3.x, 2.4.x

##How to install Extension

1. Download the archive file.
2. Unzip the files
3. Create a folder [Magento_Root]/app/code/Sparsh/Smtp
4. Drop/move the unzipped files to directory '[Magento_Root]/app/code/Sparsh/Smtp'

#Enable Extension:
- php bin/magento module:enable Sparsh_Smtp
- php bin/magento setup:upgrade
- php bin/magento setup:di:compile
- php bin/magento setup:static-content:deploy
- php bin/magento cache:flush

#Disable Extension:
- php bin/magento module:disable Sparsh_Smtp
- php bin/magento setup:upgrade
- php bin/magento setup:di:compile
- php bin/magento setup:static-content:deploy
- php bin/magento cache:flush
