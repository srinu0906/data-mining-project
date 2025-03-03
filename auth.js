const ADMIN_PASSWORD = "12345"; // Change this to a strong password

function login() {
    const password = document.getElementById("password").value;
    if (password === ADMIN_PASSWORD) {
        localStorage.setItem("isAdmin", "true");
        showAdminPanel();
    } else {
        document.getElementById("errorMsg").textContent = "Incorrect Password!";
    }
}

function showAdminPanel() {
    document.getElementById("loginBox").style.display = "none";
    document.getElementById("adminPanel").style.display = "block";
    document.getElementById("dataTable").style.display = "table";
}

function logout() {
    localStorage.removeItem("isAdmin");
    location.reload();
}

// Auto-login if admin is already authenticated
if (localStorage.getItem("isAdmin") === "true") {
    showAdminPanel();
}
