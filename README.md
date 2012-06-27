# NatTape

A site for sharing playlists online.

## Endpoints

 * /
 * /logout
 * /login -> /auth/twitter
 * /auth/twitter/callback
 * /playlist/edit/:id
 * /playlist/view/:id

## Design

 * Songs uploaded to S3
 * Playlists are stored as JSON in S3 and cached on disk
   * Playlist JSON is an ordered list and contains url for song, all necessary metadata and modified date.
 * Edit page is accessible only by Twitter auth person who created page (username = proto:name)
 * URL string is not editable

## LICENSE

opentape - GNU GPL v3: 
SWFObject - MIT License: http://www.opensource.org/licenses/mit-license.php
jQuery - 
nattape - 
padrino - 
