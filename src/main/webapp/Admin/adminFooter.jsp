<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
    /* Full height layout */
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: 'Poppins', sans-serif;
    }

    /* Wrapper for content + footer */
    .page-wrapper {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* Main content grows to push footer down */
    .main-content {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #667eea, #764ba2);
        padding: 20px;
    }

    /* Welcome Card */
    .welcome-card{
        background: #fff;
        padding: 50px;
        width: 420px;
        border-radius: 18px;
        text-align: center;
        box-shadow: 0 15px 40px rgba(0,0,0,0.25);
        animation: fadeIn 0.8s ease;
    }

    .welcome-card h1{
        font-size: 32px;
        margin-bottom: 10px;
        color: #333;
    }

    .welcome-card h1 span{
        color: #4f46e5;
    }

    .welcome-card p{
        font-size: 16px;
        color: #666;
    }

    @keyframes fadeIn{
        from{opacity:0; transform: translateY(20px);}
        to{opacity:1; transform: translateY(0);}
    }

    /* Sticky Footer */
    .admin-footer {
        width: 100%;
        background: linear-gradient(135deg, #4f46e5, #9333ea);
        color: #fff;
        padding: 20px 25px;
        text-align: center;
        box-shadow: 0 -4px 12px rgba(0,0,0,0.15);
    }

    .admin-footer a{
        color: #fff;
        text-decoration: none;
        margin: 0 10px;
        transition: 0.3s;
    }

    .admin-footer a:hover{
        text-decoration: underline;
    }

    /* Responsive Footer */
    @media (max-width: 768px){
        .admin-footer a{
            display: block;
            margin: 5px 0;
        }
    }
</style>



    <!-- Footer Include -->
    <footer class="admin-footer">
        © 2025 Admin Panel | 
        <a href="#">Privacy</a>
        <a href="#">Terms</a>
        <a href="#">Support</a>
    </footer>
</div>
