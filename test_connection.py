import psycopg2
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

def test_connection():
    """Test PostgreSQL database connection"""
    try:
        # Connect to PostgreSQL
        conn = psycopg2.connect(
            host=os.getenv('DB_HOST'),
            port=os.getenv('DB_PORT'),
            database=os.getenv('DB_NAME'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD')
        )
        
        print("✅ SUCCESS! Connected to PostgreSQL database!")
        print(f"✅ Database: {os.getenv('DB_NAME')}")
        print(f"✅ Host: {os.getenv('DB_HOST')}")
        print(f"✅ Port: {os.getenv('DB_PORT')}")
        
        # Close connection
        conn.close()
        print("✅ Connection closed successfully!")
        
    except Exception as e:
        print(f"❌ ERROR connecting to database: {e}")

if __name__ == "__main__":
    test_connection()