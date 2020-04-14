From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code
 for Tegra210
Date: Tue, 14 Apr 2020 22:03:11 +0200
Message-ID: <20200414200311.GD15932@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
 <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
 <20200414154526.GP3593749@ulmo>
 <e050baee-89cb-dba1-544e-77b1662ac6b7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e050baee-89cb-dba1-544e-77b1662ac6b7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 07:27:43PM +0300, Dmitry Osipenko wrote:
> 14.04.2020 18:45, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> What about to try to replace this massive egyptian construction with a
> >> single "u32 val;" ?
> >=20
> > I actually tried that after condensing what this used to look like into
> > the above. The result was a huge failure because some of these temporary
> > values end up being reused, so I ended up writing bogus values into some
> > of these registers.
>=20
> It should be fine to keep those variables that are getting re-used. It
> looks like there are much more variables that are never re-used, and
> thus, they could be replaced.

Okay, I made another pass over it and it looks slightly better now. I've
kept a couple of the "option"-type variables that are constant but in my
opinion make the code more readable compared to hard-coding them. In the
cases where I kept them, I declared them constants, so the compiler will
hopefully be able to optimize the code and their purpose should also be
clearer.

Thierry

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6WFv0ACgkQ3SOs138+
s6FzPBAAsxspbLBGVMeeFtVE44f5t8cfCBGGqafBdGqgKya9ZWRdsHhEsusz+GxT
aqf7mRltFdusi9G66Sc2gq/YgFkC4cZJ+jWXoaUf+GCh85/zUBobWJxuL3BAYLS+
+1nxcoPGekN+Vux0NpGT2o1TYOFY4tF8SN7MJjm6+6dStevEerMRopmrn6YdICng
YCbAoQhocSmmAgLOfXfwyXZqpShCrBBsW1hZnQLKZWwzCjHo20WuAqSWQtL/Izsr
4LSK1YZc8TRKZw7P4VBVirzAIibR8NemHTCfftksjcBbKGl/ya/c5s6c5xntKYoc
tszI33NOqlLXt3udgxcGtXUoGe9swC+oKcf5iCQIh72xazbJZrLkigvh3HzS+Ct4
nb9IaPrik+iWv8jupxpKdbCCD/IgxR8KDCnNcLnSIOacqTpxMIPWP7L266ifOHkc
2qmdvCD/n6I2CizHgINLaZzPcw99AdJ60lZQgelPtcMQ7gwefb8Zh4OhjuCTt4Os
rJqhMAJ3lfK8cdK8OrcjNgDPKi1+avp9Srm10dXpyats0MPJgpNO7g6v9wwMN3zN
cwDTJGCLezBG6oNwsxJLnCX1OflOZTa+STTOGvfndsWk7QJ5PmYXcBmY8grxSEiB
3zhbpRaOdVtut6WAGQ8c+tgx5UXGVtj2TwmPgtySlc1jdltV3Bg=
=ofH1
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
