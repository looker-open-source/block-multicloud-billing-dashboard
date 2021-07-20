view: cloud {
  derived_table: {
    sql: SELECT 'Azure' as cloud
      UNION ALL
      SELECT 'AWS' as cloud
      UNION ALL
      SELECT 'GCP' as cloud
       ;;
  }


  dimension: cloud {
    type: string
    sql: ${TABLE}.cloud ;;
  }

  parameter: tag_label_search {
    type: string
  }

  parameter: cost_center {
    type: string
    allowed_value: {
      label: "All"
      value: "All"
    }
    allowed_value: {
      label: "Operations"
      value: "Operations"
    }
    allowed_value: {
      label: "Customer Hosting"
      value: "Customer_Hosting"
    }
    allowed_value: {
      label: "Security"
      value: "Security"
    }
    allowed_value: {
      label: "Product Development"
      value: "Product_Development"
    }
    allowed_value: {
      label: "Human Resources"
      value: "Human_Resources"
    }
    allowed_value: {
      label: "Marketing & Sales"
      value: "Marketing_Sales"
    }
    allowed_value: {
      label: "DevOps"
      value: "DevOps"
    }
  }

  parameter: service_category {
    type: string
    allowed_value: {
      label: "All"
      value: "All"
    }
    allowed_value: {
      label: "Storage"
      value: "Storage"
    }
    allowed_value: {
      label: "Serverless"
      value: "Serverless"
    }
    allowed_value: {
      label: "Security & Identity"
      value: "Sercurity_Identity"
    }
    allowed_value: {
      label: "Operations"
      value: "Operations"
    }
    allowed_value: {
      label: "Networking"
      value: "Networking"
    }
    allowed_value: {
      label: "Migration"
      value: "Migration"
    }
    allowed_value: {
      label: "Management Tools"
      value: "Management_Tools"
    }
    allowed_value: {
      label: "Machine Learning (ML)"
      value: "Machine_Learning"
    }
    allowed_value: {
      label: "Internet of Things (IoT)"
      value: "Internet_Of_Things"
    }
    allowed_value: {
      label: "Developer Tools"
      value: "Deverloper Tools"
    }
    allowed_value: {
      label: "Database"
      value: "Database"
    }
    allowed_value: {
      label: "Data Analytics"
      value: "Data_Analytics"
    }
    allowed_value: {
      label: "Containers"
      value: "Containers"
    }
    allowed_value: {
      label: "Compute"
      value: "Compute"
    }
    allowed_value: {
      label: "App Modernization"
      value: "App Modernization"
    }
  }


}
