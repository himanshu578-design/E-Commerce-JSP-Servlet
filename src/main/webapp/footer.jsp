<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* Footer Styling */
.footer {
  background: linear-gradient(135deg, #0f172a, #020617);
  color: #e5e7eb;
  padding: 60px 20px 20px;
  font-family: 'Segoe UI', sans-serif;
}

.footer-container {
  max-width: 1200px;
  margin: auto;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 40px;
}

/* Footer Brand */
.footer-brand h2 {
  font-size: 28px;
  color: #38bdf8;
  margin-bottom: 15px;
}

.footer-brand p {
  font-size: 14px;
  line-height: 1.7;
  color: #cbd5f5;
}

/* Footer Titles */
.footer h3 {
  font-size: 18px;
  margin-bottom: 15px;
  color: #f8fafc;
}

/* Footer Links */
.footer ul {
  list-style: none;
  padding: 0;
}

.footer ul li {
  margin-bottom: 10px;
}

.footer ul li a {
  text-decoration: none;
  color: #cbd5f5;
  font-size: 14px;
  transition: color 0.3s, padding-left 0.3s;
}

.footer ul li a:hover {
  color: #38bdf8;
  padding-left: 6px;
}

/* Social Icons */
.social-icons a {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 38px;
  height: 38px;
  margin-right: 10px;
  border-radius: 50%;
  background: #020617;
  color: #38bdf8;
  transition: all 0.3s ease;
}

.social-icons a:hover {
  background: #38bdf8;
  color: #020617;
  transform: translateY(-4px);
}

/* Footer Bottom */
.footer-bottom {
  border-top: 1px solid #1e293b;
  margin-top: 40px;
  padding-top: 15px;
  text-align: center;
  font-size: 13px;
  color: #94a3b8;
}

/* Responsive */
@media (max-width: 600px) {
  .footer {
    text-align: center;
  }
  .social-icons a {
    margin-bottom: 10px;
  }
}
</style>

<footer class="footer">
  <div class="footer-container">

    <!-- Brand -->
    <div class="footer-brand">
      <h2>ShopNow</h2>
      <p>Your one-stop destination for premium products, fast delivery, and secure payments.</p>
    </div>

    <!-- Quick Links -->
    <div>
      <h3>Quick Links</h3>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Shop</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="#">Offers</a></li>
      </ul>
    </div>

    <!-- Customer Service -->
    <div>
      <h3>Customer Service</h3>
      <ul>
        <li><a href="#">My Account</a></li>
        <li><a href="#">Orders</a></li>
        <li><a href="#">Returns</a></li>
        <li><a href="#">Help Center</a></li>
      </ul>
    </div>

    <!-- Contact & Social -->
    <div>
      <h3>Connect With Us</h3>
      <p>Email: dhanarehimanshu178@gmail.com</p>
      <p>Phone: +91 9302013578</p>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-x-twitter"></i></a>
        <a href="#"><i class="fab fa-linkedin-in"></i></a>
      </div>
    </div>

  </div>

  <div class="footer-bottom">
    © 2025 ShopEase. All Rights Reserved.
  </div>
</footer>
