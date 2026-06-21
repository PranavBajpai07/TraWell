# TraWell - Angular Bus Booking Application

## Architecture Overview
TraWell is an Angular single-page application for bus travel booking with a separate .NET backend API. The app manages user authentication, trip search, seat selection, booking, and payment flows.

**Key Components:**
- `search/`: Trip search with reactive forms and city validation
- `search-results/`: Displays available trips from API
- `seat-select/`: Interactive seat selection with booked seat blocking
- `passenger-detail/`: Multi-passenger form management
- `payment-page/`: Payment processing integration
- `user-dash-board/`: Nested routing for profile, wallet, bookings

**Data Flow:**
- Services handle HTTP calls to `http://localhost:54873/api/*` endpoints
- Temporary state stored in `sessionStorage` (e.g., searchquery, onwardJourney)
- Models use PascalCase properties (e.g., `FirstName`, `BookingDate`)
- Error handling routes to `/errorpage` component

## Development Patterns

### Forms & Validation
Use reactive forms with custom validators. Validate cities against API-fetched place list:
```typescript
// In search.component.ts
this.searchForm.valueChanges.subscribe((data) => {
  if(!this.ValidateCity(data.FromCity) || data.FromCity === data.ToCity){
    this.searchForm.setErrors({'incorrect': true});
  }
});
```

### Seat Selection Logic
Seats are disabled if booked or selected by other passengers:
```typescript
// In seat-select.component.ts
isDisabled(seatNo): boolean {
  if(this.BookedSeats.indexOf(seatNo) !== -1) return true;
  const otherSeats = this.passengers.map(p => p.Seat).filter(s => s !== this.passenger.Seat);
  return otherSeats.indexOf(seatNo) !== -1;
}
```

### State Management
Persist search/booking state in sessionStorage, clear unrelated data on navigation:
```typescript
SessionClearOthers(){
  sessionStorage.removeItem('onwardJourney');
  sessionStorage.removeItem('retJourney');
}
```

### Routing
Routes defined in `app.module.ts` with nested routes for dashboard. Use `router.navigateByUrl()` for programmatic navigation.

### Services
Injectable services for API calls. Example:
```typescript
@Injectable()
export class PlaceService {
  getAllPlacesFromAPI(){
    return this.http.get("http://localhost:54873/api/citysearch");
  }
}
```

## Build & Run
- Backend API must be running on `localhost:54873`
- No visible build configuration (package.json, angular.json missing)
- Use sessionStorage for development state persistence

## Conventions
- Model properties: PascalCase (e.g., `UserId`, `BookingDate`)
- Component methods: camelCase
- Custom pipe: `numIterate` for generating number arrays
- Error display: HTML strings in component properties</content>
<parameter name="filePath">F:\Training\Gladiator Project\Final Repo\Final Project\TraWell\.github\copilot-instructions.md