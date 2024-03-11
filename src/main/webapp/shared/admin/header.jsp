<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<div class="header">
      <div class="header-left">
        <div class="menu-icon bi bi-list"></div>
        <div
          class="search-toggle-icon bi bi-search"
          data-toggle="header_search"
        ></div>
        <div class="header-search">
          <form>
            <div class="form-group mb-0">
              <i class="dw dw-search2 search-icon"></i>
              <input
                type="text"
                class="form-control search-input"
                placeholder="Search Here"
              />
              <div class="dropdown">
                <a
                  class="dropdown-toggle no-arrow"
                  href="#"
                  role="button"
                  data-toggle="dropdown"
                >
                </a>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="header-right">
        <label class="header-profile" for="profile-dropdown">
          <img src="http://localhost:3000/resources/default-avatar.png" alt="" class="avatar">
          <span class="username">Vũ Văn Thuyên</span>
          <input type="checkbox" name="profile-dropdown" id="profile-dropdown">
          <div class="custom-dropdown">
            <a class="custom-dropdown-item" href="/admin/profile">Thông tin tài khoản</a>
            <a class="custom-dropdown-item" href="/admin/change-password">Đổi mật khẩu</a>
            <a class="custom-dropdown-item" href="/admin/logout">Đăng xuất</a>
          </div>
        </label>
      </div>
    </div>
