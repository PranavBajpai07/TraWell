# TraWell

TraWell is a bus travel booking application with an Angular frontend and an ASP.NET Web API backend. The app supports trip search, seat selection, passenger details, guest and registered-user bookings, wallet payments, booking history, cancellation, feedback, and basic admin/reporting API endpoints.

## Project Structure

```text
TraWell/
|-- API/
|   |-- TraWellApiSolution.sln
|   `-- TraWellApiProject/
|       |-- Controllers/
|       |-- Models/
|       |-- App_Start/
|       `-- Web.config
`-- UI/
    |-- angular.json
    |-- package.json
    `-- src/
        |-- app/
        |-- assets/
        `-- environments/
```

## Tech Stack

### Frontend

- Angular 13
- TypeScript 4.4
- RxJS
- Angular Forms and Reactive Forms
- Angular Router
- `HttpClient` for API calls

### Backend

- ASP.NET Web API
- .NET Framework 4.7.2
- Entity Framework 6
- SQL Server
- Newtonsoft.Json
- MoreLINQ

## Features

- Search buses by source city, destination city, and journey date
- Optional return-trip search
- View available buses, stops, duration, seat availability, and fare
- Select passenger seats
- Add passenger details
- Book as a registered user or guest user
- Pay using card, UPI, net banking, or wallet logic
- View booking history
- Cancel bookings and refund to wallet
- Submit bus and booking feedback
- User signup, signin, signout, profile update, wallet view, and password change
- Admin-oriented API endpoints for buses, routes, trips, profit, frequent routes, and preferred buses

## Important Paths

| Area | Path |
| --- | --- |
| Angular app module and routes | `UI/src/app/app.module.ts` |
| Angular services | `UI/src/app/services/` |
| Angular models | `UI/src/app/model/` |
| API controllers | `API/TraWellApiProject/Controllers/` |
| Entity Framework models | `API/TraWellApiProject/Models/` |
| API configuration | `API/TraWellApiProject/Web.config` |
| Web API route config | `API/TraWellApiProject/App_Start/WebApiConfig.cs` |

## Backend API

The frontend currently calls the backend at:

```text
http://localhost:54873/api/
```

Main API areas:

| Controller | Purpose |
| --- | --- |
| `UserController` | Signup, signin, user profile, password change, wallet transactions |
| `BookingController` | Create bookings, fetch bookings, guest/user booking lookup, cancellation |
| `SearchQueryController` | Trip search, seat availability, fare calculation |
| `CitySearchController` | City list for frontend search |
| `FeedbackController` | Booking and bus feedback |
| `ManageBusesController` | Bus CRUD operations |
| `ManageRoutesController` | Route listing |
| `ManageTripsController` | Trip listing |
| `AddRouteController` | Add a new route |
| `AddTripController` | Add a new trip |
| `LoginController` | Admin login |
| `FrequentRoutesController` | Frequent route report |
| `MostPreferedBusController` | Preferred bus report |
| `LastMonthProfitController` | Profit report |

## Database

The backend uses Entity Framework with a SQL Server database named `TraWell`.

The current connection string in `API/TraWellApiProject/Web.config` points to:

```text
Data Source=DarkVirus\SQLEXPRESS;
Initial Catalog=TraWell;
Integrated Security=True;
MultipleActiveResultSets=True
```

Update this connection string for your local SQL Server instance before running the API.

The included EDMX SQL file defines tables such as:

- `Admins`
- `Users`
- `UserLogs`
- `GuestUsers`
- `Places`
- `Routes`
- `Stops`
- `Buses`
- `Trips`
- `TripStops`
- `Bookings`
- `PassengerDetails`
- `Transactions`
- `Feedbacks`

## Setup

### Prerequisites

- Node.js and npm
- Angular CLI 13
- Visual Studio 2019 or later
- .NET Framework 4.7.2 developer tools
- SQL Server or SQL Server Express

### Backend Setup

1. Open the solution:

   ```text
   API/TraWellApiSolution.sln
   ```

2. Restore NuGet packages in Visual Studio.

3. Create or restore the `TraWell` SQL Server database.

4. Update the connection string in:

   ```text
   API/TraWellApiProject/Web.config
   ```

5. Run the API project. The frontend expects it to be available at:

   ```text
   http://localhost:54873
   ```

### Frontend Setup

From the `UI` folder:

```bash
npm install
npm start
```

Then open:

```text
http://localhost:4200
```

## Frontend Routes

| Route | Page |
| --- | --- |
| `/` | Search page |
| `/index` | Search page |
| `/searchresults` | Search results |
| `/bookingdetails` | Passenger and booking details |
| `/payment` | Payment page |
| `/viewbooking` | Registered-user booking history |
| `/viewbookingguest` | Guest booking lookup |
| `/signup` | Register |
| `/signin` | Login |
| `/signout` | Sign out |
| `/dashboard/profile` | User profile |
| `/dashboard/wallet` | User wallet |
| `/dashboard/changePassword` | Change password |
| `/errorpage` | Error page |

## Notes for Developers

- The frontend currently stores flow state in `sessionStorage`.
- API URLs are hard-coded in Angular services. Moving them to `environment.ts` would make local and production configuration easier.
- Bootstrap and Font Awesome classes are used in templates. If the UI styles/icons do not load, add the required packages or CDN references.
- `jspdf` and `html2canvas` are imported for ticket PDF generation. Ensure these packages are installed before building.
- CORS is enabled broadly on the API controllers.
- Passwords are currently handled as plain text in the API model and comparisons. This should be replaced with secure password hashing before production use.

## Suggested Improvements

- Move API base URL to Angular environment files.
- Add authentication tokens with expiration instead of storing a generated hash in `sessionStorage`.
- Hash and salt passwords.
- Restrict CORS to trusted frontend origins.
- Add frontend and backend validation consistency.
- Add unit and integration tests.
- Add a seed database script for local development.
- Consolidate Angular routes into `app-routing.module.ts`.

## License

No license file is currently included. Add a license before publishing or distributing the project.
