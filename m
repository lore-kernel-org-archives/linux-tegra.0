From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Wed, 18 Sep 2013 19:28:42 +0200
Message-ID: <20130918172842.GA3095@katana>
References: <1416005.VvfEeGuSWa@ax5200p>
 <2910047.nJ4yDntMXS@ax5200p>
 <51F97B92.1040707@wwwdotorg.org>
 <17687182.lGWlO75r41@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <17687182.lGWlO75r41-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It looks like that the i2c subsystem needs some modifications to allow to=
=20
> specify a master device which is attached to a slave controller. Maybe so=
meone=20
> from the i2c folks (cc'ed) can comment on this?

The linux i2c core does not really support controllers being a slave.
There are probably some more obstacles on the way if you want to do
this, depends on what you want to do.


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSOeLKAAoJEBQN5MwUoCm2U1UP/iDoMYueK0ePb5NObIipGPtU
RbbcnWrI76prkJkIFisVkWwo58hVS3LISIK/o18gCSEX8HzNr6TyeljGm9nsEuSU
0RTft3EMya8qnpxb3Ok/QwkMfOQ3mDNCYoBRCmCeGNxMwsv2E0gUluXT+m9Gg6Nt
ji/UrINMr11p5Bjr7t9Egz5zGFNg/znE4ayL4FBe1gRuLZaA+yaj2clVHLaB+lAe
lM7rH2zw18uKlW04G2ZCe5WM6smmzVtSd5CEfkbBqtQRI5cibLzWP1pCvIHlPciq
i+J8+CEQDmrs6pK0yYmIreREJbBQWzzL/TSALyagcojTev7H5rIfEJ/7RgTBMKzx
GxYpQWLVNaC+0tYK1d4mKUsw1kT9g8LZ89/x/Qv/oWMUsKb8D+UFDUFJ/ZCODo9C
ktqXOeRKmQqEO/9O/XB/oBtK486kDS7P7hQuXowPDjQ/TPCXK4K74h1O1VRF+5ha
drQG97cDgbuy9IRwjviN0av7X53VCox4eb/LvmPqKIsFcR1tjJ/MFTgvdyk4K+9L
5ilQaPp7N8O8vSUIeoJIXY71q4O9DJ9GTQ4HaHY7jB7wQU5e2YRR3k5Iim5kIEKI
OLNndwvsnF2V57Ii++Y+nQuDYwIwFeffbGkXhMY9plokn9FJ8XFHzwDsfZ4V3+tL
D+mWmrZzxjAJMDPviYLQ
=F1L/
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
