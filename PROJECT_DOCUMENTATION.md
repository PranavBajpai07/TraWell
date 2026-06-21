# TraWell Project Documentation

## 1. Project Summary

TraWell is a bus travel booking application. It has an Angular frontend in `UI/` and an ASP.NET Web API backend in `API/TraWellApiProject/`. The application lets users search bus trips, select seats, enter passenger details, pay for bookings, view bookings, cancel bookings, submit feedback, and manage a basic user profile and wallet.

The backend uses Entity Framework 6 with a SQL Server database named `TraWell`. The data model is generated from an EDMX model and includes users, guest users, places, routes, stops, buses, trips, trip stops, bookings, passenger details, transactions, feedback, and admins.

## 2. Repository Layout

```text
TraWell/
|-- README.md
|-- PROJECT_DOCUMENTATION.md
|-- API/
|   |-- README.md
|   |-- TraWellApiSolution.sln
|   `-- TraWellApiProject/
|       |-- App_Start/
|       |-- Controllers/
|       |-- Models/
|       |-- Web.config
|       |-- packages.config
|       `-- TraWellApiProject.csproj
`-- UI/
    |-- angular.json
    |-- package.json
    |-- src/
    |   |-- app/
    |   |-- assets/
    |   `-- environments/
    `-- tsconfig*.json
