const API_URL = "http://localhost:3000/api";
const params =  new URLSearchParams( window.location.search);

const teamId = params.get("team_id");
const teamName =  document.getElementById("teamName");
const studentSelect =  document.getElementById("student");
const academicYearSelect =  document.getElementById("academicYear");
const form =  document.getElementById("orderForm");
const message = document.getElementById("message");

let selectedTeamName = "";


async function loadTeam() {

    const response =
        await fetch(`${API_URL}/teams`);


    if (!response.ok) {
        throw new Error(  "Failed to load team" );
    }


    const teams = await response.json();


    const team = teams.find(  item =>  String(item.id) === String(teamId) );


    if (!team) {
        throw new Error( "Team not found" );
    }
    selectedTeamName =  team.team_name;
    teamName.value =  selectedTeamName;
}


async function loadStudents() {

    const response =  await fetch(
            `${API_URL}/students?team_id=${teamId}`
        );


    if (!response.ok) {
        throw new Error(  "Failed to load students" );
    }


    const students =  await response.json();


    students.forEach(student => {
        const option =  document.createElement("option");
        option.value =  student.id;
        option.textContent = student.full_name;
        studentSelect.appendChild( option );
    });
}


async function loadAcademicYears() {
    const response =  await fetch(  `${API_URL}/academic-years`
        );


    if (!response.ok) {
        throw new Error(  "Failed to load academic years"
        );
    }


    const years = await response.json();


    years.forEach(year => {  const option = document.createElement("option");

        option.value = year.id;
        option.textContent =   year.year_name;
        academicYearSelect.appendChild( option );
    });
}


form.addEventListener(  "submit",
    async event => {
        event.preventDefault();
        message.textContent =  "جاري حفظ الطلب...";
        message.className =  "message";

        const data = {
            student_id: Number( studentSelect.value  ),

            size:  document.getElementById( "size" ).value,

            shirt_number:  Number( document.getElementById( "shirtNumber" ).value ),

            receipt_number: document .getElementById( "receiptNumber" ).value.trim(),

            height_cm:  Number(  document.getElementById( "height" ).value ),

            weight_kg: Number( document.getElementById( "weight" ).value ),

            address: document .getElementById( "address" ) .value .trim(),

            school:  document .getElementById( "school" ) .value .trim(),

            academic_year_id:  Number( academicYearSelect.value)

        };


        console.log( "Sending order:", data );


        try {
            const response =  await fetch(  `${API_URL}/orders`,
                  {
                       method: "POST",
                        headers: {  "Content-Type": "application/json" },
                        body:  JSON.stringify(data)
                    }
                );


            const result =  await response.json();

            console.log(  "Server response:",  result );

            if (!response.ok) {
                throw new Error(  result.error ||  result.message ||  "Failed to save order" );
            }


            message.textContent = `تم حفظ الطلب بنجاح `;

            message.className =  "message success";

            form.reset();

            teamName.value =
                selectedTeamName;
        }


        catch (error) {

            console.error(   "Save order error:", error);

            message.textContent =   error.message ||  "حدث خطأ أثناء حفظ الطلب";

            message.className = "message error";
        }

    }
);



async function init() {

    if (!teamId) {
        window.location.href =  "index.html";
        return;
    }


    try {
        await loadTeam();
        await loadStudents();
        await loadAcademicYears();
    }


    catch (error) {
        console.error(error);
        message.textContent =  error.message ||  "حدث خطأ أثناء تحميل البيانات";
        message.className = "message error";
    }
}
init();