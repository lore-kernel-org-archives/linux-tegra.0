From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/31] clk: tegra: implement a reset driver
Date: Fri, 29 Nov 2013 14:26:19 +0100
Message-ID: <20131129132618.GT22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-8-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k8r0khnpBuGu0wUi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-8-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k8r0khnpBuGu0wUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:02PM -0700, Stephen Warren wrote:
[...]
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-teg=
ra114.c
[...]
> -	clks =3D tegra_clk_init(TEGRA124_CLK_CLK_MAX, 6);
> +	clks =3D tegra_clk_init(clk_base, TEGRA124_CLK_CLK_MAX, 6);

This doesn't really concern this patch, but this is inconsistent with
the drivers for other generations. We should probably make that
consistent in a separate patch.

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c

> +static int tegra_clk_rst_assert(struct reset_controller_dev *rcdev,
> +		unsigned long id);
> +static int tegra_clk_rst_deassert(struct reset_controller_dev *rcdev,
> +		unsigned long id);

Can you reorder the code so that these forward-declarations can be
avoided?

>  /* Global data of Tegra CPU CAR ops */
>  static struct tegra_cpu_car_ops dummy_car_ops;
>  struct tegra_cpu_car_ops *tegra_cpu_car_ops =3D &dummy_car_ops;
> @@ -70,6 +77,17 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
> =20
> +static struct reset_control_ops rst_ops =3D {
> +	.assert =3D tegra_clk_rst_assert,
> +	.deassert =3D tegra_clk_rst_deassert,
> +};
> +
> +static struct reset_controller_dev rst_ctlr =3D {
> +	.ops =3D &rst_ops,
> +	.owner =3D THIS_MODULE,
> +	.of_reset_n_cells =3D 1,
> +};

It looks like these can be moved further down (below the implementation
of tegra_clk_rst_assert() and tegra_clk_rst_deassert()). I rather like
not having to modify two locations when the signature changes, but it's
not that big a deal, so with or without that fixed up:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--k8r0khnpBuGu0wUi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJX6AAoJEN0jrNd/PrOhjOIP/3h7WiV1UmbW4cCQBtWbYTQq
dxRcMPCbv1gHezK53r1txwP6cMXo5GIfuT9iX4qcbU3Yey3ybuJWFaK6jy/ITt45
b3lxNLJrhVmhhsrnh8P+9BQD3y6Of1ATxiY0v5ue1IXoQC583twucc43Um4HFUpf
EqqmMYzyq4L4xI14isFKwWNGOpTRM5MRcvUOevv2s+XxmRgQ5FnO9OjOP5Iu9UuF
9xNWJ5quM9Nx06VSlRGgdR+sb55INmvAEATkudrVpPG90rLrJHuL3eWG/h50iNEj
Kqr66WacHxhprXJTg9C0pQtxktxDm0QfG3jKLCXs9v6hz2TJwtvDvUYviJ+uiFYj
xH9fBOln3PYuzTeobgXPlHbjiXk1fx4UCcbqRwrsg924EkoITHl1UXD/8lwibDhm
PVVDNm6s+f9ICuVcNN74eVq+I3MeF7PWxew+E58sqNKMmApClT5IqUnJlRH21m0I
HxVDeU+aYvxPWdtP9xrlH32sfkZS/uzhVll7NZu/+8BmRryqdNRoTkBXamvGwQnd
O3pSP+4XaXwULfY3OAKwMBoQx14cGaC4HJpyhqLbh8IeKchV9UxpgPTm3Ph1tuz+
oiafFdKdFmAGFj/b0oNuq8luhLwL/9SjGImGrLIMNUl9Al/cibIxAGnkGgkNDEX/
NiozafdRCYnHUq3p76e+
=OhT3
-----END PGP SIGNATURE-----

--k8r0khnpBuGu0wUi--
