import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { SearchComponent } from './search/search.component';
import { SearchResultsComponent } from './search-results/search-results.component';
import { BookingDetailsComponent } from './booking-details/booking-details.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { SignInComponent } from './sign-in/sign-in.component';
import { SignOutComponent } from './sign-out/sign-out.component';
import { PaymentPageComponent } from './payment-page/payment-page.component';
import { ViewBookingComponent } from './view-booking/view-booking.component';
import { UserDashBoardComponent } from './user-dash-board/user-dash-board.component';
import { UserProfileComponent } from './user-profile/user-profile.component';
import { UserWalletComponent } from './user-wallet/user-wallet.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { ViewBookingGuestComponent } from './view-booking-guest/view-booking-guest.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { ErrorPageComponent } from './error-page/error-page.component';

const routes: Routes = [
  { path: '', component: SearchComponent },
  { path: 'index', component: SearchComponent },
  { path: 'searchresults', component: SearchResultsComponent },
  { path: 'bookingdetails', component: BookingDetailsComponent },
  { path: 'signup', component: SignUpComponent },
  { path: 'signin', component: SignInComponent },
  { path: 'signout', component: SignOutComponent },
  { path: 'payment', component: PaymentPageComponent },
  { path: 'viewbooking', component: ViewBookingComponent },
  { path: 'errorpage', component: ErrorPageComponent },
  { path: 'viewbookingguest', component: ViewBookingGuestComponent },
  {
    path: 'dashboard',
    component: UserDashBoardComponent,
    children: [
      { path: 'profile', component: UserProfileComponent },
      { path: 'wallet', component: UserWalletComponent },
      { path: 'changePassword', component: ChangePasswordComponent },
      { path: '', redirectTo: '/dashboard/profile', pathMatch: 'full' }
    ]
  },
  { path: '**', component: PageNotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