```

Important files:

| Area | Path | Purpose |
| --- | --- | --- |
| Angular app module | `UI/src/app/app.module.ts` | Declares components, imports Angular modules, and registers services. |
| Angular routing | `UI/src/app/app-routing.module.ts` | Defines user-facing pages and dashboard child routes. |
| Angular services | `UI/src/app/services/` | Wrap API calls and shared frontend state. |
| Angular models | `UI/src/app/model/` | TypeScript shapes used by components and services. |
| API route config | `API/TraWellApiProject/App_Start/WebApiConfig.cs` | Enables attribute routes, default API routing, and CORS. |
| API controllers | `API/TraWellApiProject/Controllers/` | Main backend endpoints. |
| EF models | `API/TraWellApiProject/Models/` | EDMX-generated database entities plus request/response helper models. |
| SQL schema script | `API/TraWellApiProject/Models/TraWellModel.edmx.sql` | Database schema generated from the EDMX. |
| Backend config | `API/TraWellApiProject/Web.config` | .NET settings, EF connection string, and framework config. |

## 3. Technology Stack

### Frontend

- Angular 13
- TypeScript 4.4
- RxJS 7
- Angular Router
- Template-driven and reactive forms
- Angular `HttpClient`
- Bootstrap 4.6
- Font Awesome 5
- jQuery, Popper, Bootstrap JS
- `jspdf` and `html2canvas` for ticket/PDF-related UI behavior

### Backend

- ASP.NET Web API on .NET Framework 4.7.2
- Entity Framework 6.5.1
- SQL Server / SQL Server Express
- Newtonsoft.Json
- MoreLINQ
- IIS Express development hosting

## 4. Running The Project

### Backend

1. Open `API/TraWellApiSolution.sln` in Visual Studio.
2. Restore NuGet packages.
3. Create or restore the `TraWell` SQL Server database.
4. Update the EF connection string in `API/TraWellApiProject/Web.config`.
5. Run the API project.

The API project is configured for IIS Express at:

```text
http://localhost:54873/
```

The current connection string points to:

```text
Data Source=DarkVirus\SQLEXPRESS;
Initial Catalog=TraWell;
Integrated Security=True;
MultipleActiveResultSets=True
```

Change this to match the local SQL Server instance.

### Frontend

From the `UI/` folder:

```bash
npm install
npm start
```

Then open:

```text
http://localhost:4200
```

The Angular services read the API base URL from:

```text
UI/src/environments/environment.ts
UI/src/environments/environment.prod.ts
```

Both currently point to:

```text
http://localhost:54873/api
```

## 5. Basic User Features

### Trip Search

Users choose source city, destination city, departure date, and optionally a return date. The search page stores the search query in `sessionStorage` and navigates to the search results page.

Main frontend files:

- `UI/src/app/search/search.component.*`
- `UI/src/app/search-results/search-results.component.*`
- `UI/src/app/services/searchquery.service.ts`

Main backend file:

- `API/TraWellApiProject/Controllers/SearchQueryController.cs`

### Search Results

The backend returns grouped bus results. Each result contains bus details, matching trip-stop combinations, fare, duration, seat availability, and already-booked seats. The UI lets the user choose onward and return journeys.

### Seat Selection And Passenger Details

After selecting a trip, the user chooses seats and enters passenger details. Selected journey and passenger state is carried through the flow using `sessionStorage` and service-level objects.

Main frontend files:

- `UI/src/app/seat-select/`
- `UI/src/app/passenger-detail/`
- `UI/src/app/booking-details/`

### Payment And Booking Creation

The payment page creates a `FinalDetails` payload and sends it to:

```text
POST /api/booking/CreateNewBooking
```

The backend creates bookings, passenger rows, transactions, and wallet updates.

Main frontend files:

- `UI/src/app/payment-page/`
- `UI/src/app/services/payment.service.ts`

Main backend file:

- `API/TraWellApiProject/Controllers/BookingController.cs`

### User Account

Registered users can sign up, sign in, view/update profile details, change password, view wallet-related transactions, and view booking history.

Main frontend files:

- `UI/src/app/sign-up/`
- `UI/src/app/sign-in/`
- `UI/src/app/user-dash-board/`
- `UI/src/app/user-profile/`
- `UI/src/app/user-wallet/`
- `UI/src/app/change-password/`
- `UI/src/app/services/userlogin.service.ts`
- `UI/src/app/services/user.service.ts`

Main backend file:

- `API/TraWellApiProject/Controllers/UserController.cs`

### Guest Booking

Guest users can book using email and contact details, then later retrieve bookings with those details. When a guest signs up with the same email/contact, existing guest bookings are moved to the registered user.

Main files:

- `UI/src/app/view-booking-guest/`
- `API/TraWellApiProject/Controllers/UserController.cs`
- `API/TraWellApiProject/Controllers/BookingController.cs`

### Booking History, Cancellation, And Feedback

Users can fetch booking IDs, request detailed booking data, cancel active bookings, and submit feedback.

Main endpoint examples:

```text
GET  /api/booking/getUserBooking?id={userId}
POST /api/booking/getGuestBooking
POST /api/booking/GetBooking
GET  /api/booking/CancelBooking?id={bookingId}
POST /api/Feedback
```

Cancellation marks a booking as cancelled, credits the booking amount to the user's wallet, and creates a wallet transaction.

## 6. Frontend Routes

| Route | Component | Purpose |
| --- | --- | --- |
| `/` | `SearchComponent` | Main search page. |
| `/index` | `SearchComponent` | Alternate search route. |
| `/searchresults` | `SearchResultsComponent` | Available trips and bus results. |
| `/bookingdetails` | `BookingDetailsComponent` | Passenger and booking flow. |
| `/payment` | `PaymentPageComponent` | Payment and booking finalization. |
| `/viewbooking` | `ViewBookingComponent` | Registered-user booking history. |
| `/viewbookingguest` | `ViewBookingGuestComponent` | Guest booking lookup. |
| `/signup` | `SignUpComponent` | User registration. |
| `/signin` | `SignInComponent` | User login. |
| `/signout` | `SignOutComponent` | User logout. |
| `/dashboard/profile` | `UserProfileComponent` | Profile details. |
| `/dashboard/wallet` | `UserWalletComponent` | Wallet and wallet transactions. |
| `/dashboard/changePassword` | `ChangePasswordComponent` | Password change. |
| `/errorpage` | `ErrorPageComponent` | API/error fallback page. |
| `**` | `PageNotFoundComponent` | Unknown route. |

## 7. Backend Controllers

| Controller | Main responsibility |
| --- | --- |
| `SearchQueryController` | Finds scheduled trips matching city/date criteria, calculates available seats, booked seats, fare, and duration. |
| `BookingController` | Creates bookings, retrieves bookings, handles guest/user lookup, cancellation, passengers, transactions, and wallet refund logic. |
| `UserController` | Signup, signin, session-hash lookup, profile update, password change, wallet transaction lookup, guest-user checks. |
| `CitySearchController` | Returns place/city data for frontend search. |
| `GetPlacesController` | Returns places for management-style use. |
| `FeedbackController` | Creates booking/bus feedback records. |
| `ManageBusesController` | CRUD operations for buses. |
| `ManageRoutesController` | Lists routes and their ordered stops. |
| `ManageTripsController` | Lists trips and their ordered trip stops. |
| `AddRouteController` | Creates a route from a list of stops. |
| `AddTripController` | Creates a scheduled trip and its trip stops. |
| `LoginController` | Admin login. |
| `FrequentRoutesController` | Calls frequent-route reporting procedure/model. |
| `MostPreferedBusController` | Calls bus feedback/preference reporting procedure/model. |
| `LastMonthProfitController` | Calls profit reporting procedure/model. |

## 8. Database Model

Core tables/entities:

| Entity | Meaning |
| --- | --- |
| `Admins` | Admin users who manage buses, routes, and trips. |
| `Users` | Registered customers. |
| `UserLogs` | Stores generated login hash values for user sessions. |
| `GuestUsers` | Guest customer identity using email/contact. |
| `Places` | Place code, name, and city. |
| `Routes` | Source and destination place codes. |
| `Stops` | Ordered route stops with distance from origin. |
| `Buses` | Bus number, name, seat count, amenities, and seat map metadata. |
| `Trips` | Scheduled bus route with fare rate and status. |
| `TripStops` | Arrival/departure times for each stop in a trip. |
| `Bookings` | User/guest trip booking, status, boarding/arrival stops, and amount. |
| `PassengerDetails` | Passenger and seat records keyed by booking ID and seat. |
| `Transactions` | Payment/wallet transaction rows for bookings. |
| `Feedbacks` | Booking and bus feedback scores. |

Important relationships:

- A `Trip` belongs to a `Bus` and a `Route`.
- A `Route` has many `Stops`.
- A `Trip` has many `TripStops`.
- A `Booking` belongs to a `Trip` and either a registered `User` or a `GuestUser`.
- A `Booking` has many `PassengerDetails`.
- A `Booking` has many `Transactions`.
- `Feedbacks` link bookings and buses.

## 9. Advanced Implementation Details

### Search Algorithm

The search API:

1. Finds all `Places` matching the source and destination cities.
2. Finds departure `TripStops` on the requested date where the trip is scheduled.
3. Finds arrival `TripStops` on or after the requested date.
4. Matches departure and arrival stops on the same trip.
5. Ensures departure happens before arrival.
6. Loads active bookings for that trip.
7. Reduces available seats when an existing booking overlaps the requested travel segment.
8. Calculates fare using route stop distances and trip `CostPerKm`.
9. Groups search results by bus/trip for the frontend.

This is the most domain-specific part of the backend. It combines route geometry, trip timing, booking overlap, seat availability, and fare calculation.

### Booking Creation Flow

The booking API accepts one composite payload:

```text
CompleteBookingDetails
|-- Bookings
|-- Transactions
|-- Passengers
`-- GuestUser
```

