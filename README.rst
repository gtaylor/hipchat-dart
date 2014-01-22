HipChat for Dart
================

:Author: Greg Taylor
:License: BSD

This package is the beginnings of an API client for the HipChat web
API (version 2). While we don't currently support all of the endpoints
offered by HipChat, pull requests of good quality (with tests) will
be accepted quickly.

What works?
-----------

* Listing channels.
* Sending Notifications to a channel.

What doesn't work?
------------------

* Basically everything else.
* Error handling is non-existent. At the time of this library's writing, the
  async unit testing support was pretty weird and not finalized. I decided
  to end my exercise of playing with Dart at that point.

Documentation
-------------

May be worked on some day. Check out the tests under ``test/client.dart``.

License
-------

This project, and all contributed code, are licensed under the BSD License.
A copy of the BSD License may be found in the repository.
