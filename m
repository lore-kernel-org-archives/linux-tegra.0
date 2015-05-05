From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: tegra: fix hda2codec_2x clock name in Tegra124
 device tree
Date: Tue, 5 May 2015 14:08:52 +0200
Message-ID: <20150505120850.GE30501@ulmo.nvidia.com>
References: <cover.1428700856.git.marcel.ziswiler@toradex.com>
 <4d791b76e1b363b2446a2b6a6bfb84869d9f94e8.1428700856.git.marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4d791b76e1b363b2446a2b6a6bfb84869d9f94e8.1428700856.git.marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt@kerne>
List-Id: linux-tegra@vger.kernel.org


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:36:00PM +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
>=20
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I have this exact commit locally in my tree, so I've just taken the
commit message from that and applied this for v4.2.

Thanks,
Thierry

--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSLLSAAoJEN0jrNd/PrOhgZkP/1J1qhlOA/J3UsPupw18/v1T
UjEoHKDaHSkiEBb64UfnoFK1zEMs5d0slAbFavvHi0TsO7oIDoxs2Tokev9LOKKw
fLPHEcxc/h8D3r3zdSu0jqrW3qsEnnOP1nyTpol696QUdbm0ucJykpMF/9Meqfnb
kPsCPDBvQDaZZ6ebOcHfyIG1C60ffCuTNOR0nHDu/Ga4fmXq6XYhTd/Hh4LMolMq
u3OkqdWRNM8uXFmk+1XWEO9QSYsk7ERx1ataW5ddS1vonVn+PxUOnqdfaJTAOQqc
iQDhGKCIzSX9KiBlcXASikgKuf7WffYHg1l6orN+uyf+FrNR21sF9SJWzWs5oKxf
Hupa9ynrkQ9aIu4eeA4sThK1DE+hptPaNInJOooWwIXNAVaNH6uEmzLK4fnJPIuw
YzlXMt/g7wUtYPTs0hO2nUh99yHUu7+quJ+NfjOSYDTHiQBeHJT35acNJyGkMCkK
qbqlwdNyi4YO7ObgIagucmXDXeN9PuDfViGp7fdhjT1rdmhCV108fnw9Gn7Su69C
7r1NxsVc9fP8ItzLCJoopu1QLJ0synZB27dhOjHIs727LYyOghrC02rTquZtBIpn
Bup2u0dFxaIKtr6r2Fg/EfC1iFN/U8ayxNmXl/2F7HyRDgmGmUvJDhLTSTUHiINI
/tv0kVRSLY+AVPIoh/xU
=ZiKi
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
