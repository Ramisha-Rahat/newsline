// Pages & UI actions you’ll need
// 1. Authentication
//
// Login Page
//
// Email/username input, password field.
//
// “Login” button → API call to authenticate.
//
// “Sign Up” link → go to Register page.
//
// Register Page
//
// Username, email, password fields.
//
// “Sign Up” button → API call to create User.
//
// Profile Setup (optional after signup)
//
// Bio, location, upload avatar → API call to create/update Profile.
//
// 2. News Section
//
// News Feed Page
//
// List of NewsArticle items (title, description, source, published_at).
//
// Clicking an article → open News Detail Page.
//
// “Save” button → API call to save it in UserNewsHistory.
//
// News Detail Page
//
// Full description + link to original source.
//
// “Bookmark” / “Save” → store in DB.
//
// Show author name if available.
//
// Saved News Page
//
// List of saved articles from UserNewsHistory.
//
// Option to delete from saved list.
//
// 3. Blog Section (for is_published_user)
//
// Blog List Page
//
// Show all blog posts (BlogPost) by authors.
//
// Thumbnail (cover_image_url), title, snippet.
//
// Blog Detail Page
//
// Full blog content + cover image.
//
// Author info (from User + Profile).
//
// Blog Create/Edit Page (for authors)
//
// Title, content, cover image upload.
//
// Save → POST/PUT to API.
//
// My Blogs Page (for logged-in authors)
//
// List of own blog posts.
//
// Edit / Delete buttons.
//
// 4. Profile
//
// Profile Page
//
// Show username, bio, location, avatar.
//
// “Edit Profile” button.
//
// Edit Profile Page
//
// Form for updating bio, location, avatar.
//
// Save → PUT request to update Profile.
//
// 5. Navigation
//
// Bottom Navigation Tabs:
//
// Home (News Feed)
//
// Saved (Saved News)
//
// Blogs
//
// Profile
//
// Extra (Nice to Have)
//
// Search in news & blogs.
//
// Filter news by source.
//
// Pagination/infinite scroll for feed.
//
// Pull-to-refresh.