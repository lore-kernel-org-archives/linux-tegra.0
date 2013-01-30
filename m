From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 30 Jan 2013 12:19:21 +0100
Message-ID: <20130130111921.GA12033@avionic-0098.mockup.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
 <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
 <20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
 <20130116100149.GA13628@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
 <20130130093247.GB21322@avionic-0098.mockup.avionic-design.de>
 <20130130094240.GT9135@intel.com>
 <20130130111436.GA11202@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130130111436.GA11202-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 12:14:36PM +0100, Thierry Reding wrote:
> On Wed, Jan 30, 2013 at 11:42:40AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Wed, Jan 30, 2013 at 10:32:47AM +0100, Thierry Reding wrote:
> > > On Wed, Jan 16, 2013 at 01:36:17PM +0100, Daniel Vetter wrote:
> > > > On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding
> > > > <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > > > > drm_events_release() should be enough to clean up the events, but=
 I
> > > > > suspect the reason why Laurent put that code in was that the drm_=
crtc
> > > > > private data still has a reference to the event and needs to clea=
r it.
> > > > > Otherwise the next page flip won't be scheduled because .page_fli=
p()
> > > > > would return -EBUSY.
> > > >=20
> > > > Hm, indeed we seem to have a nice bug in most drivers there :(
> > >=20
> > > I think I may just recently have run into this bug on Intel hardware.
> > > Although perhaps I just used this wrongly.
> > >=20
> > > Just for the fun of it I wanted to implement Conway's Game of Life on
> > > top of DRM/KMS. So I use two dumb buffer objects to alternately render
> > > to. Then I wanted to use page-flipping to synchronize with VBLANK.
> > >=20
> > > So the sequence is basically:
> > >=20
> > > 	while (!done) {
> > > 		grid_tick(grid);
> > > 		grid_draw(grid, screen);
> > > 		screen_flip(screen);
> > > 		grid_swap(grid);
> > > 	}
> > >=20
> > > Where screen_flip() chooses the framebuffer and passes it to
> > > drmModePageFlip() like so:
> > >=20
> > > 	int fb =3D screen->fb[screen->current];
> > >=20
> > > 	drmModePageFlip(screen->fd, screen->crtc, fb,
> > > 			DRM_MODE_PAGE_FLIP_EVENT, screen);
> > >=20
> > > This runs for about 3 seconds and then hangs, so the display is no
> > > longer updated. I've also verified that the same happens on Radeon.
> > > But maybe I am mistaken and this isn't the proper programming sequenc=
e?
> >=20
> > You asked for page flip events. Do you actually handle them in your cod=
e?
>=20
> Duh. No I wasn't =3D) I suppose some queue must be running full if the
> event isn't handled by calling drmHandleEvent(). Okay, this now works
> properly with page-flipping.

Just in case anybody's interested, the code is here:

	https://gitorious.org/thierryreding/kmslife

Thierry

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRCQG5AAoJEN0jrNd/PrOhTlsQAJssqV4Ph/FjFeok2MCymg/a
45vU5EHermt4M9VciD3Rednd7hwwW7ujNE4mOE1zukpRVMoQ2X9zSYjx92OvKX8x
ITi3YpjLLQe+q5A5lITSjqGkaGjWt4IwTHM0IQZRgBWC4YUnBVMGf5zf0TGhfnMT
3IA7oPi4xyxsu4DfjPrdfuX7QEF3d/wT7uuyyQHL0mF86B1JEAGpE8nC9kggq4oI
u3HAVOXhJwlrGoW8EfXNgCjq/tEfqi/zwIwenyqXNrfFSRs/XRep1k/uS+UFfO8/
SjTsOXlut/cl6+NoqOiE6uqJjbuSXaAqJiFLTwVqAk1laLyrVncilG+R31r6djlP
/JhMsCMlzko4nFWeRm5jgjX5Smhp9zzvLo2AkClUDbg8T5rrx52unavjTZMnkYO6
ROA+xACD1Al6mcGmod/tv5qeDl0QoEkaclspowGSMyZMePmS6S099gz+8rONQD9o
Ihn2xx1IK8RN/NELUqACIOIK/GZ7HjUSKFdMIM1HybKseuhuc5ZWkdggX5zAtz/F
RFW1tcl2xNmd6trOFhIpiOH9CqQW3z0Mam1mytzF+aXsnTmaPhHB63oOT4C9gONr
nBijhpNmy9gFJpw8Nagu+c40lKQv8AyLYjUbZwK0R/uoGeUUG9/Iu41vYxtYZ5jc
LIxwkYgtTgf7JtvRxokc
=gvJJ
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
