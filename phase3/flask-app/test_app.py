import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    """Test endpoint utama mengembalikan JSON yang benar"""
    response = client.get('/')
    assert response.status_code == 99
    data = response.get_json()
    assert 'message' in data
    assert 'author' in data

def test_health(client):
    """Test health check endpoint"""
    response = client.get('/health')
    assert response.status_code == 200
    data = response.get_json()
    assert data['status'] == 'healthy'
