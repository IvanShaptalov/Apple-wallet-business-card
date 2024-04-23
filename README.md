Steps to create .pkpass file:

1: ### Setting the Pass Type Identifier and Team ID

Every pass has a pass type identifier associated with a developer account. Pass type identifiers are managed in Member Center by a team admin. To build this pass, request and configure a pass type identifier. (You can’t use the pass type identifier that is already in the pass because it isn’t associated with your developer account.)

To register a pass type identifier, do the following:

1. In [Certificates, Identifiers & Profiles](http://developer.apple.com/account), select Identifiers.
2. Under Identifiers, select Pass Type IDs.
3. Click the plus (+) button.
4. Enter the description and pass type identifier, and click Submit.

To find your Team ID, do the following:

1. Open Keychain Access, and select your certificate.
2. Select File > Get Info, and find the Organizational Unit section under Details. This is your Team ID.
    
    The pass type identifier appears in the certificate under the User ID section.
    

NOTE
You can also find your Team ID by looking at your organization profile in [Member Center](https://developer.apple.com/membercenter/).

Edit the `pass.json` file, and change the pass type identifier to the identifier you just set up. Then change the Team ID to match the values you just found (see Listing 3-1).

**Listing 3-1**

Setting the pass type ID and Team ID

1. `{`
2.     `...`
3.     `"passTypeIdentifier" : "`
4. `your pass type identifier`
5. `",`
6.     `"teamIdentifier" : "`
7. `your Team ID`
8. `",`
9.     `...`
10. `}`

to sign your passes you must have 
in your keychains:
AppleWWDRC.cer


# <your-password> for -passin is the pass for the P12
$ openssl pkcs12 -in <cert-name>.p12 -clcerts -nokeys -out signerCert.pem -passin pass:<your-password>

# <your-password> for -passin is the pass for the P12. <secret-passphrase> is the pass you'll pass to passkit-generator to decrypt privateKey.
$ openssl pkcs12 -in <cert-name>.p12 -nocerts -out signerKey.pem -passin pass:<your-password> -passout pass:<secret-passphrase>



### Signing and Compressing the Pass

As part of building your production environment, you will need to set up a system for automatically signing and compressing passes as described in [Passes Are Cryptographically Signed and Compressed](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/PassKit_PG/Creating.html#//apple_ref/doc/uid/TP40012195-CH4-SW55). For this tutorial, a very simple tool for signing passes is included.

To download your pass signing certificate, do the following:

1. In [Certificates, Identifiers & Profiles](http://developer.apple.com/account), select Identifiers.
2. Under Identifiers, select Pass Type IDs.
3. Select the pass type identifier, then click Edit.
4. If there is a certificate listed under Production Certificates, click the Download button next to it.
    
    If there are no certificates listed, click the Create Certificate button, then follow the instructions to create a pass signing certificate.
    

To get the `signpass` tool, do the following:

1. Download this book’s companion file (from the [developer downloads area](https://developer.apple.com/services-account/download?path=/iOS/Wallet_Support_Materials/WalletCompanionFiles.zip)), and locate the `signpass`project.
2. Open the project in Xcode, and build it.
3. Right-click on the `signpass` executable (in the Products folder in Xcode) and select Show in Finder.
4. Move the `signpass` executable to the Documents folder.

To sign and compress the pass, use the `signpass` tool to sign the pass package. In Terminal, run the following commands:

1. `cd ~/Documents`
2. `./signpass -p Lollipop.pass`

