// ignore_for_file: prefer_single_quotes
String mock_country_json = """
  {
  "meals": [
    {
      "strArea": "American"
    },
    {
      "strArea": "British"
    },
    {
      "strArea": "Canadian"
    },
    {
      "strArea": "Chinese"
    },
    {
      "strArea": "Croatian"
    },
    {
      "strArea": "Dutch"
    },
    {
      "strArea": "Egyptian"
    },
    {
      "strArea": "French"
    },
    {
      "strArea": "Greek"
    },
    {
      "strArea": "Indian"
    },
    {
      "strArea": "Irish"
    },
    {
      "strArea": "Italian"
    },
    {
      "strArea": "Jamaican"
    },
    {
      "strArea": "Japanese"
    },
    {
      "strArea": "Kenyan"
    },
    {
      "strArea": "Malaysian"
    },
    {
      "strArea": "Mexican"
    },
    {
      "strArea": "Moroccan"
    },
    {
      "strArea": "Polish"
    },
    {
      "strArea": "Portuguese"
    },
    {
      "strArea": "Russian"
    },
    {
      "strArea": "Spanish"
    },
    {
      "strArea": "Thai"
    },
    {
      "strArea": "Tunisian"
    },
    {
      "strArea": "Turkish"
    },
    {
      "strArea": "Unknown"
    },
    {
      "strArea": "Vietnamese"
    }
  ]
}
  """;

String mock_auth_json = """
  {
    "success": true,
    "message": "Invalid mobileNo/pass",
    "data": {
        "userID": "Bashcious",
        "name": "Bash",
        "mobileNo": "81231231231",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjc5MSwibmFtZSI6IkF1dG8gRGVhbGVyc2hpcCBSUE0iLCJzdGF0dXMiOiJhY3RpdmUiLCJ0eXBlIjoiZGVhbGVyIiwiaWF0IjoxNTg5NTI5NzQ2LCJleHAiOjE2MjEwODczNDZ9.10INK1oyiWc2KiIfVKsPxPYwvjuswoX9lwG3s3JChb0",
        "email": "bash@gmail.com"
    }
  }
  """;

  String mock_notification_json = """
  {
    "success": true,
    "message": "Notification List success",
    "data": [
      {"type": "stock_transfer", "title": "Stock transfer approved", "content": "Stock transfer STKTRAN-100005 had been approved by Galang", "date": "12/3/2022", "time": "12.00pm"},
      {"type": "stock_wastage", "title": "Stock wastage approved", "content": "Stock wastage STKWAS-100005 had been approved by Jeff", "date": "11/3/2022", "time": "10.00am"},
      {"type": "stock_wastage", "title": "Stock wastage approved", "content": "Stock wastage STKWAS-100004 had been approved by Jeff", "date": "10/3/2022", "time": "16.00pm"},
      {"type": "stock_transfer", "title": "Stock transfer approved", "content": "Stock transfer STKTRAN-100004 had been approved by Anom", "date": "10/3/2022", "time": "15.00pm"},
      {"type": "stock_transfer", "title": "Stock transfer approved", "content": "Stock transfer STKTRAN-100003 had been approved by Galang", "date": "09/3/2022", "time": "11.00am"},
      {"type": "stock_transfer", "title": "Stock transfer approved", "content": "Stock transfer STKTRAN-100002 had been approved by Anom", "date": "06/3/2022", "time": "16.00pm"},
      {"type": "stock_wastage", "title": "Stock wastage approved", "content": "Stock wastage STKWAS-100003 had been approved by Jeff", "date": "06/3/2022", "time": "12.00pm"},
      {"type": "stock_wastage", "title": "Stock wastage approved", "content": "Stock wastage STKWAS-100002 had been approved by Jeff", "date": "05/3/2022", "time": "13.00pm"},
      {"type": "stock_wastage", "title": "Stock wastage approved", "content": "Stock wastage STKWAS-100001 had been approved by Jeff", "date": "04/3/2022", "time": "14.00pm"},
      {"type": "stock_transfer", "title": "Stock transfer approved", "content": "Stock transfer STKTRAN-100001 had been approved by Galang", "date": "03/3/2022", "time": "12.00pm"}
    ]
  }
  """;
