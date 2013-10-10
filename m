From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] clk: tegra: Add periph regs bank X
Date: Thu, 10 Oct 2013 12:43:07 +0200
Message-ID: <20131010104306.GB6735@ulmo.nvidia.com>
References: <1380878014-22088-1-git-send-email-pdeschrijver@nvidia.com>
 <1380878014-22088-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380878014-22088-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 12:12:41PM +0300, Peter De Schrijver wrote:
> Tegra124 has an extra bank of peripheral clock registers. Add it to the
> generic peripheral clock code.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index c8c84ce..0240dc3 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -57,6 +57,8 @@
>  #define RST_DEVICES_CLR_V		0x434
>  #define RST_DEVICES_SET_W		0x438
>  #define RST_DEVICES_CLR_W		0x43c
> +#define RST_DEVICES_SET_X		0x290
> +#define RST_DEVICES_CLR_X		0x294

Perhaps sort these numerically rather than alphabetically? Also I don't
see where the CLK_OUT_ENB_X, CLK_OUT_ENB_{SET,CLR}_X or RST_DEVICES_X
registers are defined. Perhaps they were part of some other patch or a
series that this depends on?

> =20
>  /* Global data of Tegra CPU CAR ops */
>  static struct tegra_cpu_car_ops dummy_car_ops;
> @@ -109,6 +111,14 @@ static struct tegra_clk_periph_regs periph_regs[] =
=3D {
>  		.rst_set_reg =3D RST_DEVICES_SET_W,
>  		.rst_clr_reg =3D RST_DEVICES_CLR_W,
>  	},
> +	[5] =3D {
> +		.enb_reg =3D CLK_OUT_ENB_X,
> +		.enb_set_reg =3D CLK_OUT_ENB_SET_X,
> +		.enb_clr_reg =3D CLK_OUT_ENB_CLR_X,
> +		.rst_reg =3D RST_DEVICES_X,
> +		.rst_set_reg =3D RST_DEVICES_SET_X,
> +		.rst_clr_reg =3D RST_DEVICES_CLR_X,
> +	},
>  };

Thierry

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSVoS6AAoJEN0jrNd/PrOh+JcP/R7i6KO0eQ3qB8atCTy882V0
7BiM7uvauXCnqJcEL2t6S+FWiCR2yQ9I3fhYLxbuzk+mCNHDGYkCyOx8DJLMJIQ7
wppZ+E4wxxoy8VvkShPoM/Uacf8JfMaRtqDtFpgM+UE1TS36OIrzY1efZ8F3xgVL
/UeEhQWpYJysT7qTWYNr3IkmD2I2Rx/0x4BnuAdEOYiTXOux/pjFHu8vQjT19XnB
Y+IGhm5U64WzaoUEXSt1IQYPXHrQVvKsF8YfHt7OrBgaQZg/qZ49Q2BJenz0dxQ+
RCcpZuKRgxDGAWWRqGk1F2M0Ulm4bjDNZfX1NtIFAjb3UJifUCVCbTiyPd0RTdO8
0dhOhdNUZ2iGGhO54WMLJ+XDUZZxWi7QF6n04y3e3U/Yr7oY7MFt2VPaulAW5/yI
cbM4zMYZyy2arav6SghpYBkEXfmLXJcJbPgRhwacK0Zk/W0Cwf1Mnbt4fKODhipr
m8kbJL4asS3hj9Bb4cL12ir8Wevl6xzT258+/6ffc65Y2Jxp3kPKDssv+gfKzdU7
RJiwTtWRoKiG0aJWqP+Y5BgHUeAgT7iaTO3aQBZPFO70VwBw4mfujfCmXDxRCIvy
uRkpofKb/9oquZVM5LaowgxxUHHSLMBqHoiTri2npwocvcqj2OomH5RjTsib/C+r
jYWmbEM8klgbndDvheLX
=Xdo5
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
