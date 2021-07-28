# Receipt Hacker

Receipt Hacker is a mobile app that removes the awkwardness of splitting a bill among multiple people. It allows users to scan and upload receipts to instantly split costs. Developed using Flutter, Receipt Hacker utilizes Google ML Kit's Text Recognition for Optical Character Recognition, parses through receipt information with RegEx, and cleanly displays price breakdowns. 

# Instructions

From the home screen, users can choose to upload an image from their device's gallery.
<div align="center">
<table>
  <tr>
     <td><img src="https://media.giphy.com/media/DWGsYuftB4NfQYDG4l/giphy.gif" alt="Gallery"/></td>
  </tr>
 </table>
  </div>

Users can also access the device camera to take a picture.
<div align="center">
<table>
  <tr>
     <td><img src="https://media.giphy.com/media/RVCBt51mofNPhDqXZj/giphy.gif" alt="Camera"/></td>
  </tr>
 </table>
  </div>

Pressing 'TEXTIFY' takes the user to a screen that displays the receipt item and price information. Users can increase or decrease the % tip and number of people who are sharing the bill. 

The 'HACK MY RECEIPT' button brings the user to the next screen, showing the cost breakdown and total amount owed per person.
<div align="center">
<table>
  <tr>
     <td><img src="https://media.giphy.com/media/68RJRqCEWHBPBmPwB1/giphy.gif" alt="Hacked Receipt"/></td>
  </tr>
 </table>
  </div>  

# Future Implementations
- Ability to split shared items
- Split tax and tip based on a person's % contribution to the total bill
- Additional receipt parsers to improve scope of OCR of a wider variety of receipts
- User logins, authorization
- Social media aspect to link users 
- Integration with third-party payment systems such as Venmo, Zelle, PayPal, etc.
