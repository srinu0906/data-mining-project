document.getElementById("myForm").addEventListener("submit", function(event) {
    event.preventDefault();
    console.log("hi");
    const data = {
        sid: document.getElementById("sid").value,
        year: document.getElementById("year").value,
        branch: document.getElementById("branch").value,
        section: document.getElementById("section").value,
          residence: document.getElementById("residence").value,
          collgeName: document.getElementById("collgeName").value,                
        collegeType: document.getElementById("collegeType").value,
          city: document.getElementById("city").value,
          dist: document.getElementById("dist").value,
        state: document.getElementById("state").value,
          socialMedia: document.getElementById("socialMedia").value,
         category: document.getElementById("category").value,
        socialMediaTime: document.getElementById("socialMediaTime").value,
          studyMethod: document.getElementById("studyMethod").value,
          preparationPeriod: document.getElementById("preparationPeriod").value,
        resource: document.getElementById("resource").value,
          studyTime: document.getElementById("studyTime").value,
          cgpa: document.getElementById("cgpa").value,
        certifications: document.getElementById("certifications").value,
          projects: document.getElementById("projects").value,
          workshops: document.getElementById("workshops").value,   
          seminars: document.getElementById("seminars").value,
    };
    fetch("https://script.google.com/macros/s/AKfycbxfD-nrcn6bWUhF20nRcAapCDIrabwJlz0PyI8Nef1Q6AfewfMd5d7XXBPeCrTP9Ies/exec", {
        method: "POST",
        body: JSON.stringify(data),
        headers: { "Content-Type": "application/json" },
        mode:"no-cors"
    })
    .then(response => response.text())
    .then(data => alert("Form submitted successfully!"))
    .catch(error => alert("Error submitting form."));
});