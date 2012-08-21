From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 16:57:09 +0200
Message-ID: <20120821145709.GA701@avionic-0098.mockup.avionic-design.de>
References: <50323513.3090606@nvidia.com>
 <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de>
 <1345527561.31608.152.camel@markz-desktop>
 <20120821054256.GA5325@avionic-0098.mockup.avionic-design.de>
 <1345529761.31608.169.camel@markz-desktop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345529761.31608.169.camel@markz-desktop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 02:16:01PM +0800, Mark Zhang wrote:
> On Tue, 2012-08-21 at 13:42 +0800, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, Aug 21, 2012 at 01:39:21PM +0800, Mark Zhang wrote:
> > > On Mon, 2012-08-20 at 21:18 +0800, Thierry Reding wrote:
> > > > I have a new patch series that takes care of these two steps. Mark =
sent
> > > > some patches for Tegra30 and HDMI on top of the older series that I=
 need
> > > > to merge with what I have. Maybe I'll decide to send the series out
> > > > without the patches merged, depending on how much time I'll get or =
how
> > > > much effort it requires. I had hoped the next series would have wor=
king
> > > > HDMI support, which is why I waited.
> > >=20
> > > OK. So I'm going to pause the patch writing right now and wait for yo=
ur
> > > codes to be published on linux-tegra. Regardless of whether my patches
> > > be merged into yours, I'll provide patches for the version which you
> > > send to maillist in the near future.
> >=20
> > Let me see if I can upload my patches to the repository on gitorious.
> > I'm not sure when exactly I find time to merge your patches, and I don't
> > want to hold you up.
> >=20
>=20
> All right, thank you. Let us know when you finish uploading.
> By the way, any updates from freedesktop?

Finally the upload is done. You can find my latest work in the next
branch of the following repository:

	git://gitorious.org/linux-tegra-drm/linux-tegra-drm.git

It's down to two patches and based on next-20120820. Eventually I was
going to maybe split it up a bit to separate at least the hunks for
arch/ (Stephen will probably want this anyway) and maybe also some
functionality like HDMI support.

Mark: If you find the time it'd be great if you could rebase your
patches on top of that branch. I think for a first submission to
mainline some things probably need to be cleaned up and the history
should probably be clean, so we may want to squash some of the patches
that you sent into the existing ones. For now it's probably best if you
continue your work on top of this.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQM6HFAAoJEN0jrNd/PrOhjOkQAJLuu55AaftGvxylKiAx8kw/
2dw1tS592YE77jm8n80zjn6yNjbj6G/6zqO8tAEx1mwFja1Id75d4rkjwX2UXqaG
JHQwelMAk0hZ6gm2ZSw0LWy7XdO/g9m489UwI9SSlbBshdfd8c6s3mgjKZVjIr/u
vIAJsRwQ/gZCl0GMQc21P5+ZZD9pzZpyjs6jho0ypJmdJx7qpiutrRHbaWPJQAq6
tMsYvwacOa7EaUHe0RuEC8bBYJm9WmKB3J0fuRWRXp/dhtGY+b6Jcu5bfX4U6U1N
WYqyWZY3p3DOd4UpkFu5z/cIeAgFdpn5viKWpRQdiDu4NCGOAc1AYVWPbpZzLxvQ
SPAdon9S5YdrFA69D4LmqML0NVg+fEff6C0RjRhvCafD4oXG94AvrW0qKf62cHiT
r5LTHSWvzSDWrXx1/618x9gSETJhWdxOjY6FT31qrXzH3Vmp7OKUr8t9BwHSSYMv
NDmpC9mAuS45uJO+rWGXZ9y2CAmz+KHNwQEvkiu9irHw6C07b0695UxglVDIHXA1
ATOUkf9aperAxzljN3gdRgL5nmwuH36EMTzcPqvuz2nigqvOdgM1SKOYUpOyokcY
5d6MLSw+sVArOpMceqlTLFv8qB44HvTR/f6BT8rvDeO9KftCD4sOH3JvtENOsLoR
4rvyL3CHHCwC89ZRBG8/
=H7DE
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
