# Custom Styles
custom_styles <- function() {
  return("
    /* Global Styles */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
    }
    
    .main-header .navbar {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
      border-bottom: none !important;
    }
    
    .main-header .navbar-brand {
      font-weight: bold;
      font-size: 20px;
    }
    
    .sidebar {
      background: linear-gradient(180deg, #2c3e50 0%, #34495e 100%) !important;
      box-shadow: 2px 0 10px rgba(0,0,0,0.1);
    }
    
    .sidebar-menu li a {
      color: #ecf0f1 !important;
      border-radius: 5px;
      margin: 2px 10px;
      transition: all 0.3s ease;
    }
    
    .sidebar-menu li a:hover {
      background: linear-gradient(135deg, #3498db 0%, #2980b9 100%) !important;
      color: white !important;
      transform: translateX(5px);
    }
    
    .sidebar-menu li.active a {
      background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%) !important;
      color: white !important;
    }
    
    /* Content Area */
    .content-wrapper {
      background-color: #f8f9fa;
    }
    
    /* Form Container */
    .form-container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      margin-bottom: 20px;
      border: 1px solid #e9ecef;
    }
    
    .form-container h3 {
      color: #2c3e50;
      margin-bottom: 25px;
      padding-bottom: 10px;
      border-bottom: 3px solid #3498db;
    }
    
    /* Input Styling */
    .form-control {
      border-radius: 8px;
      border: 2px solid #e9ecef;
      padding: 12px 15px;
      font-size: 14px;
      transition: all 0.3s ease;
    }
    
    .form-control:focus {
      border-color: #3498db;
      box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
    }
    
    /* Button Styling */
    .btn-primary {
      background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
      border: none;
      border-radius: 8px;
      padding: 12px 25px;
      font-weight: bold;
      transition: all 0.3s ease;
    }
    
    .btn-primary:hover {
      background: linear-gradient(135deg, #2980b9 0%, #1f4e79 100%);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
    }
    
    .btn-lg {
      padding: 15px 30px;
      font-size: 16px;
    }
    
    /* User Cards */
    .card-grid {
      margin: 0 -10px;
    }
    
    .user-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      margin: 15px 10px;
      overflow: hidden;
      transition: all 0.3s ease;
      border: 1px solid #e9ecef;
    }
    
    .user-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }
    
    .card-header {
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      color: white;
    }
    
    .user-avatar {
      width: 50px;
      height: 50px;
      background: rgba(255,255,255,0.2);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
    }
    
    .card-actions {
      display: flex;
      gap: 10px;
    }
    
    .btn-card-action {
      background: rgba(255,255,255,0.2);
      border: 1px solid rgba(255,255,255,0.3);
      color: white;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }
    
    .btn-card-action:hover {
      background: rgba(255,255,255,0.3);
      transform: scale(1.1);
    }
    
    .card-body {
      padding: 20px;
      background: white;
    }
    
    .user-name {
      color: #2c3e50;
      margin: 0 0 10px 0;
      font-size: 20px;
      font-weight: bold;
    }
    
    .user-id {
      color: #7f8c8d;
      margin: 5px 0;
      font-size: 14px;
    }
    
    .user-profession {
      color: #34495e;
      margin: 5px 0;
      font-weight: 600;
      font-size: 16px;
    }
    
    .user-company {
      color: #95a5a6;
      margin: 5px 0;
      font-size: 14px;
      font-style: italic;
    }
    
    .card-footer {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #ecf0f1;
    }
    
    .user-stats {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
    }
    
    .stat-badge {
      background: #ecf0f1;
      color: #2c3e50;
      padding: 5px 10px;
      border-radius: 15px;
      font-size: 12px;
      font-weight: 600;
    }
    
    /* Modal Styling */
    .modal-content {
      border-radius: 15px;
      border: none;
      box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    }
    
    .modal-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-radius: 15px 15px 0 0;
      border: none;
    }
    
    .modal-title {
      color: white;
    }
    
    .modal-section {
      margin-bottom: 25px;
      padding: 20px;
      background: #f8f9fa;
      border-radius: 10px;
      border-left: 4px solid #3498db;
    }
    
    .info-item {
      margin: 10px 0;
      display: flex;
      align-items: center;
      font-size: 14px;
    }
    
    .info-item strong {
      color: #2c3e50;
      margin-right: 10px;
      min-width: 100px;
    }
    
    .skills-container {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-top: 10px;
    }
    
    .skill-tag {
      background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
      color: white;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 600;
    }
    
    .modal-footer {
      background: #f8f9fa;
      border-top: 1px solid #e9ecef;
      border-radius: 0 0 15px 15px;
      padding: 15px 20px;
    }
    
    /* Table Styling */
    .table-container {
      background: white;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    .dataTables_wrapper {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .dataTables_wrapper .dataTables_length,
    .dataTables_wrapper .dataTables_filter,
    .dataTables_wrapper .dataTables_info,
    .dataTables_wrapper .dataTables_processing,
    .dataTables_wrapper .dataTables_paginate {
      color: #2c3e50;
    }
    
    .dataTables_wrapper .dataTables_paginate .paginate_button {
      background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
      color: white !important;
      border: none;
      border-radius: 5px;
      margin: 0 2px;
      padding: 8px 12px;
    }
    
    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
      background: linear-gradient(135deg, #2980b9 0%, #1f4e79 100%);
    }
    
    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
      background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
    }
    
    /* Chart Container */
    .chart-container {
      background: white;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      margin-bottom: 20px;
    }
    
    .chart-container h3 {
      color: #2c3e50;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 3px solid #3498db;
    }
    
    /* Stats Cards */
    .stats-card {
      background: white;
      border-radius: 15px;
      padding: 25px;
      margin: 10px 0;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      display: flex;
      align-items: center;
      justify-content: space-between;
      transition: all 0.3s ease;
    }
    
    .stats-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }
    
    .stats-content h3 {
      margin: 0;
      font-size: 2.5em;
      font-weight: bold;
    }
    
    .stats-content p {
      margin: 5px 0 0 0;
      font-size: 14px;
      opacity: 0.9;
    }
    
    /* Empty State */
    .empty-state {
      text-align: center;
      padding: 60px 20px;
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    .empty-state-content h3 {
      color: #7f8c8d;
      margin-bottom: 10px;
    }
    
    .empty-state-content p {
      color: #95a5a6;
      margin-bottom: 20px;
    }
    
    /* Responsive Design */
    @media (max-width: 768px) {
      .user-card {
        margin: 10px 5px;
      }
      
      .form-container {
        padding: 20px;
        margin: 10px 0;
      }
      
      .stats-card {
        margin: 5px 0;
        padding: 20px;
      }
      
      .stats-content h3 {
        font-size: 2em;
      }
    }
    
    /* Animation Classes */
    .fade-in {
      animation: fadeIn 0.5s ease-in;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .slide-in {
      animation: slideIn 0.3s ease-out;
    }
    
    @keyframes slideIn {
      from { transform: translateX(-100%); }
      to { transform: translateX(0); }
    }
    
    /* Custom Scrollbar */
    ::-webkit-scrollbar {
      width: 8px;
    }
    
    ::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 10px;
    }
    
    ::-webkit-scrollbar-thumb {
      background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
      border-radius: 10px;
    }
    
    ::-webkit-scrollbar-thumb:hover {
      background: linear-gradient(135deg, #2980b9 0%, #1f4e79 100%);
    }
    
    /* Loading Animation */
    .loading {
      display: inline-block;
      width: 20px;
      height: 20px;
      border: 3px solid rgba(255,255,255,.3);
      border-radius: 50%;
      border-top-color: #fff;
      animation: spin 1s ease-in-out infinite;
    }
    
    @keyframes spin {
      to { transform: rotate(360deg); }
    }
    
    /* Success/Error Messages */
    .alert-success {
      background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
      color: white;
      border: none;
      border-radius: 8px;
      padding: 15px 20px;
      margin: 10px 0;
    }
    
    .alert-error {
      background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
      color: white;
      border: none;
      border-radius: 8px;
      padding: 15px 20px;
      margin: 10px 0;
    }
  ")
}

# Theme colors
get_theme_colors <- function() {
  return(list(
    primary = "#3498db",
    secondary = "#2c3e50",
    success = "#2ecc71",
    danger = "#e74c3c",
    warning = "#f39c12",
    info = "#1abc9c",
    light = "#ecf0f1",
    dark = "#34495e"
  ))
}

# Generate gradient backgrounds
get_gradient_backgrounds <- function() {
  return(list(
    primary = "linear-gradient(135deg, #667eea 0%, #764ba2 100%)",
    success = "linear-gradient(135deg, #2ecc71 0%, #27ae60 100%)",
    danger = "linear-gradient(135deg, #e74c3c 0%, #c0392b 100%)",
    warning = "linear-gradient(135deg, #f39c12 0%, #e67e22 100%)",
    info = "linear-gradient(135deg, #1abc9c 0%, #16a085 100%)",
    dark = "linear-gradient(135deg, #2c3e50 0%, #34495e 100%)"
  ))
}
