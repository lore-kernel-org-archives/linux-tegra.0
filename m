From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: tegra_defconfig: Enable options useful for
 Nexus 7 and Acer A500
Date: Tue, 7 Apr 2020 12:08:29 +0200
Message-ID: <20200407100829.GB1720957@ulmo>
References: <20200406194110.21283-1-digetx@gmail.com>
 <20200406194110.21283-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200406194110.21283-7-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pedro =?utf-8?Q?=C3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2020 at 10:41:10PM +0300, Dmitry Osipenko wrote:
> Enable several drivers for hardware that is found on Nexus 7 and Acer A500
> tablet devices. Please note that some drivers may require firmware files
> extracted from original Android image.
>=20
> Link: https://github.com/digetx/linux-firmware

What's the license for these files? Can they be made available through
the official linux-firmware repository?

Thierry

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6MUR0ACgkQ3SOs138+
s6GEow/+PCRBWMRHZqrLzXaBLfVmbh6Jl87RzDZcnbNzyKRyQvcbBcaPWsXf9tLh
LlXh/OInkWgYIfU+Skqi0BmHHATWq+XfHzLzQfkkujSAa8QafRKVtGTV0e+beQFD
2BrixFkH0TllbiYxaDdu9iZXxW0+/Bx5s/9AZYQFNerWoQ3NqqqrFhXNcyAbbVUO
Y46sRJy0uCNObGlyUdKCupug8fbyciPSzbhYIE2ZWmjSIKzJNPCgk/FlJrQRcyRu
5bcWkS7uwedPwmuzQMQrOW2m0FYOZ+UU01aMur7s7mPNp0cFY4dZlI/hzO3JDh4W
oTOvtjnlJodHnaQlDQijCQtukKDiTfiOlU4ZfXna6cN1T2fzaYNaCLRPWzhu4K23
1F3UTp6+UXGF2+H83jeAgcpKHGmkXrNjn4KNIDt6rIMyEnz2RJ8II4wYhJH/Oza1
Lbf+26X650r2CwOAUhSyDtAgo2Mt58GTDztVMIJStpap3A+UT+clWmoG+eYOZGMR
mVBL9UWowL1dkvjrjXmlOsqcN0OfWtmazA2rQAurS0NU2Aq1hoffcx73gWCJE5B/
9z0RHHQUUVMGFNSYQiZxpTIKsBIu+iTHZ99q29RPBK5wye5sIKjFTogylTvzh6wk
78XF5M1Ndf+6LQaxvgNXHZsGkb1sdjAgbz1f2JMQmDrtSH7RNoc=
=kOsC
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
