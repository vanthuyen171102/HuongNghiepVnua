<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="left-side-bar">
    <div class="brand-logo">
        <a href="index.html"> ADMIN </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
            <i class="ion-close-round"></i>
        </div>
    </div>
    <div class="menu-block customscroll">
        <div class="sidebar-menu">
            <ul id="accordion-menu">
                <li class="dropdown"><a href="javascript:;"
                                        class="dropdown-toggle"> <span class="micon bi bi-newspaper"></span><span
                        class="mtext">Quản lý tin tức</span>
                </a>
                    <ul class="submenu">
                        <li><a href="/admin/news">Danh sách tin tức</a></li>
                        <li><a href="/admin/news/create">Thêm tin tức</a></li>
                    </ul>
                </li>

                <li class="dropdown"><a href="javascript:;"
                                        class="dropdown-toggle"> <span class="micon bi bi-people"></span><span
                        class="mtext">Nghành học</span>
                </a>
                    <ul class="submenu">
                        <li><a href="/admin/field">Danh sách nghành học</a></li>
                        <li><a href="/admin/field/create">Thêm nghành học</a></li>
                        <li><a href="/admin/specialized">Danh sách chuyên nghành</a></li>
                        <li><a href="/admin/specialized/create">Thêm chuyên nghành</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="javascript:;"
                                        class="dropdown-toggle"> <span class="micon bi bi-people"></span><span
                        class="mtext">Tư vấn</span>
                </a>
                    <ul class="submenu">
                        <li><a href="/admin/advise">Danh sách tư vấn</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="javascript:;"
                                        class="dropdown-toggle"> <span
                        class="micon bi bi-file-person-fill"></span><span class="mtext">Quản
							lý tài khoản</span>
                </a>
                    <ul class="submenu">
                        <li><a href="/admin/user/create">Thêm tài khoản</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>