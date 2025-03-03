document.getElementById("myForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const getRadioValue = (name) => document.querySelector(`input[name="${name}"]:checked`)?.value || "Not Selected";
    const getCheckboxValues = (name) => [...document.querySelectorAll(`input[name="${name}"]:checked`)].map(cb => cb.value);


    const formData = {
        sid: document.getElementById("sid").value,
        year: document.getElementById("year").value,
        branch: document.getElementById("branch").value,
        section: document.getElementById("section").value,
        residence: getRadioValue("residence"),
        gender: getRadioValue("gender"),
        collgeName: document.getElementById("collgeName").value,
        collegeType: getRadioValue("collegeType"),
        city: document.getElementById("city").value,
        dist: document.getElementById("dist").value,
        state: document.getElementById("state").value,
        socialMedia: getCheckboxValues("socialMedia"),
        category: getCheckboxValues("category"),
        socialMediaTime: document.getElementById("socialMediaTime").value,
        studyMethod: getRadioValue("studyMethod"),
        preparationPeriod: getRadioValue("preparationPeriod"),
        resource: getCheckboxValues("resource"),
        studyTime: document.getElementById("studyTime").value,
        cgpa: document.getElementById("cgpa").value,
        certifications: document.getElementById("certifications").value,
        projects: document.getElementById("projects").value,
        workshops: document.getElementById("workshops").value,
        seminars: document.getElementById("seminars").value
    };

    fetch("https://api.jsonbin.io/v3/b/67c59ea0acd3cb34a8f42c5a", {
        method: "PUT",  // Use PUT to update the JSON Bin
        headers: {
            "Content-Type": "application/json",
            "X-Master-Key": "$2a$10$OJjRvF68OcMXhl8FUe3h3O6oT0APHl5liX1iyRTkKLG0jWAgkRuSi"
        },
        body: JSON.stringify(formData)
    })
    .then(response => response.json())
    .then(result => {
        alert("Data submitted successfully!");
        console.log(result);
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Error submitting form.");
    });
});
