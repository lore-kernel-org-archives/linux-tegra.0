From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Thu, 21 Aug 2014 09:19:35 +0200
Message-ID: <20140821071933.GG4486@ulmo>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
 <53EF76CF.9050808@suse.de>
 <53F2255E.7090208@wwwdotorg.org>
 <CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
 <53F28F90.3000004@wwwdotorg.org>
 <CAOesGMhBdQh_ddycZ-Y5dupR9hW74bogHtG3yyPUJ2tAgWi19A@mail.gmail.com>
 <20140820143201.GA3368@ulmo>
 <CAOesGMjFGabNOk0ODjbDN5aaro5309t02+B+UZoM_+q5VE9Ltw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gm5TwAJMO0F2iVRz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjFGabNOk0ODjbDN5aaro5309t02+B+UZoM_+q5VE9Ltw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gm5TwAJMO0F2iVRz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2014 at 08:40:33AM -0700, Olof Johansson wrote:
> On Wed, Aug 20, 2014 at 7:32 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Aug 20, 2014 at 06:29:14AM -0700, Olof Johansson wrote:
> >> On Mon, Aug 18, 2014 at 4:43 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> > [...]
> >> > Again, this board *isn't* Nyan, so it should pretend that it is.
> >>
> >> It is a derivative design of the nyan reference platform, and it is
> >> compatible with it. It is perfectly fine to claim to be compatible
> >> with it. I'm sorry, but you're just wrong here.
> >
> > I guess that depends a little on how you define compatibility. I had
> > always assumed that the top-level compatible string would be a sort of
> > "checksum" over the rest of the content. Which, admittedly, makes it
> > kind of redundant. Compatibility could mean a lot of things. Does it
> > mean any kernel/DTB compatible with one device could run on any device
> > derived from it? Does compatibility mean it needs to provide full
> > functionality or is it still compatible if it runs at a reduced feature
> > set but doesn't "break" otherwise?
>=20
> Consider:
>         compatible =3D "foo,x", "foo,y";
>=20
> My interpretation is:  foo,x is compatible with foo,y if and only if:
>=20
> foo,x can be driven by the same code as foo,y -- i.e. the driver
> doesn't need changes for basic things to work (and nothing should be
> broken).
>=20
> foo,x _can_ be a superset though. It could have features that foo,y
> doesn't have, that needs driver changes to take advantage of. But
> using the foo,y driver with a foo,x device should give you the foo,y
> functionality.
>=20
> The simple case is where foo,x is more or less identical to foo,y, but
> there might be some implementation-specific bugs that makes it useful
> to be able to, at some point in the future, tell if you're running on
> a foo,x or foo,y device even if the code is identical today.
>=20
>=20
> In this particular case, google,nyan and google,nyan-big are very
> similar. There are some differences in panels, etc, but it's described
> in the individual device trees already, but things will come up and be
> functional even if you boot with the wrong device tree (as far as I
> know). Andrew has done that in the past, as far as I know.

The problem with the above that it makes a bunch of assumptions about
drivers. It's perfectly possible for one OS to be implemented in a way
that matches your expectations above, while another OS would not work
the same way.

In particular since you point out panels being different: you typically
can't rely on a driver for one panel to support another panel as well.
While it's true that many panels provide an EDID for the display timings
it's equally well possible that some panels don't, therefore a driver
for one panel can't drive another (because the timings are wrong). There
are other things that can be incompatible between panels such as power
up/down sequences and power supplies. All those together mean that the
panels aren't compatible and I'd argue that the panel is one of the key
features of a Chromebook. Booting a "google,nyan" DTB on a
"google,nyan-big" device may (depending on OS) in fact break
functionality and hence be incompatible.

Thierry

--gm5TwAJMO0F2iVRz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9Z2FAAoJEN0jrNd/PrOhrUYP/jtitwtLAMMWiyAPpDPmwWNi
7oJ7cUY8pT1xwR16YzOKVQ2zqQ4T9uGY2Zc9t7zpFMltgLafMt58V1DqtXjCLheL
OcKBFj/dv+bvzC9FfumXmZVNCbRfFV7/HxysRClxOGc2qxP5ZCK+0wKHnRKVA7y6
VEdFdaWxS2IUfJElM2nlWlt5JlF+/oZl0R+Bjka4oHNAtEVgDD3lTqLv8Ggwd1xI
PV2LapI7mlDMIgZ16XquQ9R9dbJH3pmpBPbEaJUTaojbXWK7gXESvznJqWKKOckd
h/rvaUkoaoz6//XDXzqflKj1IFKhyUn0rY4pLLVnHSfo3+jAvSN9wdaNEYEUX3H+
FLBziz6I1PfTJbk0mTvbs3dLl1jN4demuh/zFgUUyJiOQdkXEYIRvT3AiDXdyoLa
gcLZzKQELkIYl0Q7en8p4G3IfwUEDXlDbgAik76tLBiMDyJbo0cmByvnVuG+N/uN
PM088yQUM2tYDtQSyKo9VbpLdHKmz71bMoKbKFfZJuYb4r1aqyY9ig3unWgHsIGc
CVf4TD24PUvTVdwpwkIEsxorY9cZn6GM1XDFERiDEcAvmp/ZzM6LXdHf7Pr+cdXm
GKJ0Mzr0puzHX9mDaQDTXujJ42COzx/oTcl3kZlo+LX5v0Iq/SUc3n/K4iX2pYk2
03VL0/ooiq2nrxyuBbYO
=HbHd
-----END PGP SIGNATURE-----

--gm5TwAJMO0F2iVRz--
