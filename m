From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Enable CPUFreq support for Tegra124
 Chromebooks
Date: Tue, 15 Sep 2015 10:12:36 +0200
Message-ID: <20150915081234.GA25970@ulmo.nvidia.com>
References: <1433331821-9648-1-git-send-email-jonathanh@nvidia.com>
 <556EE8B0.2060205@nvidia.com>
 <55A3B848.2080205@nvidia.com>
 <CAAObsKA0N50gfPA9sMZfnM8N+N9Oo-YHMCDdF7JdWjpxXtFJbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAObsKA0N50gfPA9sMZfnM8N+N9Oo-YHMCDdF7JdWjpxXtFJbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 03:40:45PM +0200, Tomeu Vizoso wrote:
> On 13 July 2015 at 15:08, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > On 03/06/15 12:44, Jon Hunter wrote:
> >> Adding LAKML. Jon
> >>
> >> On 03/06/15 12:43, Jon Hunter wrote:
> >>> Add the device-tree DFLL clock node and CPU regulator phandle for
> >>> tegra124 chromebooks to enable CPUFreq support on these boards.
>=20
> Ping.
>=20
> Thanks,

Sorry that this has gone unnoticed for so long. I've applied it now to
the for-4.4/dt branch.

Tomeu, do you want me to add your Tested-by, Reviewed-by or Acked-by
before I push this out?

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV99LyAAoJEN0jrNd/PrOhATEP/2FdbfboUI6GbZn+RYMqtNed
CsJGuX9JblaLdoAbeTfbN4VnJmkdnIDNFLZslDn/dB7Vg7WVt/x5FMCUsD0+j1/5
0svEwUbmwKaavJkBL7kCg7bTlx1dzYCUZ0Ykbx9Gexqgh5vvqwR/xMIj4BcX+dic
EJp4NKYhBox+TOT1IJNK64Tv6YR3UL5qivCIIWamnbue1muH5GzYNvJ/LsW1JWi7
nmjFP9TEU5GRModQkD4MGbD6JCvjTwFWc9bNmkbGmHzjQcEdxo+jkaiGSHwE1QxI
fsNYv0B9murTMa8xITPxKX3LbuEWY1wGICTTwLuxXyEwnFPvGzW5zSvBvBffia8w
tKbyWQ+I4snKQANOqhvtrtQfnz5eMb9/MRb7zqf2T1TzICw9lSjLR9MY6btopUa7
I5hFA4RZf66nnbXmxeVuPBegnI9d1JfZZqGPAnmjOR4yhtqjXApxzyHYbLvwuyUb
VIm7VA2e3pWgd2OHniOrQDcq3JPfbWCZnZ7+sMZhboUpFclCwdA7oBq4UptlSdWt
dP4f7AkLvglb6SgXM/61C3tqvRzcPtn8KrAlyP0veKOncoXGChU8LK+ZUHTHdyar
lQfpqK0pQ++/SF5GRsP3s7/pUQVJ+RbsZloiKk87mxO3v7VrseKbwgPbSDuwuLi7
/KZyHjGY6OM7GAykp8FP
=DPCC
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
