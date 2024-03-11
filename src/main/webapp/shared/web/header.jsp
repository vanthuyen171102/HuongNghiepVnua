<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header id="header">
    <div class="topbar">
      <div class="container">
        <div class="topbar-inner">
          <div class="topbar-left">
            <div class="header-logo">
              <a href="/trang-chu">
                <img
                        alt=""
                        src="<c:url value='/assets/web/images/Logo-Hoc-Vien-Nong-Nghiep-Viet-Nam-VNUA.png'/>"
                        class="logo-img"
                />
              </a>
              <div class="logo-text">
                <a href="/trang-chu">HỌC VIỆN NÔNG NGHIỆP VIỆT NAM</a>
                <a href="/trang-chu" class="en-text"
                >vietnam national university of agriculture</a
                >
              </div>
            </div>

          </div>
          <div class="topbar-right">
            <ul class="topbar-languages">
              <li>
                <img
                        src="<c:url value='/assets/web/images/vn.png'/>"
                        alt=""
                        class="language-icon"
                />
              </li>
              <li>
                <img
                        src="<c:url value='/assets/web/images/en.png'/>"
                        alt=""
                        class="language-icon"
                />
              </li>
            </ul>
            <label class="menu-toggle" for="menu-switch">
                  <i class="fa-solid fa-bars"></i>
                </label>
          </div>
        </div>
      </div>
    </div>
    <div class="header-main">
      <div class="container">
        <div class="header-main-wrapper">
          <input type="checkbox" id="menu-switch">
          <nav class="site-nav">
            <ul class="menu">
              <li class="menu-item d-lg-none">
                <label  class="menu-close" for="menu-switch">
                  <i class="fa-solid fa-xmark"></i>
                </label>
              </li>
              <li class="menu-item">
                <a href="/trang-chu" class="home-page">
                  <i class="fa-solid fa-house"></i>
                </a>
              </li>

              <li class="menu-item has-submenu">
                <a href="/nghanh-hoc">Ngành học</a>
              </li>
              <li class="menu-item has-submenu">
                <a href="/tin-tuc">Tin tức - Sự kiện</a>
              </li>
              <li class="menu-item has-submenu">
                <a href="/tu-van">Tư vấn</a>
              </li>
              <li class="menu-item">
                <a href="/trac-nghiem-huong-nghiep">Trắc nghiệm hướng nghiệp</a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </header>