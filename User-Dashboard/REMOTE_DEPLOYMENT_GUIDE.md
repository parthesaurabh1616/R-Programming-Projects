# Remote Deployment Data Persistence Guide

## Data Storage Details

### File Format: CSV
- Format: Comma-Separated Values (CSV)
- Not JSON: Data is stored in CSV format for better compatibility
- Human-readable: Can be opened in Excel, Google Sheets, text editors

### Storage Location
```
Project Root/
├── user_data.csv          # Main data file
└── backups/               # Backup directory
    ├── user_data_backup_YYYYMMDD_HHMMSS.csv
    └── ...
```

## Remote Deployment Considerations

### 1. File System Permissions
- Ensure the application has write permissions to the project directory
- The app needs to create/modify files in the same directory as app.R

### 2. Server Environment
- Local file storage: Data is saved to the server's local file system
- Not database: This is file-based storage, not a database system
- Persistent: Data persists between app restarts (as long as files aren't deleted)

### 3. Testing on Different Devices
When testing on GitHub or remote devices:

#### What Works:
- Data will be saved to user_data.csv in the project directory
- Backups will be created in backups/ folder
- Data persists between app restarts
- All CRUD operations work normally

#### Potential Issues:
- File permissions: Server must allow file creation/modification
- Directory structure: Ensure backups/ directory can be created
- Disk space: Sufficient space for data files and backups

### 4. Data File Structure
The user_data.csv file contains these columns:
```csv
name,id,profession,email,phone,birth_date,gender,address,company,position,experience,skills,education,linkedin,bio,registration_date
John Smith,USR001,Software Developer,john@example.com,123-456-7890,1990-01-01,Male,123 Main St,Tech Corp,Senior Developer,5,"R, Python, SQL",Bachelor's,https://linkedin.com/in/john,Experienced developer,2024-12-01
```

## Troubleshooting Remote Deployment

### If Data Isn't Saving:

1. **Check File Permissions**
   ```r
   # Test if you can write to the directory
   test_file <- "test_write.csv"
   write.csv(data.frame(test = "data"), test_file)
   if (file.exists(test_file)) {
     file.remove(test_file)
     print("Write permissions OK")
   } else {
     print("Write permissions issue")
   }
   ```

2. **Check Directory Structure**
   ```r
   # Ensure we're in the right directory
   getwd()
   list.files()
   ```

3. **Manual Test**
   ```r
   # Test the save function directly
   source("user_data.R")
   test_data <- generate_sample_data(1)
   result <- save_user_data(test_data)
   print(paste("Save result:", result))
   print(paste("File exists:", file.exists("user_data.csv")))
   ```

### Alternative: Database Storage
If file-based storage doesn't work in your environment, you can modify the code to use:

1. **SQLite Database** (recommended for Shiny apps)
2. **PostgreSQL/MySQL** (for production environments)
3. **MongoDB** (for document-based storage)

## Benefits of Current Implementation

### Advantages:
- Simple: No database setup required
- Portable: CSV files can be moved between systems
- Backup-friendly: Easy to backup entire directory
- Version control: Can track changes with Git
- Human-readable: Data can be viewed/edited directly

### Data Management Features:
- Auto-save: Saves automatically when adding users
- Backup creation: Creates timestamped backups
- Data export: Export current data to CSV
- Status monitoring: Shows data file status
- Restore capability: Restore from any backup

## Testing Checklist for Remote Deployment

- App starts successfully
- Can add a new user
- Success notification shows "User added and saved successfully!"
- user_data.csv file is created in project directory
- Data persists after app restart
- Backup files are created in backups/ folder
- Data Management tab shows correct status
- Export functionality works

## Next Steps

1. Deploy to your remote device
2. Test adding a user
3. Check if user_data.csv is created
4. Verify data persists after restart
5. Test backup functionality

If you encounter any issues with file permissions or data not saving, let me know and I can help troubleshoot or implement an alternative storage solution.