For each onward/return booking, the backend:

1. Converts UI booking details into a `Booking`.
2. Creates or reuses a `GuestUser` if needed.
3. Saves the booking to get its generated ID.
4. Saves passenger rows against that booking ID.
5. Saves transaction rows against that booking ID.
6. If payment mode is wallet, subtracts wallet balance from the user.

This works for a simple flow, but it should eventually use a database transaction so all rows succeed or fail together.

### Cancellation Flow

Cancellation:

1. Finds a booked booking by ID.
2. Changes `Status` from `booked` to `cancelled`.
3. Creates a wallet credit transaction.
4. Adds the booking amount back to the user's wallet.

The current logic assumes the booking belongs to a registered user because it looks up `booking.UserId`. Guest cancellation should either be disallowed clearly or handled with a guest refund path.

### Authentication Flow

The current login flow:

1. User submits email and password.
2. API checks the password directly against the `Users.Password` column.
3. API generates an MD5 hash from email plus the current millisecond.
4. API saves that hash in `UserLogs`.
5. Angular stores the hash in `sessionStorage` under `user`.
6. Angular sends the hash to `POST /api/User/GetUser` to restore the user session.

This is not production-safe. Passwords should be hashed with a modern password hasher, and sessions should use a standard token or cookie strategy with expiration and revocation.

### Frontend State

The frontend uses a mixture of:

- Component properties
- Singleton Angular services
- `sessionStorage`

Current `sessionStorage` keys include:

```text
user
searchquery
onwardJourney
retJourney
IsReturn
finalDetails
```

This keeps the booking flow simple, but it makes refreshes, expired state, multi-tab behavior, and data validation harder. A typed state service or route resolver approach would be easier to maintain.

