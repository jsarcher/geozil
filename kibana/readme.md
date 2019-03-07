
Create Index

´´´
PUT my_index
{
  "mappings": {
    "_doc": {
      "properties": {
        "node_type": { "type": "text" },
        "ip":        { "type": "text" },
        "epoch":     { "type": "integer" },
        "location":  { "type": "geo_point" },
        "log_time": { 
          "type": "date",
          "format": "strict_date_hour_minute_second"
        }
      }
    }
  }
}
´´´

