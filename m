From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 30 Jan 2013 12:14:36 +0100
Message-ID: <20130130111436.GA11202@avionic-0098.mockup.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
 <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
 <20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
 <20130116100149.GA13628@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
 <20130130093247.GB21322@avionic-0098.mockup.avionic-design.de>
 <20130130094240.GT9135@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130130094240.GT9135-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 11:42:40AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Wed, Jan 30, 2013 at 10:32:47AM +0100, Thierry Reding wrote:
> > On Wed, Jan 16, 2013 at 01:36:17PM +0100, Daniel Vetter wrote:
> > > On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding
> > > <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > > > drm_events_release() should be enough to clean up the events, but I
> > > > suspect the reason why Laurent put that code in was that the drm_cr=
tc
> > > > private data still has a reference to the event and needs to clear =
it.
> > > > Otherwise the next page flip won't be scheduled because .page_flip()
> > > > would return -EBUSY.
> > >=20
> > > Hm, indeed we seem to have a nice bug in most drivers there :(
> >=20
> > I think I may just recently have run into this bug on Intel hardware.
> > Although perhaps I just used this wrongly.
> >=20
> > Just for the fun of it I wanted to implement Conway's Game of Life on
> > top of DRM/KMS. So I use two dumb buffer objects to alternately render
> > to. Then I wanted to use page-flipping to synchronize with VBLANK.
> >=20
> > So the sequence is basically:
> >=20
> > 	while (!done) {
> > 		grid_tick(grid);
> > 		grid_draw(grid, screen);
> > 		screen_flip(screen);
> > 		grid_swap(grid);
> > 	}
> >=20
> > Where screen_flip() chooses the framebuffer and passes it to
> > drmModePageFlip() like so:
> >=20
> > 	int fb =3D screen->fb[screen->current];
> >=20
> > 	drmModePageFlip(screen->fd, screen->crtc, fb,
> > 			DRM_MODE_PAGE_FLIP_EVENT, screen);
> >=20
> > This runs for about 3 seconds and then hangs, so the display is no
> > longer updated. I've also verified that the same happens on Radeon.
> > But maybe I am mistaken and this isn't the proper programming sequence?
>=20
> You asked for page flip events. Do you actually handle them in your code?

Duh. No I wasn't =3D) I suppose some queue must be running full if the
event isn't handled by calling drmHandleEvent(). Okay, this now works
properly with page-flipping.

Thanks.
Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRCQCcAAoJEN0jrNd/PrOhTYAP/AvH3fPVZW9wKE5G091i4+xt
4QuxUNruSvKNiS8chQ+NN2hAFyVOLvkTkkgTCTIG24v5cp8UfV/PTwCdsv22aK0A
iSVNi3lHisoazKisfmc5X4FWLOgGhjXi1tAE9hzcomxZ+qiooXggwEdaMwYmhNfH
M42+jcGSeh040HOQnMmNdnJn24kMd8wv5IKMz7ene1DPGYLohXHvrJGy+0nt6mqv
8PrmllNXPMeA2veVUWb7fcLJam+TZSvmLVu4K+zzbRk5+XtH7N3kohBzzKj+hjhB
p4ca58s5zlF1nILBe/2XC6Bgc21d0V9MvuCatiiOzV+dpWgNQQuAv4sHFx6JTHZc
fAzug6QzYbfsJzAfkp17xHUTvW2ZzrB4OwBm1bv4ztNSOZp9905+NpY1sbdJ5s4i
hRVVswhMQUGaB7mdDZy/nCHSniUkJ0H/P0dsFgFkgDQeGJ5ElgW2JWO7LvanQZZn
Z7pQ3Sd5yi008OgmMRbUsdtqVKrcA8rjmANgMUkGIq53hJLdS3p1kR5dvQ5evBH1
8vayHf97HYU4QscXC4cmA09q4JtDWGxUv3As6XGZQyNxwGm3+crc4o6XDtE6rzJe
auUL08TSymIw49J8ojdZm9RIp2rp9/7veqvV6INk2UnNaS4bnZx8LTuNJOGeAJXd
fxeQSXHyjXrwdfLTW8aA
=2aXa
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