### API Configuration

`WebApiConfig` enables:

- Attribute routes
- Global CORS
- Default route: `api/{controller}/{id}`

Most controllers also use `[EnableCors("*", "*", "*")]`, which allows all origins, headers, and methods. This is convenient during development but should be restricted before deployment.

## 10. Current Strengths

- Clear separation between Angular frontend and Web API backend.
- Most business features for a travel booking app are already present.
- API base URL is already centralized in Angular environment files.
- Booking flow supports both guest users and registered users.
- The route/trip/stop model is expressive enough for intermediate stops and segment-based bookings.
- Search calculates seat availability based on overlapping journey segments, not just full-trip occupancy.
- Admin/reporting endpoints already exist for buses, routes, trips, profit, frequent routes, and preferred buses.
- The root README gives setup guidance, which is a good base for onboarding.

## 11. Improvement Roadmap

### Highest Priority

1. Hash and salt passwords.

   The `Users.Password` and `Admins.Password` values should not be stored or compared as plain text. Use a modern password hasher such as ASP.NET Identity password hashing, BCrypt, PBKDF2, or Argon2.

2. Replace custom MD5 session hashes.

   The current login hash has no clear expiration and uses MD5. Use a standard authentication system, such as JWT bearer tokens or secure HTTP-only cookies. Add expiration, logout invalidation, and server-side authorization checks.

3. Restrict CORS.

   Replace wildcard CORS with explicit trusted origins, such as the Angular production URL and local development URL.

4. Wrap booking creation and cancellation in database transactions.

   Booking, passenger, transaction, and wallet writes should commit atomically. If one insert fails, all related changes should roll back.

5. Prevent seat overbooking.

   The current search checks availability before booking, but another user could book the same seat before checkout completes. Add server-side seat validation inside booking creation and enforce it with a transaction or locking strategy.

6. Add server-side authorization.

   Endpoints such as booking lookup, cancellation, wallet transactions, profile update, and admin management should verify that the caller is allowed to perform the action.

### Backend Quality

1. Return proper HTTP status codes.

   Many endpoints return strings like `Added`, `Invalid`, `Exists`, or `Error`. Prefer `Ok`, `BadRequest`, `Unauthorized`, `NotFound`, and structured response bodies.

2. Add DTOs instead of exposing EF entities directly.

   Returning EF entities can leak database shape and create serialization issues. Use request/response DTOs for API contracts.

3. Move business logic out of controllers.

   Controllers currently contain search, booking, wallet, validation, and conversion logic. Add service classes such as `BookingService`, `SearchService`, `UserService`, and `WalletService`.

4. Use dependency injection.

   Controllers instantiate `TraWellEntities` directly. DI would improve testability and lifetime management.

5. Use async database calls.

   Convert database operations to async methods where practical, especially search and booking endpoints.

6. Improve exception handling and logging.

   Avoid empty `catch` blocks that return generic strings. Log exceptions with enough context to diagnose failures.

7. Normalize constants and statuses.

   Strings like `booked`, `cancelled`, `Scheduled`, `Wallet`, `Credit`, and `Debit` should be enums or constants.

8. Review money types.

   Booking `Amount` currently uses floating-point in the database/model, while transactions use decimal. Use decimal consistently for money.

9. Validate all inputs.

   Add model validation attributes and server-side validation for email, contact, passenger age, seat number, trip availability, route stop order, and payment amount.

10. Add paging/filtering to list endpoints.

   Endpoints that return all buses, bookings, trips, routes, or places can become slow as data grows.

### Frontend Quality

1. Add route guards.

   Protect dashboard, profile, wallet, booking history, and payment routes from invalid or unauthenticated access.

2. Add an HTTP interceptor.

   Centralize auth token attachment, API error handling, loading states, and redirect-to-error behavior.

3. Strengthen TypeScript typing.

   Some services and components use untyped variables or `any`-like behavior. Make API response types explicit.

4. Reduce `sessionStorage` dependence.

   Use a typed booking-flow state service, route parameters, or a store pattern. Persist only what truly needs browser refresh survival.

5. Remove unnecessary multiple `HttpClient` injections.

   Several services inject `HttpClient` more than once. One `HttpClient` instance per service is enough.

