const BIN_ID = "67c59ea0acd3cb34a8f42c5a"; // Replace with your JSONBin ID
const API_KEY = "$2a$10$OJjRvF68OcMXhl8FUe3h3O6oT0APHl5liX1iyRTkKLG0jWAgkRuSi"; // Replace with your API Key

fetch(`https://api.jsonbin.io/v3/b/${BIN_ID}/latest`, {
    method: "GET",
    headers: {
        "X-Master-Key": API_KEY
    }
})
.then(response => response.json())
.then(data => {
    const submissions = data.record;
    const tableBody = document.querySelector("#dataTable tbody");
    const totalElement = document.getElementById("total");

    totalElement.textContent = `Total Submissions: ${submissions.length - 1}`;

    submissions.slice(1).forEach(entry => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${entry.sid}</td>
            <td>${entry.year}</td>
            <td>${entry.branch}</td>
            <td>${entry.section}</td>
            <td>${entry.residence}</td>
            <td>${entry.collgeName}</td>
            <td>${entry.collegeType}</td>
            <td>${entry.city}</td>
            <td>${entry.dist}</td>
            <td>${entry.state}</td>
            <td>${entry.socialMedia}</td>
            <td>${entry.category}</td>
            <td>${entry.socialMediaTime}</td>
            <td>${entry.studyMethod}</td>
            <td>${entry.preparationPeriod}</td>
            <td>${entry.resource}</td>
            <td>${entry.studyTime}</td>
            <td>${entry.cgpa}</td>
            <td>${entry.certifications}</td>
            <td>${entry.projects}</td>
            <td>${entry.workshops}</td>
            <td>${entry.seminars}</td>
        `;
        tableBody.appendChild(row);
    });
})
.catch(error => {
    console.error("Error fetching data:", error);
});
