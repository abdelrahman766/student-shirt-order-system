const API_URL = "http://localhost:3000/api";
const teamSelect =  document.getElementById("team");
const teamForm =  document.getElementById("teamForm");
const message =  document.getElementById("message");


async function loadTeams() {
    try {
        const response = await fetch(`${API_URL}/teams`);
        if (!response.ok) {
            throw new Error(  "Failed to load teams" ); }

        const teams = await response.json();

        teams.forEach(team => {
            const option = document.createElement("option");
            option.value =  team.id;
            option.textContent =  team.team_name;
            teamSelect.appendChild( option );

        });


    } catch (error) {

        console.error(error);
        message.textContent =  error.message ||  "حدث خطأ أثناء تحميل الفرق";

        message.className = "message error";
    }
}


teamForm.addEventListener( "submit",
    event => {
        event.preventDefault();
        const teamId =  teamSelect.value;

        if (!teamId) {
            message.textContent =  "من فضلك اختر الفريق";
            message.className =  "message error";
            return;
        }

        window.location.href = `order.html?team_id=${teamId}`;
    }
);


loadTeams();