6. Replace jQuery-dependent UI behavior.

   Angular apps are easier to maintain when DOM behavior stays inside Angular components/directives. Use Angular-compatible Bootstrap components or plain Angular patterns.

7. Add form validators.

   Use Angular validators consistently for email, contact number, dates, passenger information, password requirements, and payment details.

8. Improve error and empty states.

   Search with no results, expired booking state, failed payment, API outage, and invalid guest lookup should have clear user-facing states.

9. Consider lazy-loaded feature modules.

   Split search, booking, account, and admin areas into feature modules when the app grows.

10. Improve accessibility.

   Check keyboard navigation, labels, focus order, color contrast, and screen-reader hints, especially for seat selection and payment.

### Database And Data Model

1. Add seed data.

   Provide a repeatable local setup script with sample admins, places, routes, stops, buses, trips, and users.

2. Add indexes for common queries.

   Useful candidates include `Places.City`, `TripStops.Stop`, `TripStops.TripId`, `TripStops.DepartureTime`, `Bookings.TripId`, `Bookings.UserId`, `Bookings.GuestId`, and `Bookings.Status`.

3. Add stronger constraints.

   Enforce valid statuses, positive fares, positive seat counts, unique bus numbers, valid seat ranges, and non-negative wallet balances.

4. Review naming consistency.

   The SQL script includes `Feedbacks`, while some drop statements refer to `Feedback`. Keep table and entity names consistent.

5. Introduce migrations or a clear schema deployment process.

   An EDMX-generated SQL file is useful, but a migration strategy makes team development and deployment safer.

### Security And Compliance

1. Use HTTPS in all environments beyond local development.
2. Do not expose full user records to the frontend when only a subset is needed.
3. Do not send or store passwords after login.
4. Add anti-forgery or token protections depending on the final auth design.
5. Add audit logging for login, booking, cancellation, wallet changes, and admin changes.
6. Validate ownership before returning booking details.
7. Avoid putting secrets and machine-specific connection strings directly in committed config.

### Testing

1. Add backend unit tests for search availability, fare calculation, booking creation, cancellation, and guest-to-user migration.
2. Add backend integration tests against a test database.
3. Add frontend unit tests for services and core components.
4. Add end-to-end tests for search, booking, payment, cancellation, and account flows.
5. Add regression tests for seat-overlap logic. This is one of the most business-critical algorithms in the project.

### DevOps And Deployment

1. Add a root-level setup guide for both UI and API.
2. Add environment-specific API URLs for dev, test, and production.
3. Add CI to install UI dependencies, build Angular, restore NuGet packages, and build the API.
4. Add a production deployment plan for the Angular build output and Web API host.
5. Add database backup/restore instructions.
6. Add log collection and runtime health checks.

## 12. Suggested Architecture Direction

A cleaner medium-term architecture would look like this:

```text
Angular Components
        |
Angular Services + Route Guards + HTTP Interceptor
        |
Typed API DTOs
        |
ASP.NET Web API Controllers
        |
Application Services
        |-- SearchService
        |-- BookingService
        |-- UserService
        |-- WalletService
        `-- AdminService
        |
Repositories / EF DbContext
        |
SQL Server
```

This keeps controllers thin, makes business rules testable, and gives the frontend a stable API contract.

## 13. Practical Next Steps

Recommended first improvement sequence:

1. Add server-side transaction handling and final seat validation to booking creation.
2. Replace plain-text passwords with password hashing.
3. Replace MD5 session hash auth with a standard token or cookie-based auth approach.
4. Add route guards and an HTTP interceptor in Angular.
5. Restrict CORS to known frontend origins.
6. Add model validation and structured API responses.
7. Add tests for search, booking, cancellation, and auth.
8. Add seed data and database setup instructions.

This order improves correctness and security before large refactors. It also keeps each step small enough to verify.

## 14. Quick Glossary

| Term | Meaning |
| --- | --- |
| Place | A stop/place code with name and city. |
| Route | A fixed path from source to destination. |
| Stop | A place on a route with distance from route origin. |
| Trip | A scheduled bus running on a route. |
| TripStop | Arrival/departure time for a stop on a trip. |
| Booking | A customer reservation for a trip segment. |
| PassengerDetail | Passenger and seat information under one booking. |
| Transaction | Payment or wallet movement tied to a booking. |
| GuestUser | A non-registered user identified by email/contact. |
| UserLog | Current custom session hash table. |

