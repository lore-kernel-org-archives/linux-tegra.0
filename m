From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: tegra: fix hda2codec_2x clock name for Tegra30
Date: Tue, 5 May 2015 13:56:47 +0200
Message-ID: <20150505115645.GB30501@ulmo.nvidia.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
 <4c052b5a83e74b1571409a0a2cee1cc2832095c2.1428700856.git.marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4c052b5a83e74b1571409a0a2cee1cc2832095c2.1428700856.git.marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt@kerne>
List-Id: linux-tegra@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:35:57PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I think this isn't technically required because we're always getting the
clocks via DT phandles. The whole devclks table should be obsolete since
a couple of releases now, but might as well keep it correct until we've
determined that it is safe to remove.

Added a short commit message and applied this for v4.2.

Thanks,
Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSK/9AAoJEN0jrNd/PrOhI5kQAK2wYERYTuei13qZVROxsuEF
sc+b3Zru8v6p3VUMb1f8qnkfLv0rYv+7vNsLK/yBjZ3KbnShKREjTRT7QIqCtMB4
YIDOjLk71F9fKH8jtCUn0UsGI9IWhmFM3pJa9PXJZ7EThSUFEnUeUid2yRQ8449w
+iKaCnbevcWNDN3oJH/rTp18vzcakr1SQzHNiiD6CQp+NjaZjg800MJRNtvHEdvH
2ro/B9Ut8stktXpkyum681sP2LX9nqzaiN1sXB3BfutXGBtYh9DucUpJ16lyKbyW
6nlMZkIJH4rQ7ZUBWyUbVmoQUOIbrD+w02Tl7zrKkQ7a9Ujwljw/ezE8NSjPbBi4
Uwc/17C1gPLcTd3542CjYZjcVFImlUK3Cjg+AcjptNZehpj5Q8lv3nPxU79DDvpy
tU68AgwzX08kte071ckxEHA4duWk1fspN+YCdJbglUs22qAsqycS33IKshVepUBc
T4kSxo/BHFbWO6okWsf98/9qb1twC5uBTeeHbvUB1oI9kCBdKQuVa48hoiE4GGKf
pTmRLR/hX+Mck20DnJQT9PEr1E6e6gWTVf9b0Z0TT7mVTXkMNJgbVo86YdBHYRlN
aj7pbQt/8VGmHIqpwChTaQeCZyKs8LCUVxruBATCZSKSLLkgmlaNmKwIFfZ1G1sB
cIW7FRiwAe7r/eZhgGSF
=wHip
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
