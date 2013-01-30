From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 30 Jan 2013 10:32:47 +0100
Message-ID: <20130130093247.GB21322@avionic-0098.mockup.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
 <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
 <20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
 <20130116100149.GA13628@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 01:36:17PM +0100, Daniel Vetter wrote:
> On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > drm_events_release() should be enough to clean up the events, but I
> > suspect the reason why Laurent put that code in was that the drm_crtc
> > private data still has a reference to the event and needs to clear it.
> > Otherwise the next page flip won't be scheduled because .page_flip()
> > would return -EBUSY.
>=20
> Hm, indeed we seem to have a nice bug in most drivers there :(

I think I may just recently have run into this bug on Intel hardware.
Although perhaps I just used this wrongly.

Just for the fun of it I wanted to implement Conway's Game of Life on
top of DRM/KMS. So I use two dumb buffer objects to alternately render
to. Then I wanted to use page-flipping to synchronize with VBLANK.

So the sequence is basically:

	while (!done) {
		grid_tick(grid);
		grid_draw(grid, screen);
		screen_flip(screen);
		grid_swap(grid);
	}

Where screen_flip() chooses the framebuffer and passes it to
drmModePageFlip() like so:

	int fb =3D screen->fb[screen->current];

	drmModePageFlip(screen->fd, screen->crtc, fb,
			DRM_MODE_PAGE_FLIP_EVENT, screen);

This runs for about 3 seconds and then hangs, so the display is no
longer updated. I've also verified that the same happens on Radeon.
But maybe I am mistaken and this isn't the proper programming sequence?

Thierry

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRCOi/AAoJEN0jrNd/PrOhmukP/A3XFv83qAU2kn6TdAYWtAIS
99GjZ9CaX1yEMJRQrakC+fty0NqPutuAoXGu3KPnpun7rwyc+bcssQNFoyDSwvUn
XxBNkl/thxBVlz/iX0FR/kYED4c6cESDRCw8chdccHH/N1EzlS9wAEDbU/4A+IqX
GGNO9HEp0U8QdxvU2IphSO9sAzYe6TVrvDSaAFnwADjp/JUENAlyt9Ak9hPsSXvC
l1cbw8N9GNh0/fQ7dWWskeWCUlyeUj802R2sQpbqlhDM+Xfrx2ipvzVHZFniFu6P
t2toEynDB5jyAl4fnSp7p1ynzerS+IM0RFf/dfvE+8viMd0ijViaZOCP6tGg1uia
f0+zGjttNqauFwVe3TJrvakBK0x/az5g9Y+5E94Q3DNyNq1IK4bWjvFtbGGymXjf
3BSEK7P0D/uusPquU6lZJZY9t8ME+FFG3H6QyH6sY/Td7LadVCJ9QcjJgVb5ES87
VvOtSFAe9oQdWZRkMe3WBZMqVJi3R4ZDHOFgPIOexxNQ2TKVhnC0VpSjgP3DJ/KX
tCJWPHC/rAm/RgFgg3z5ts4n1b6sfbTP36G+47Oy9jSKTgNH2XuSer2zEved2FCn
5pIkD5oEkydXtV4dyLpW5Sph66jEUhRg0RdPcYd1/HRZHxs0749DcrwtzbCC8Mwx
lzdSQFJJVuGJt/opYhx7
=mpgv
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
