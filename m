From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: tegra: fix blink clock rate
Date: Fri, 29 Nov 2013 16:22:42 +0100
Message-ID: <20131129152241.GM9712@ulmo.nvidia.com>
References: <1384991242-13596-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x38akuY2VS0PywU3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384991242-13596-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--x38akuY2VS0PywU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 04:47:18PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The blink clock rate needs to be configured, or it will run at ~1Hz
> rather than the desired 32KHz. If it runs at the wrong rate, e.g. the
> SDIO WiFi on Seaboard and Cardhu will fail to be detected.

How is this related to WiFi?

>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This probably needs to be squashed into commit 32721a734a3d "clk: tegra:
> move PMC, fixed clocks to common files".
> ---
>  drivers/clk/tegra/clk-tegra-pmc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-te=
gra-pmc.c
> index 00e8275a7178..08b21c1ee867 100644
> --- a/drivers/clk/tegra/clk-tegra-pmc.c
> +++ b/drivers/clk/tegra/clk-tegra-pmc.c
> @@ -114,6 +114,7 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
>  	}
> =20
>  	/* blink */
> +	writel_relaxed(0, pmc_base + PMC_BLINK_TIMER);
>  	clk =3D clk_register_gate(NULL, "blink_override", "clk_32k", 0,
>  				pmc_base + PMC_DPD_PADS_ORIDE,
>  				PMC_DPD_PADS_ORIDE_BLINK_ENB, 0, NULL);

Perhaps a better location would be a few lines below, where the "blink"
clock is registered, since this actually controls the "blink" clock
rather than "blink_override". But either way:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--x38akuY2VS0PywU3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmLFBAAoJEN0jrNd/PrOhAxkQALP7GPCyLs7/aUY0JzrgpJ6t
+hnTeIf5p+W7Xkd9B3/VjvOvpoo0zKH/sSIIbdQThvO8qa/sXrMstdbcuOUUs2il
/IzrXGmKRDKRGdZI5L6m0ioQFBb1heHRU0HJe5ScTBcsHls8fADZoKONLCf3teiG
HU4sB/PkrPhurx1bdehy+Z+EZuKcAWUKsZLCP3MB9PETCo+Ry48abDJnJkzfE3mC
oU+n/VNvjaluHYp6yUmUbroDMJJErJwmEgbcngdbVjUOEy41zJLhA4dXOi4rfUlz
eKgTmL5eN92G46q2JIunhdbmRWeyHIRGZU4/beALnK496owCsmFAu+HpGTwsIUkQ
jSVLdXllHhOaF1weyBz/RpNulnrf9uOco6jJAo8N7OcA00wZrdM9LUYCI2gBwfQg
cLZa3ypKyCVKzrZDsHTTe8T9Gx6dpR6utJ/gDXiQ/104YTTzhQ7YhhYR1l+STrNK
K2cbjk23aE64EPYzZV2sdwpWQ9ly8195U15cVbyu2PJZQJ62+9Lh+xCswkRArx4g
rHJGS4qlpxG5gILZujx4FH/bUujA+/oKIDQlpVaaMplpw5VUkFjKLMBbYRoN76wi
dxDcKj4qK9DSkkz2VJEx4yJg9i/z3PK8iHDd7wQH/sIcH3HjrSeQvIIdyeOLi+sJ
qsu2PhGlzomYSuSUUhWH
=IUD3
-----END PGP SIGNATURE-----

--x38akuY2VS0PywU3--
